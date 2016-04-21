//
//  LYJDBManager.h
//  IMTest
//
//  Created by chenchen on 16/3/11.
//  Copyright © 2016年 chenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBModel : NSObject
@property (nonatomic,assign) int tb_id;

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *gender;

@end

@interface LYJDBManager : NSObject

+(LYJDBManager*)getSharedInstance;

-(BOOL)createDBWith:(NSString*)tableName With:(NSArray*)param;

-(BOOL) saveData:(NSString*)sql withParam:(NSArray*)params;

-(NSArray*)findBySql:(NSString*)sql andFindKey:(NSString*)key andTabid:(NSString*)tabid withParams:(NSArray*)params;

-(BOOL)deletBySql:(NSString *)sql andKey:(NSString*)key andTabid:(NSString*)tabid withParams:(NSArray*)params;

-(BOOL)updateWithSql:(NSString*)sql andUpdateName:(NSString*)keyid and:(NSString*)tabid andParams:(NSArray*)params;

/***************************model 转换 param****************************/
+(NSArray*)getParamArrWith:(id)model;
+(NSArray*)getPropertyAndValueWith:(id)model;
/***************************sql*************************/
/*
 创建表
 */
+ (BOOL)createTableWithSql:(NSString *)sql;

/*
 插入数据
 */
+ (BOOL)insertTableWithSql:(NSString *)sql params:(NSArray *)params;

/*
 查询数据(数组)
 */
+(NSArray *)queryForArrayWithSql:(NSString *)sql Params:(NSArray *)params;

/*
 更新数据
 */
+(BOOL)updateTableWithSql:(NSString *)sql Params:(NSArray *)params;


/*
 删除数据
 */
+(BOOL)deleteTableWithSql:(NSString *)sql Params:(NSArray *)params;

/*
 获取包装后的Text类型参数
 */
+(NSArray *)getTextParamsByArray:(NSArray *)valueArray;

@end
