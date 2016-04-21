//
//  CustomAlert.m
//  CCTest
//
//  Created by MS on 15-12-22.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "CustomAlert.h"

static const float ViewRadius = 7.0f;

@interface CustomAlert ()<UITextFieldDelegate>

@property (nonatomic,strong) SureBlock sure;
@property (nonatomic,strong) CancelBlock cancel;
@end

@implementation CustomAlert


-(void)awakeFromNib{
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = ViewRadius;
    self.inputText.delegate = self;
    
    [self.sureBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
     [self.cancelBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.tag = SureBtn;
    self.cancelBtn.tag = CancelBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - text field
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

#pragma mark - btn
-(void)setSureBtnActionBlock:(SureBlock)sureBlock andCancelBlock:(CancelBlock)cancelBlock{
    if (sureBlock) {
        _sure = sureBlock;

    }
    
    if (cancelBlock) {
        _cancel = cancelBlock;

    }
}

-(void)btnAction:(UIButton*)sender{
    if (sender.tag == SureBtn) {
        _sure(SureBtn);
    }else{
        _cancel(CancelBtn);
    }
}

@end
