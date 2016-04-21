//
//  YellowView.m
//  CCTest
//
//  Created by MS on 16-1-15.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YellowView.h"

#define SELFCENTERWIETH self.frame.size.width/2.0
#define TOPCENTER CGPointMake(SELFCENTERWIETH, 80)

static const CGFloat  radius = 50.0;
@implementation YellowView

-(void)drawRect:(CGRect)rect{
 
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawHeaderWith:ctx];
    
    [self drawEyesWith:ctx];
    
    [self drawHairWith:ctx];
    
    [self drawMouseWith:ctx];
    
}

-(void)drawHeaderWith:(CGContextRef)ctx{
    
    [[UIColor yellowColor] set];
    
    CGPoint point =  CGPointMake(SELFCENTERWIETH, 80);
//    CGFloat radius = 50.0;
    
    CGContextMoveToPoint(ctx, point.x+radius, point.y);

    CGContextAddArc(ctx, point.x, point.y, radius, 0, M_PI,1);
    
    CGFloat height = 100.0;
    CGContextAddLineToPoint(ctx, point.x-radius, point.y+height);
    
    CGContextAddArc(ctx, point.x, point.y+height, radius, M_PI, 0, 1);
    
//    CGContextMoveToPoint(ctx, point.x+radius, point.y+height);
//    CGContextAddLineToPoint(ctx, point.x+radius, point.y);
    
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

-(void)drawMouseWith:(CGContextRef)ctx{

    [[UIColor blackColor]set];
    
    CGPoint centerPoint = CGPointMake(SELFCENTERWIETH, 160);
    CGFloat differX = 20;
    CGFloat differY = 10;
    CGPoint leftPoint = CGPointMake(centerPoint.x-differX, centerPoint.y-differY);
    CGPoint rightPoint = CGPointMake(centerPoint.x+differX, centerPoint.y-differY);
    
    CGContextMoveToPoint(ctx, leftPoint.x, leftPoint.y);
    
    CGContextAddQuadCurveToPoint(ctx,centerPoint.x,centerPoint.y, rightPoint.x, rightPoint.y);
    
    CGContextStrokePath(ctx);
    
}

-(void)drawEyesWith:(CGContextRef)ctx{
    
    CGContextSaveGState(ctx);
    
    [[UIColor blackColor] set];
    
    CGPoint center = TOPCENTER;
    CGFloat width = 20;
    CGContextAddRect(ctx, CGRectMake(center.x-radius, center.y, 2*radius, width));
    CGContextFillPath(ctx);

    [[UIColor grayColor] set];
    CGFloat eyeRaduis = radius - 27;
    CGFloat eyeWidth = 8;
    CGFloat differ = 3;
    CGFloat smallRaduis = eyeRaduis-eyeWidth;
    CGPoint leftCenter = CGPointMake(center.x-eyeRaduis+differ, center.y+width/2.0);
    CGPoint rightCenter = CGPointMake(center.x+eyeRaduis-differ, center.y+width/2.0);
    
    CGContextAddArc(ctx, leftCenter.x, leftCenter.y, eyeRaduis, 0, 2*M_PI, 0);
    CGContextAddArc(ctx, rightCenter.x, rightCenter.y, eyeRaduis, 0, 2*M_PI, 0);
    CGContextSetLineWidth(ctx, eyeWidth);
    CGContextFillPath(ctx);
    
    CGContextRestoreGState(ctx);
    [[UIColor whiteColor] set];
    
    CGContextAddArc(ctx, leftCenter.x, leftCenter.y, smallRaduis, 0, 2*M_PI, 0);
    CGContextAddArc(ctx, rightCenter.x, rightCenter.y, smallRaduis, 0, 2*M_PI, 0);
    
    CGContextFillPath(ctx);
    
    CGFloat eyeballRaduis = 8;
    CGFloat smallEyeballRaduis = 5;
    CGFloat distance = 7;
    
    CGPoint leftEyeballCenter = CGPointMake(center.x-eyeballRaduis-distance, center.y+width/2.0);
    CGPoint rightEyeballCenter = CGPointMake(center.x+eyeballRaduis+distance, center.y+width/2.0);
    
    [[UIColor brownColor] set];
    CGContextAddArc(ctx, leftEyeballCenter.x, leftEyeballCenter.y, eyeballRaduis, 0, 2*M_PI, 0);
    CGContextAddArc(ctx, rightEyeballCenter.x, rightEyeballCenter.y, eyeballRaduis, 0, 2*M_PI, 0);
    CGContextFillPath(ctx);

    [[UIColor blackColor]set];
    CGContextAddArc(ctx, leftEyeballCenter.x, leftEyeballCenter.y, smallEyeballRaduis, 0, 2*M_PI, 0);
    CGContextAddArc(ctx, rightEyeballCenter.x, rightEyeballCenter.y, smallEyeballRaduis, 0, 2*M_PI, 0);
    
    CGContextFillPath(ctx);

}

-(void)drawHairWith:(CGContextRef)ctx{
    
    [[UIColor blackColor]set];

    CGPoint centerPoint = CGPointMake(SELFCENTERWIETH, 35);
    CGFloat stance = 10;
    CGFloat length = 20;
    CGFloat offset = 5;
    
    CGPoint firstStartPoint = CGPointMake(centerPoint.x-2*stance, centerPoint.y);
    CGPoint secondStartPoint = CGPointMake(centerPoint.x-stance, centerPoint.y);
    CGPoint fourStartPoint = CGPointMake(centerPoint.x+stance, centerPoint.y);
    CGPoint fiveStartPoint = CGPointMake(centerPoint.x+2*stance, centerPoint.y);
    
    CGPoint firstEndPoint = CGPointMake(firstStartPoint.x-2*offset, firstStartPoint.y-length);
    CGPoint secondEndPoint = CGPointMake(secondStartPoint.x-offset, secondStartPoint.y-length);
    CGPoint fourEndPoint = CGPointMake(fourStartPoint.x+offset, fourStartPoint.y-length);
    CGPoint fiveEndPoint = CGPointMake(fiveStartPoint.x+2*offset, fiveStartPoint.y-length);
    
    CGContextMoveToPoint(ctx, firstStartPoint.x, firstStartPoint.y);
    CGContextAddLineToPoint(ctx, firstEndPoint.x, firstEndPoint.y);
    
    CGContextMoveToPoint(ctx, secondStartPoint.x, secondStartPoint.y);
    CGContextAddLineToPoint(ctx, secondEndPoint.x, secondEndPoint.y);
    
    CGContextMoveToPoint(ctx, centerPoint.x, centerPoint.y);
    CGContextAddLineToPoint(ctx, centerPoint.x, centerPoint.y-length);
    
    CGContextMoveToPoint(ctx, fourStartPoint.x, fourStartPoint.y);
    CGContextAddLineToPoint(ctx, fourEndPoint.x, fourEndPoint.y);
    
    CGContextMoveToPoint(ctx, fiveStartPoint.x, fiveStartPoint.y);
    CGContextAddLineToPoint(ctx, fiveEndPoint.x, fiveEndPoint.y);
    
    
    CGContextStrokePath(ctx);
    
}

@end
