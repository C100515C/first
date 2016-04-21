//
//  HeartView.m
//  CCTest
//
//  Created by MS on 16-1-26.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "HeartView.h"


static const CGFloat btnH = 50.0f;
static const CGFloat btnW = 30.0f;
static const CGFloat stance = 5.0f;

@interface HeartView (){
    
}

@property (nonatomic,assign) NSInteger heartCount;
@property (nonatomic,assign) NSInteger oldSelectedBtnTag;
@property (nonatomic,assign) UIButton *oldSelectedBtn;

@end
@implementation HeartView

-(id)initWithFrame:(CGRect)frame andHeartCount:(NSInteger)count{
    
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y,count*(btnW+stance), btnH);
    
    self = [super initWithFrame:newFrame];
    
    if (self) {
        self.heartCount = count;
        [self createBtns];
        self.backgroundColor = [UIColor greenColor];
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

-(void)createBtns{
    
    
    for (int i=0; i<_heartCount; i++) {
        CGRect frame = CGRectMake(i*(btnW+stance), 0, btnW, btnH);
        [self createBtn:frame andTag:i];
    }
    
}

-(void)createBtn:(CGRect)frame andTag:(int)tag{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    
    [btn setBackgroundImage:[UIImage imageNamed:@"两个方法"] forState:UIControlStateNormal];
    
    
    btn.tag = tag;
    btn.selected = NO;
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
}

-(void)btnClicked:(UIButton*)sender{
    
    NSInteger tag = sender.tag;

    [self setBtnsImageWith:tag];

    if (sender.selected) {
        [sender setBackgroundImage:[UIImage imageNamed:@"两个方法"] forState:UIControlStateNormal];
        sender.selected = NO;
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        sender.selected = YES;
            
    }
    
}

-(void)setBtnsImageWith:(NSInteger)tag{

    NSArray *btns = self.subviews;
    for (UIButton *btn in btns) {
        if ([btn isKindOfClass:[UIButton class]]) {
            if (btn.tag>tag) {
                [btn setBackgroundImage:[UIImage imageNamed:@"两个方法"] forState:UIControlStateNormal];
                btn.selected = NO;
            }else if(btn.tag<tag){
                [btn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
                btn.selected = YES;
            }
            
        }
    }
    
}

@end
