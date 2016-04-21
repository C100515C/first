//
//  ViewController.h
//  CCTest
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;
@interface ViewController : UIViewController
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSString *test;

+(instancetype)share;
@end

