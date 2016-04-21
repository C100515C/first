//
//  UILabel+CCTapLabel.m
//  CCTest
//
//  Created by MS on 16-1-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "UILabel+CCTapLabel.h"
#import <objc/runtime.h>

static NSString *const TapLabelDelegate = @"taplabeldelegate";
@implementation UILabel (CCTapLabel)

-(void)setTapLabelDelelgate:(id<TapLabelProtocol>)tapLabelDelelgate{
    
    if (tapLabelDelelgate!=objc_getAssociatedObject(self, &TapLabelDelegate)) {
        objc_setAssociatedObject(self, &TapLabelDelegate, tapLabelDelelgate, OBJC_ASSOCIATION_ASSIGN);
    }
    
    if (tapLabelDelelgate) {
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    
}

-(id<TapLabelProtocol>)tapLabelDelelgate{
    
    return objc_getAssociatedObject(self, &TapLabelDelegate);
}

-(void)tap{

    if (self.tapLabelDelelgate && [self.tapLabelDelelgate respondsToSelector:@selector(tapActionWith:)]) {
        [self.tapLabelDelelgate tapActionWith:self];
    }
    
}

@end
