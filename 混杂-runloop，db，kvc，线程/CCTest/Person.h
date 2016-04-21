//
//  Person.h
//  CCTest
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *job;

-(id)initWith:(NSString*)name and:(NSString*)age and:(NSString*)job;
+(instancetype)share;
+(Class)createClass;
- (void)myclasstest:(int)a;
@end
