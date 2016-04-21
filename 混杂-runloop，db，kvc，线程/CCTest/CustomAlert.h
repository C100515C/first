//
//  CustomAlert.h
//  CCTest
//
//  Created by MS on 15-12-22.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    SureBtn = 10,
    CancelBtn
    
}btnName;

typedef void (^CancelBlock)(btnName name);
typedef void (^SureBlock)(btnName name);

@interface CustomAlert : UIView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *des;
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

-(void)setSureBtnActionBlock:(SureBlock)sureBlock andCancelBlock:(CancelBlock)cancelBlock;

@end
