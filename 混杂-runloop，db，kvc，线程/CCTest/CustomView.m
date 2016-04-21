//
//  CustomView.m
//
//  Code generated using QuartzCode 1.21 on 15-12-12.
//  www.quartzcodeapp.com
//

#import "CustomView.h"
#import "QCMethod.h"


@interface CustomView ()

@property (nonatomic, strong) CAShapeLayer *star;
@property (nonatomic, strong) CAShapeLayer *polygon;
@property (nonatomic, strong) CAShapeLayer *path;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupLayers];
	}
	return self;
}



- (void)setupLayers{
	CAShapeLayer * star = [CAShapeLayer layer];
	star.frame       = CGRectMake(0.5, -2.7, 10.91, 10.16);
	star.fillColor   = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
	star.strokeColor = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
	star.path        = [self starPath].CGPath;
	[self.layer addSublayer:star];
	_star = star;
	
	CAShapeLayer * polygon = [CAShapeLayer layer];
	polygon.frame       = CGRectMake(9, 25.68, 16.62, 12.43);
	polygon.fillColor   = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
	polygon.strokeColor = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
	polygon.path        = [self polygonPath].CGPath;
	[self.layer addSublayer:polygon];
	_polygon = polygon;
	
	CAShapeLayer * path = [CAShapeLayer layer];
	path.frame       = CGRectMake(-31.3, -25.5, 57.9, 61.15);
	path.fillColor   = nil;
	path.strokeColor = [UIColor blackColor].CGColor;
	path.path        = [self pathPath].CGPath;
	[self.layer addSublayer:path];
	_path = path;
}


- (IBAction)startAllAnimations:(id)sender{
	[self.star addAnimation:[self starAnimation] forKey:@"starAnimation"];
	[self.polygon addAnimation:[self polygonAnimation] forKey:@"polygonAnimation"];
	[self.path addAnimation:[self pathAnimation] forKey:@"pathAnimation"];
}

