//
//  ContinueUpload.h
//  CCTest
//
//  Created by MS on 15-12-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DownloadServiceSuccess)(NSString *savePath);
typedef void (^DownloadServiceFailure)(NSError *error);

@interface ContinueUpload : NSObject
/**
 16  *  下载指定URL的资源到路径
 17  *
 18  *  @param urlStr   网络资源路径
 19  *  @param toPath   本地存储文件夹
 20  *  @param capacity 缓存大小，单位为Mb
 21  *  @param success  成功时回传本地存储路径
 22  *  @param failure  失败时回调的错误原因
 23  */
+ (void)downLoadWithURL:(NSString *)urlStr toDirectory:(NSString *)toDirectory cacheCapacity:(NSUInteger)capacity  success:(DownloadServiceSuccess)success failure:(DownloadServiceFailure)failure;

@end

