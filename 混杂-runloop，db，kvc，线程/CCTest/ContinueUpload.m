//
//  ContinueUpload.m
//  CCTest
//
//  Created by MS on 15-12-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ContinueUpload.h"

static ContinueUpload *_download;
static NSMutableDictionary *_dictPath;
static NSMutableDictionary *_dictBlock;
static NSMutableDictionary *_dictHandle;
static unsigned long long _cacheCapacity; // 缓存
static NSMutableData *_cacheData;

typedef void (^myBlcok)(NSString *savePath, NSError *error);

@interface ContinueUpload ()<NSURLConnectionDataDelegate>
@end

@implementation ContinueUpload

+ (void)initialize
{
    _download = [[ContinueUpload alloc] init];
    _dictPath = [NSMutableDictionary dictionary]; // 存储文件路径
    _dictBlock = [NSMutableDictionary dictionary]; // 存储block
    _dictHandle = [NSMutableDictionary dictionary]; // 存储NSFileHandle对象
    _cacheData = [NSMutableData data]; // 存放缓存
}

+ (void)downLoadWithURL:(NSString *)urlStr toDirectory:(NSString *)toDirectory cacheCapacity:(NSInteger)capacity success:(DownloadServiceSuccess)success failure:(DownloadServiceFailure)failure{
    
    // 1. 创建文件
    NSString *fileName = [urlStr lastPathComponent];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", toDirectory, fileName];
    
    // 记录文件起始位置
    unsigned long long from = 0;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){ // 已经存在
        from = [[NSData dataWithContentsOfFile:filePath] length];
    }else{ // 不存在，直接创建
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    // url
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
    
    // 设置请求头文件
    NSString *rangeValue = [NSString stringWithFormat:@"bytes=%llu-", from];
    [request addValue:rangeValue forHTTPHeaderField:@"Range"];
    
    // 创建连接
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:_download];
    
    // 保存文章连接
    _dictPath[connection.description] = filePath;
    
    // 保存block,用于回调
    myBlcok block = ^(NSString *savePath, NSError *error){
        if (error) {
            if (failure) {
                failure(error);
            }
        }else{
            if (success) {
                success(savePath);
            }
        }
    };
    _dictBlock[connection.description] = block;
    
    // 保存缓存大小
    _cacheCapacity = capacity * 1024 * 1024;
    
    // 开始连接
    [connection start];
}
/**
 86  *  接收到服务器响应
 87  *
 88  *  @param connection 哪一个连接
 89  *  @param response   响应对象
 90  */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 取出文章地址
    NSString *filePath = _dictPath[connection.description];
    
    // 打开文件准备输入
    NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    // 保存文件操作对象
    _dictHandle[connection.description] = outFile;
}
/**
 103  *  开始接收数据
 104  *
 105  *  @param connection 哪一个连接
 106  *  @param data       二进制数据
 107  */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 取出文件操作对象
    NSFileHandle *outFile = _dictHandle[connection.description];
    
    // 移动到文件结尾
    [outFile seekToEndOfFile];
    
    // 保存数据
    [_cacheData appendData:data];
    
    if (_cacheData.length >= _cacheCapacity) {
        // 写入文件
        [outFile writeData:data];
        
        // 清空数据
        [_cacheData setLength:0];
    }
}
/**
 128  *  连接出错
 129  *
 130  *  @param connection 哪一个连接出错
 131  *  @param error      错误信息
 132  */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // 取出文件操作对象
    NSFileHandle *outFile = _dictHandle[connection.description];
    
    // 关闭文件操作
    [outFile closeFile];
    
    // 回调block
    myBlcok block = _dictBlock[connection.description];
    
    if (block) {
        block(nil, error);
    }
    
    // 移除字典中
    [_dictHandle removeObjectForKey:connection.description];
    [_dictPath removeObjectForKey:connection.debugDescription];
    [_dictBlock removeObjectForKey:connection.description];
}
/**
 154  *  结束加载
 155  *
 156  *  @param connection 哪一个连接
 157  */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 取出文件操作对象
    NSFileHandle *outFile = _dictHandle[connection.description];
    
    // 关闭文件操作
    [outFile closeFile];
    
    // 取出路径
    NSString *savePath = [_dictPath objectForKey:connection.description];
    
    // 取出block
    myBlcok block = _dictBlock[connection.description];
    
    // 回调
    if (block) {
        block(savePath, nil);
    }
    
    // 移除字典中
    [_dictHandle removeObjectForKey:connection.description];
    [_dictPath removeObjectForKey:connection.debugDescription];
    [_dictBlock removeObjectForKey:connection.description];
}
@end

