//
//  UILabel+CCTapLabel.h
//  CCTest
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapLabelProtocol <NSObject>

-(void)tapActionWith:(UILabel*)currentLabel;

@end

@interface UILabel (CCTapLabel)

@property (nonatomic,assign) id<TapLabelProtocol> tapLabelDelelgate;

@end
