//
//  CustomAlertView.h
//  CCTest
//
//  Created by MS on 15-12-22.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAlertViewProtol <NSObject>
//点击按钮执行回调   btnname 10 为确认   11为取消   content 为输入内容
-(void)btnClickActionWitnTag:(NSInteger)btnName andTextField:(NSString*)content;

@end
@interface CustomAlertView : UIView

// titile  为提示框标题  des 为提示框描述  frame 随意传 参数未用  delegate 遵守协议对象
-(id)initWithFrame:(CGRect)frame andTitle:(NSString*)title andDes:(NSString*)des andDelegate:(id<CustomAlertViewProtol> )delegate;

@end
