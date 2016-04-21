//
//  CustomAlertView.m
//  CCTest
//
//  Created by MS on 15-12-22.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "CustomAlertView.h"
#import "CustomAlert.h"

@interface CustomAlertView ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, strong) CustomAlert *alert;
@property (nonatomic, assign) id <CustomAlertViewProtol> delegate;

@end

@implementation CustomAlertView


-(id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDes:(NSString *)des andDelegate:(id<CustomAlertViewProtol>)delegate{
    self = [super initWithFrame:frame];
    
    if (self) {
        _title = title;
        _des = des;
        _delegate = delegate;
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
        [self addGestureRecognizer:tap];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.frame = [UIScreen mainScreen].bounds;
        [self createAlert];
        
    }
    return self;
}

-(void)createAlert{
    
    CustomAlert *alert = [[[NSBundle mainBundle ] loadNibNamed:@"CustomAlert" owner:nil options:nil] firstObject];
    [self addSubview:alert];
    _alert = alert;
    
    alert.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/3.0);
    
    alert.title.text = _title;
    alert.des.text = _des;
    
    __weak typeof(self) weakSelf = self;
    [alert setSureBtnActionBlock:^(btnName name) {
        
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(btnClickActionWitnTag:andTextField:)]) {
            [weakSelf.delegate btnClickActionWitnTag:name andTextField:_alert.inputText.text];
            [weakSelf removeFromSuperview];

        }
        
    } andCancelBlock:^(btnName name) {
        
        [weakSelf removeFromSuperview];
    }];
    
}

-(void)viewTap:(UITapGestureRecognizer*)tap{
    
    [_alert.inputText resignFirstResponder ];
    
}

@end
