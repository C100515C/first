//
//  ShuLabel.m
//  CCTest
//
//  Created by MS on 16-2-17.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "ShuLabel.h"


@interface ShuLabel ()
{
    VerticalAlignment _verticalAlignment;
}

@end


@implementation ShuLabel
@synthesize verticalAlignment;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _verticalAlignment = VerticalAlignmentBottom;
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (VerticalAlignment)verticalAlignment
{
    return _verticalAlignment;
}

- (void)setVerticalAlignment:(VerticalAlignment)align
{
    _verticalAlignment = align;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rc = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_verticalAlignment) {
        case VerticalAlignmentTop:
            rc.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            rc.origin.y = bounds.origin.y + bounds.size.height - rc.size.height;
            break;
        case VerticalAlignmentMidele:
        default:
            rc.origin.y = bounds.origin.y + (bounds.size.height - rc.size.height)/2;
            break;
    }
    
    return rc;
}

- (void)drawTextInRect:(CGRect)rect
{
//    CGRect rc = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
//    [super drawTextInRect:rc];
    float view_height=self.frame.size.height;
    float view_width=self.frame.size.width;
    float start_x=0;
    float Start_y=0;
    
    float width=self.font.pointSize;
    float height=self.font.pointSize;
    float x;
    float y;
    
    start_x=view_width-width;
    NSInteger charNumber;
    NSInteger containerNumber;
    containerNumber=floor(view_width/height);
    charNumber=floor(view_height/height);
    NSString *drawStr=self.text;
    //    self.textColor = [UIColor whiteColor];
    NSInteger lineNumber=ceil([drawStr length]/charNumber);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[[UIColor whiteColor] CGColor]);
    if (lineNumber>=containerNumber) {
        NSRange range;
        range.location=0;
        range.length=containerNumber*charNumber-1;
        drawStr=[drawStr substringWithRange:range];
        drawStr=[drawStr stringByAppendingFormat:@"..."];
    }
    
    for (int i=0; i<[drawStr length]; i++) {
        x=floor(i/charNumber)*width;//start_x-
        y=Start_y+(i%charNumber)*height;
        CGRect Aframe=CGRectMake(x, y, width, height);
        NSRange range;
        range.length=1;
        range.location=i;
        NSString *str=[drawStr substringWithRange:range];
        //        [str drawInRect:Aframe withFont:self.font];
        [str drawInRect:Aframe withAttributes:@{NSFontAttributeName:self.font}];
    }
}

@end