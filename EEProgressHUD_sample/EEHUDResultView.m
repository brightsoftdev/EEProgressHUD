//
//  EEProgressHUDResultView.m
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 12/02/12.
//  Copyright (c) 2012年 Milestoneeee.com. All rights reserved.
//

#import "EEHUDResultView.h"
#import "EEHUDViewConstants.h"

@implementation EEHUDResultView
@synthesize viewStyle = viewStyle_;

- (void)setViewStyle:(EEHUDResultViewStyle)aViewStyle
{
    if (viewStyle_ != aViewStyle) {
        
        viewStyle_ = aViewStyle;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = self.bounds.size.width;             // 180
    CGFloat height = self.bounds.size.height;           // 60
    
    // = height
    CGFloat oneSide = (width < height) ? width : height;
    
    CGPoint center = CGPointMake(width * 0.5, height * 0.5);
    CGFloat r = (oneSide * 0.5) * 0.5;
    
    /***********************
     (180, 60)のサイズのはず
     描画エリアは中心の(30, 30)にしてる。
        => 揃えた方が綺麗に見えるはず
     ************************/
    
    // 定義
    CGPoint hidariue, migishita, migiue, hidarishita;
    CGPoint start, relay, end;
    
    EEHUDResultViewStyle style = self.viewStyle;
    
    UIBezierPath *path;
    switch (style) {
        case EEHUDResultViewStyleOK:
            path = [UIBezierPath bezierPathWithArcCenter:center
                                                  radius:r
                                              startAngle:0.0
                                                endAngle:2.0 * M_PI
                                               clockwise:YES];
            path.lineWidth = 9.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
        case EEHUDResultViewStyleNG:
            
            hidariue = CGPointMake(center.x - r, center.y - r);
            migishita = CGPointMake(center.x + r, center.y + r);
            migiue = CGPointMake(center.x + r, center.y - r);
            hidarishita = CGPointMake(center.x - r, center.y + r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:hidariue];
            [path addLineToPoint:migishita];
            [path moveToPoint:migiue];
            [path addLineToPoint:hidarishita];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleChecked:
            
            start = CGPointMake(center.x - r, center.y);
            relay = CGPointMake(start.x + r*0.8, start.y + r);
            migiue = CGPointMake(center.x + r*1.2, center.y - r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:migiue];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleUpArrow:
            
            start = CGPointMake(center.x - 0.8*r, center.y - 0.2*r);
            relay = CGPointMake(center.x, center.y - r);
            end = CGPointMake(center.x + 0.8*r, center.y - 0.2*r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x, center.y - r);
            end = CGPointMake(center.x, center.y + r);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
        
        case EEHUDResultViewStyleDownArrow:
            
            start = CGPointMake(center.x - 0.8*r, center.y + 0.2*r);
            relay = CGPointMake(center.x, center.y + r);
            end = CGPointMake(center.x + 0.8*r, center.y + 0.2*r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x, center.y + r);
            end = CGPointMake(center.x, center.y - r);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleRightArrow:
            
            start = CGPointMake(center.x + 0.2*r, center.y - 0.8*r);
            relay = CGPointMake(center.x + r, center.y);
            end = CGPointMake(center.x + 0.2*r, center.y + 0.8*r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x - r, center.y);
            end = CGPointMake(center.x + r, center.y);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleLeftArrow:
            
            start = CGPointMake(center.x - 0.2*r, center.y - 0.8*r);
            relay = CGPointMake(center.x - r, center.y);
            end = CGPointMake(center.x - 0.2*r, center.y + 0.8*r);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 9.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x - r, center.y);
            end = CGPointMake(center.x + r, center.y);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
        default:
            
            break;
    }
    
    
    
}

@end
