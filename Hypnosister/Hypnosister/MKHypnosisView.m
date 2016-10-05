//
//  MKHypnosisView.m
//  Hypnosister
//
//  Created by 穆康 on 16/10/4.
//  Copyright © 2016年 mukang. All rights reserved.
//

#import "MKHypnosisView.h"

@interface MKHypnosisView ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation MKHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _circleColor = [UIColor lightGrayColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    /*
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
     */
    
    // 计算斜边长
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // 每当绘制一个圆形时，抬起笔并移动到正确的位置
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    
    [path stroke];
    
    
    
    
    /* 渐进色
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    CGPoint startPoint = logoFrame.origin;
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(logoFrame), CGRectGetMaxY(logoFrame));
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
     */
    
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    [myPath moveToPoint:CGPointMake(center.x, center.y - 100)];
    [myPath addLineToPoint:CGPointMake(center.x + 100, center.y + 100)];
    [myPath addLineToPoint:CGPointMake(center.x - 100, center.y + 100)];
    [myPath closePath];
    
    CGContextSaveGState(ctx);
    [myPath addClip];
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    CGPoint startPoint = bounds.origin;
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(ctx);
    
    
    CGContextSaveGState(ctx);
    CGContextSetShadow(ctx, CGSizeMake(4, 7), 3);
    
    CGRect logoFrame;
    logoFrame.size = CGSizeMake(190, 280.5);
    logoFrame.origin = CGPointMake(center.x - logoFrame.size.width / 2.0, center.y - logoFrame.size.height / 2.0);
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:logoFrame];
    
    CGContextRestoreGState(ctx);
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
