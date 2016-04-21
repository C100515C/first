//
//  ShuLabel.h
//  CCTest
//
//  Created by MS on 16-2-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    VerticalAlignmentTop = 0,
    VerticalAlignmentMidele,
    VerticalAlignmentBottom,
    VerticalAlignmentMax
}VerticalAlignment;

@interface ShuLabel : UILabel

@property (nonatomic, assign)VerticalAlignment verticalAlignment;

@end
