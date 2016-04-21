//
//  Person.m
//  CCTest
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person ()<NSCoding>

@end

@implementation Person

+(id)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    static Person * person  = nil;
    dispatch_once(&onceToken, ^{
        if (person==nil) {
            person = [super allocWithZone:zone];
        }
    });
    return person;
}

+(instancetype)share{
    return [[self alloc] init];
}

-(id)initWith:(NSString*)name and:(NSString*)age and:(NSString*)job{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.age = age;
        self.job = job;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
   
    NSString *aD_name = [aDecoder decodeObjectForKey:@"name"];
    NSString *aD_age = [aDecoder decodeObjectForKey: @"age"];
    NSString *aD_job = [aDecoder decodeObjectForKey: @"job"];
    
    self = [self initWith:aD_name and:aD_age and:aD_job];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.job forKey:@"job"];
    
}

+ (Class)createClass
{
    Class MyClass = objc_allocateClassPair([Person class], "myclass", 0);
    //添加一个NSString的变量，第四个参数是对其方式，第五个参数是参数类型
    if (class_addIvar(MyClass, "itest", sizeof(NSString *), 0, "@")) {
        NSLog(@"add ivar success");
    }
    //myclasstest是已经实现的函数，"v@:"这种写法见参数类型连接
    class_addMethod(MyClass, @selector(myclasstest:), (IMP)myclasstest, "v@:");
    //注册这个类到runtime系统中就可以使用他了
    objc_registerClassPair(MyClass);
    //生成了一个实例化对象
//    id myobj = [[MyClass alloc] init];
//    NSString *str = @"asdb";
//    //给刚刚添加的变量赋值
//    //    object_setInstanceVariable(myobj, "itest", (void *)&str);在ARC下不允许使用
//    [myobj setValue:str forKey:@"itest"];
//    //调用myclasstest方法，也就是给myobj这个接受者发送myclasstest这个消息
//    [myobj myclasstest:10];
    return MyClass;
    
}
//这个方法实际上没有被调用,但是必须实现否则不会调用下面的方法
- (void)myclasstest:(int)a
{
    
}
//调用的是这个方法
static void myclasstest(id self, SEL _cmd, int a) //self和_cmd是必须的，在之后可以随意添加其他参数
{
    
    Ivar v = class_getInstanceVariable([self class], "itest");
    //返回名为itest的ivar的变量的值
    id o = object_getIvar(self, v);
    //成功打印出结果
    NSLog(@"%@", o);
    NSLog(@"int a is %d", a);
}


@end




 