- (CAAnimationGroup*)starAnimation{
	CABasicAnimation * transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
	transformAnim.fromValue          = [NSValue valueWithCATransform3D:CATransform3DIdentity];;
	transformAnim.toValue            = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1.5), CATransform3DMakeTranslation(2, 5, 1)), CATransform3DMakeRotation(-6 * M_PI/180, -1, 1, 1))];;
	transformAnim.duration           = 1.01;
	transformAnim.beginTime          = 0.991;
	transformAnim.timingFunction     = [CAMediaTimingFunction functionWithControlPoints:-0.0138 :2.18 :1 :1];
	
	CABasicAnimation * positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];
	positionAnim.fromValue          = [NSValue valueWithCGPoint:CGPointMake(6, 9.64)];
	positionAnim.toValue            = [NSValue valueWithCGPoint:CGPointMake(21, 10)];
	positionAnim.duration           = 0.991;
	positionAnim.timingFunction     = [CAMediaTimingFunction functionWithControlPoints:0.671 :-2.6 :1 :0.287];
	
	CAKeyframeAnimation * strokeStartAnim = [CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
	strokeStartAnim.values                = @[@0, @1];
	strokeStartAnim.keyTimes              = @[@0, @1];
	strokeStartAnim.duration              = 1;
	strokeStartAnim.beginTime             = 2;
	
	CAAnimationGroup *starAnimGroup   = [CAAnimationGroup animation];
	starAnimGroup.animations          = @[transformAnim, positionAnim, strokeStartAnim];
	[starAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	starAnimGroup.fillMode            = kCAFillModeForwards;
	starAnimGroup.removedOnCompletion = NO;
	starAnimGroup.duration = [QCMethod maxDurationFromAnimations:starAnimGroup.animations];
	
	
	return starAnimGroup;
}

- (CAAnimationGroup*)polygonAnimation{
	CABasicAnimation * strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	strokeEndAnim.toValue            = @1;
	strokeEndAnim.duration           = 1;
	strokeEndAnim.beginTime          = 3;
	
	CAAnimationGroup *polygonAnimGroup   = [CAAnimationGroup animation];
	polygonAnimGroup.animations          = @[strokeEndAnim];
	[polygonAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	polygonAnimGroup.fillMode            = kCAFillModeForwards;
	polygonAnimGroup.removedOnCompletion = NO;
	polygonAnimGroup.duration = [QCMethod maxDurationFromAnimations:polygonAnimGroup.animations];
	
	
	return polygonAnimGroup;
}

- (CAAnimationGroup*)pathAnimation{
	CABasicAnimation * pathAnim = [CABasicAnimation animationWithKeyPath:@"path"];
	pathAnim.toValue            = (id)[QCMethod alignToBottomPath:[self starPath] layer:_path].CGPath;
	pathAnim.duration           = 1;
	pathAnim.beginTime          = 4;
	
	CAAnimationGroup *pathAnimGroup   = [CAAnimationGroup animation];
	pathAnimGroup.animations          = @[pathAnim];
	[pathAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	pathAnimGroup.fillMode            = kCAFillModeForwards;
	pathAnimGroup.removedOnCompletion = NO;
	pathAnimGroup.duration = [QCMethod maxDurationFromAnimations:pathAnimGroup.animations];
	
	
	return pathAnimGroup;
}

#pragma mark - Bezier Path

- (UIBezierPath*)starPath{
	UIBezierPath *starPath = [UIBezierPath bezierPath];
	[starPath moveToPoint:CGPointMake(3.194, 2.525)];
	[starPath addCurveToPoint:CGPointMake(1.813, 6.629) controlPoint1:CGPointMake(0.696, 2.875) controlPoint2:CGPointMake(-1.802, 3.226)];
	[starPath addCurveToPoint:CGPointMake(5.428, 9.166) controlPoint1:CGPointMake(1.386, 9.032) controlPoint2:CGPointMake(0.959, 11.435)];
	[starPath addCurveToPoint:CGPointMake(9.043, 6.629) controlPoint1:CGPointMake(7.662, 10.301) controlPoint2:CGPointMake(9.897, 11.435)];
	[starPath addCurveToPoint:CGPointMake(7.662, 2.525) controlPoint1:CGPointMake(10.851, 4.928) controlPoint2:CGPointMake(12.658, 3.226)];
	[starPath addCurveToPoint:CGPointMake(3.194, 2.525) controlPoint1:CGPointMake(6.545, 0.338) controlPoint2:CGPointMake(5.428, -1.848)];
	[starPath closePath];
	[starPath moveToPoint:CGPointMake(3.194, 2.525)];
	
	return starPath;
}

- (UIBezierPath*)polygonPath{
	UIBezierPath *polygonPath = [UIBezierPath bezierPath];
	[polygonPath moveToPoint:CGPointMake(8.308, 0)];
	[polygonPath addLineToPoint:CGPointMake(0, 3.107)];
	[polygonPath addLineToPoint:CGPointMake(0, 9.322)];
	[polygonPath addLineToPoint:CGPointMake(8.308, 12.429)];
	[polygonPath addLineToPoint:CGPointMake(16.615, 9.322)];
	[polygonPath addLineToPoint:CGPointMake(16.615, 3.107)];
	[polygonPath closePath];
	[polygonPath moveToPoint:CGPointMake(8.308, 0)];
	
	return polygonPath;
}

- (UIBezierPath*)pathPath{
	UIBezierPath *pathPath = [UIBezierPath bezierPath];
	[pathPath moveToPoint:CGPointMake(53.486, 45.78)];
	[pathPath addCurveToPoint:CGPointMake(38.079, 37.668) controlPoint1:CGPointMake(38.003, 42.475) controlPoint2:CGPointMake(38.079, 37.668)];
	[pathPath addCurveToPoint:CGPointMake(39.818, 38.723) controlPoint1:CGPointMake(38.079, 37.668) controlPoint2:CGPointMake(24.682, 25.935)];
	[pathPath addCurveToPoint:CGPointMake(51.225, 51.511) controlPoint1:CGPointMake(54.955, 51.511) controlPoint2:CGPointMake(51.225, 53.327)];
	[pathPath addCurveToPoint:CGPointMake(39.033, 35.136) controlPoint1:CGPointMake(51.225, 49.694) controlPoint2:CGPointMake(42.081, 39.23)];
	[pathPath addCurveToPoint:CGPointMake(35.502, 30.394) controlPoint1:CGPointMake(38.15, 33.95) controlPoint2:CGPointMake(36.385, 31.579)];
	[pathPath addLineToPoint:CGPointMake(48.289, 53.087)];
	[pathPath addLineToPoint:CGPointMake(31.989, 35.699)];
	[pathPath addLineToPoint:CGPointMake(44.255, 61.154)];
	[pathPath addLineToPoint:CGPointMake(57.901, 53.848)];
	[pathPath addLineToPoint:CGPointMake(0, 0)];
	[pathPath addLineToPoint:CGPointMake(47.039, 29.761)];
	
	return pathPath;
}

@end