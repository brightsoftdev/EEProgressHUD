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
        
        //self.backgroundColor = [UIColor whiteColor];
        
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
    CGFloat r = (oneSide * 0.5);
    
    /***********************
     (180, 60)のサイズのはず
     描画エリアは中心の(60, 60)にしてる。
        => 揃えた方が綺麗に見えるはず
     ************************/
    
    // 定義
    CGPoint hidariue, migishita, migiue, hidarishita;
    CGPoint start, relay, end;
    CGFloat innerMargin;
    CGFloat bothExpansion;
    CGFloat ueMargin, hidariMargin, migiMargin, shitaMargin;
    CGFloat theta;
    
    EEHUDResultViewStyle style = self.viewStyle;
    
    UIBezierPath *path;
    switch (style) {
        case EEHUDResultViewStyleOK:
            
            innerMargin = 12.0;
            path = [UIBezierPath bezierPathWithArcCenter:center
                                                  radius:(r - innerMargin)
                                              startAngle:0.0
                                                endAngle:2.0 * M_PI
                                               clockwise:YES];
            path.lineWidth = 8.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
        case EEHUDResultViewStyleNG:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin, center.y + r - innerMargin);
            
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:hidariue];
            [path addLineToPoint:migishita];
            [path moveToPoint:migiue];
            [path addLineToPoint:hidarishita];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleChecked:
            
            innerMargin = 12.0;
            start = CGPointMake(center.x - r + innerMargin, center.y);
            relay = CGPointMake(center.x - 0.2*r, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r*1.2 - innerMargin, center.y - r + innerMargin);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:migiue];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleUpArrow:
            
            innerMargin = 12.0;
            
            start = CGPointMake(center.x - 0.8*(r-innerMargin), center.y - 0.2*(r-innerMargin));
            relay = CGPointMake(center.x, center.y - (r-innerMargin));
            end = CGPointMake(center.x + 0.8*(r-innerMargin), center.y - 0.2*(r-innerMargin));
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x, center.y - (r-innerMargin));
            end = CGPointMake(center.x, center.y + (r-innerMargin));
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
        
        case EEHUDResultViewStyleDownArrow:
            
            innerMargin = 12.0;
            start = CGPointMake(center.x - 0.8*(r-innerMargin), center.y + 0.2*(r-innerMargin));
            relay = CGPointMake(center.x, center.y + (r-innerMargin));
            end = CGPointMake(center.x + 0.8*(r-innerMargin), center.y + 0.2*(r-innerMargin));
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x, center.y + (r-innerMargin));
            end = CGPointMake(center.x, center.y - (r-innerMargin));
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleRightArrow:
            
            innerMargin = 12.0;
            start = CGPointMake(center.x + 0.2*(r-innerMargin), center.y - 0.8*(r-innerMargin));
            relay = CGPointMake(center.x + (r-innerMargin), center.y);
            end = CGPointMake(center.x + 0.2*(r-innerMargin), center.y + 0.8*(r-innerMargin));
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x - (r-innerMargin), center.y);
            end = CGPointMake(center.x + (r-innerMargin), center.y);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleLeftArrow:
            
            innerMargin = 12.0;
            start = CGPointMake(center.x - 0.2*(r-innerMargin), center.y - 0.8*(r-innerMargin));
            relay = CGPointMake(center.x - (r-innerMargin), center.y);
            end = CGPointMake(center.x - 0.2*(r-innerMargin), center.y + 0.8*(r-innerMargin));
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            // vertical line
            
            [path removeAllPoints];
            
            start = CGPointMake(center.x - (r-innerMargin), center.y);
            end = CGPointMake(center.x + (r-innerMargin), center.y);
            
            [path moveToPoint:start];
            [path addLineToPoint:end];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStylePlay:
            
            innerMargin = 12.0;
            start = CGPointMake(center.x + r - innerMargin, center.y);
            relay = CGPointMake(center.x - r + r*(2.0-sqrt(3.0))/2 + innerMargin, center.y + r - innerMargin);
            end = CGPointMake(center.x - r + r*(2.0-sqrt(3.0))/2 + innerMargin , center.y - r + innerMargin);
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:start];
            [path addLineToPoint:relay];
            [path addLineToPoint:end];
            
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            
            break;
            
        case EEHUDResultViewStylePause:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin, center.y + r - innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            // line width = 10.0
            path = [UIBezierPath bezierPath];
            
            path.lineJoinStyle = kCGLineJoinRound;
            
            [path moveToPoint:CGPointMake(hidariue.x + 2.0, hidariue.y)];
            [path addLineToPoint:CGPointMake(hidariue.x + 12.0, hidariue.y)];
            [path addLineToPoint:CGPointMake(hidariue.x + 12.0, hidarishita.y)];
            [path addLineToPoint:CGPointMake(hidariue.x + 2.0, hidarishita.y)];
            
            [path closePath];
            [path fill];
            
            [path removeAllPoints];
            
            [path moveToPoint:CGPointMake(migiue.x - 2.0, migiue.y)];
            [path addLineToPoint:CGPointMake(migiue.x - 12.0, migiue.y)];
            [path addLineToPoint:CGPointMake(migishita.x - 12.0, migishita.y)];
            [path addLineToPoint:CGPointMake(migishita.x - 2.0, migishita.y)];
            
            [path closePath];
            [path fill];
            
            break;
            
        case EEHUDResultViewStyleZero:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"0" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleOne:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"1" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleTwo:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"2" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleThree:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"3" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleFour:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"4" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleFive:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"5" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleSix:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"6" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleSeven:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"7" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleEight:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"8" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleNine:
            
            innerMargin = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin, center.y - r + innerMargin);
            
            [EEHUD_COLOR_IMAGE set];
            
            [@"9" drawAtPoint:CGPointMake(hidariue.x + 4.0, hidariue.y - 17.0)
                     withFont:[UIFont fontWithName:@"Helvetica-Bold" size:60.0]];
            
            break;
            
        case EEHUDResultViewStyleExclamation:
            
            innerMargin = 10.0;
            
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(center.x, center.y + r - 8.0)
                                                  radius:5.0
                                              startAngle:0.0
                                                endAngle:2*M_PI
                                               clockwise:YES];
            
            [EEHUD_COLOR_IMAGE set];
            
            [path fill];
            
            path = nil;
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(center.x, center.y + r - innerMargin - 15.0)];
            [path addLineToPoint:CGPointMake(center.x - 2.0, center.y - r + innerMargin)];
            [path addLineToPoint:CGPointMake(center.x + 2.0, center.y - r + innerMargin)];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 8.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleCloud:
            
            innerMargin = 2.0;
            bothExpansion = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y + r - innerMargin);
            
            
            path = [UIBezierPath bezierPath];
            
            // cloud
            [path moveToPoint:CGPointMake(hidarishita.x + 5.0, hidarishita.y)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 15.0, hidarishita.y - 24.0)
                    controlPoint1:CGPointMake(hidarishita.x - 8.0, hidarishita.y - 13.0)
                    controlPoint2:CGPointMake(hidarishita.x + 5.0, hidarishita.y - 30.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 35.0, hidarishita.y - 30.0)
                    controlPoint1:CGPointMake(hidarishita.x + 12.0, hidarishita.y - 40.0) 
                    controlPoint2:CGPointMake(hidarishita.x + 31.0, hidarishita.y - 44.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 67.0, hidarishita.y - 8.0)
                    controlPoint1:CGPointMake(hidarishita.x + 50.0, hidarishita.y - 70.0)
                    controlPoint2:CGPointMake(hidarishita.x + 95.0, hidarishita.y - 28.0)];
            [path addCurveToPoint:CGPointMake(migishita.x - 5.0, migishita.y)
                    controlPoint1:CGPointMake(hidarishita.x + 70.0, hidarishita.y - 15.0)
                    controlPoint2:CGPointMake(migishita.x + 5.0, migishita.y - 10.0)];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 3.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleCloudUp:
            
            innerMargin = 2.0;
            bothExpansion = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y + r - innerMargin);
            
            
            path = [UIBezierPath bezierPath];
            
            // cloud
            [path moveToPoint:CGPointMake(hidarishita.x + 5.0, hidarishita.y)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 15.0, hidarishita.y - 24.0)
                    controlPoint1:CGPointMake(hidarishita.x - 8.0, hidarishita.y - 13.0)
                    controlPoint2:CGPointMake(hidarishita.x + 5.0, hidarishita.y - 30.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 35.0, hidarishita.y - 30.0)
                    controlPoint1:CGPointMake(hidarishita.x + 12.0, hidarishita.y - 40.0) 
                    controlPoint2:CGPointMake(hidarishita.x + 31.0, hidarishita.y - 44.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 67.0, hidarishita.y - 8.0)
                    controlPoint1:CGPointMake(hidarishita.x + 50.0, hidarishita.y - 70.0)
                    controlPoint2:CGPointMake(hidarishita.x + 95.0, hidarishita.y - 28.0)];
            [path addCurveToPoint:CGPointMake(migishita.x - 5.0, migishita.y)
                    controlPoint1:CGPointMake(hidarishita.x + 70.0, hidarishita.y - 15.0)
                    controlPoint2:CGPointMake(migishita.x + 5.0, migishita.y - 10.0)];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 3.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            [path removeAllPoints];
            
            // UP
            [path moveToPoint:CGPointMake(center.x - 10.0, center.y + r - innerMargin)];
            [path addLineToPoint:CGPointMake(center.x - 10.0, center.y + r - innerMargin - 7.0)];
            [path addLineToPoint:CGPointMake(center.x - 20.0, center.y + r - innerMargin - 7.0)];
            [path addLineToPoint:CGPointMake(center.x, center.y + r - innerMargin - 22.0)];
            [path addLineToPoint:CGPointMake(center.x + 20.0, center.y + r - innerMargin - 7.0)];
            [path addLineToPoint:CGPointMake(center.x + 10.0, center.y + r - innerMargin - 7.0)];
            [path addLineToPoint:CGPointMake(center.x + 10.0, center.y + r - innerMargin)];
            [path closePath];
            
            [path stroke];
            
            break;
        
        case EEHUDResultViewStyleCloudDown:
            
            innerMargin = 2.0;
            bothExpansion = 12.0;
            hidariue = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y + r - innerMargin);
            
            
            path = [UIBezierPath bezierPath];
            
            // cloud
            [path moveToPoint:CGPointMake(hidarishita.x + 5.0, hidarishita.y)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 15.0, hidarishita.y - 24.0)
                    controlPoint1:CGPointMake(hidarishita.x - 8.0, hidarishita.y - 13.0)
                    controlPoint2:CGPointMake(hidarishita.x + 5.0, hidarishita.y - 30.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 35.0, hidarishita.y - 30.0)
                    controlPoint1:CGPointMake(hidarishita.x + 12.0, hidarishita.y - 40.0) 
                    controlPoint2:CGPointMake(hidarishita.x + 31.0, hidarishita.y - 44.0)];
            [path addCurveToPoint:CGPointMake(hidarishita.x + 67.0, hidarishita.y - 8.0)
                    controlPoint1:CGPointMake(hidarishita.x + 50.0, hidarishita.y - 70.0)
                    controlPoint2:CGPointMake(hidarishita.x + 95.0, hidarishita.y - 28.0)];
            [path addCurveToPoint:CGPointMake(migishita.x - 5.0, migishita.y)
                    controlPoint1:CGPointMake(hidarishita.x + 70.0, hidarishita.y - 15.0)
                    controlPoint2:CGPointMake(migishita.x + 5.0, migishita.y - 10.0)];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 3.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            [path removeAllPoints];
            
            // DOWN
            [path moveToPoint:CGPointMake(center.x - 5.0, center.y + r - innerMargin)];
            [path addLineToPoint:CGPointMake(center.x - 20.0, center.y + r - innerMargin - 13.0)];
            [path addLineToPoint:CGPointMake(center.x - 10.0, center.y + r - innerMargin - 13.0)];
            [path addLineToPoint:CGPointMake(center.x - 10.0, center.y + r - innerMargin - 20.0)];
            [path addLineToPoint:CGPointMake(center.x + 10.0, center.y + r - innerMargin - 20.0)];
            [path addLineToPoint:CGPointMake(center.x + 10.0, center.y + r - innerMargin - 13.0)];
            [path addLineToPoint:CGPointMake(center.x + 20.0, center.y + r - innerMargin - 13.0)];
            [path addLineToPoint:CGPointMake(center.x + 5.0, center.y + r - innerMargin)];
            
            [path closePath];
            
            [path stroke];
            
            break;
            
        case EEHUDResultViewStyleMail:
            
            innerMargin = 11.0;
            bothExpansion = 10.0;
            hidariue = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y - r + innerMargin);
            migishita = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y + r - innerMargin);
            migiue = CGPointMake(center.x + r - innerMargin + bothExpansion, center.y - r + innerMargin);
            hidarishita = CGPointMake(center.x - r + innerMargin - bothExpansion, center.y + r - innerMargin);
            
            
            path = [UIBezierPath bezierPath];
            [path moveToPoint:hidariue];
            [path addLineToPoint:migiue];
            [path addLineToPoint:migishita];
            [path addLineToPoint:hidarishita];
            [path addLineToPoint:hidariue];
            [path moveToPoint:CGPointMake(hidariue.x, hidariue.y + 5.0)];
            [path addLineToPoint:CGPointMake(center.x, hidarishita.y - 10.0)];
            [path addLineToPoint:CGPointMake(migiue.x, migiue.y + 5.0)];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineJoinStyle = kCGLineJoinRound;
            path.lineWidth = 4.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleMicrophone:
            
            ueMargin = 2.0;
            hidariMargin = 7.0;
            migiMargin = 7.0;
            shitaMargin = 0.0;
            
            hidariue = CGPointMake(center.x - r + hidariMargin, center.y - r + ueMargin);
            migiue = CGPointMake(center.x + r - migiMargin, center.y - r + ueMargin);
            migishita = CGPointMake(center.x + r - migiMargin, center.y + r - shitaMargin);
            hidarishita = CGPointMake(center.x - r + hidariMargin, center.y + r - shitaMargin);
            
            path = nil;
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(center.x - 7.0, hidariue.y + 10.0)];
            [path addArcWithCenter:CGPointMake(center.x, hidariue.y + 10.0)
                            radius:7.0
                        startAngle:M_PI
                          endAngle:0.0
                         clockwise:YES];
            [path addLineToPoint:CGPointMake(center.x + 7.0, center.y - 4.0)];
            [path addArcWithCenter:CGPointMake(center.x, center.y + 7.0 - 4.0)
                            radius:7.0
                        startAngle:0.0
                          endAngle:M_PI
                         clockwise:YES];
            [path addLineToPoint:CGPointMake(center.x - 7.0, hidariue.y + 10.0)];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 3.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            // 
            path = nil;
            path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(center.x + 7.0 + 5.0, center.y - 4.0 - 1.0)];
            [path addLineToPoint:CGPointMake(center.x + 7.0 + 5.0, center.y - 4.0)];
            [path addArcWithCenter:CGPointMake(center.x, center.y + 7.0 - 4.0)
                            radius:12.0
                        startAngle:0.0
                          endAngle:M_PI
                         clockwise:YES];
            [path addLineToPoint:CGPointMake(center.x - 7.0 - 5.0, center.y - 4.0 - 1.0)];
            
            [path moveToPoint:CGPointMake(center.x, center.y + 7.0 - 4.0 + 12.0)];
            [path addLineToPoint:CGPointMake(center.x, hidarishita.y - 3.0)];
            [path moveToPoint:CGPointMake(center.x - 7.0, hidarishita.y - 3.0)];
            [path addLineToPoint:CGPointMake(center.x + 7.0, hidarishita.y - 3.0)];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineWidth = 4.0;
            
            [EEHUD_COLOR_IMAGE set];
            [path stroke];
            
            
            break;
            
        case EEHUDResultViewStyleLocation:
            
            ueMargin = 2.0;
            hidariMargin = 5.0;
            migiMargin = 5.0;
            shitaMargin = -4.0;
            
            hidariue = CGPointMake(center.x - r + hidariMargin, center.y - r + ueMargin);
            migiue = CGPointMake(center.x + r - migiMargin, center.y - r + ueMargin);
            migishita = CGPointMake(center.x + r - migiMargin, center.y + r - shitaMargin);
            hidarishita = CGPointMake(center.x - r + hidariMargin, center.y + r - shitaMargin);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(center.x - 2, hidarishita.y - 7)];
            [path addLineToPoint:CGPointMake(center.x, hidarishita.y - 5)];
            [path addLineToPoint:CGPointMake(center.x + 2, hidarishita.y - 7)];
            [path addLineToPoint:CGPointMake(center.x + 20.0, hidariue.y + 24.0)];
            [path addArcWithCenter:CGPointMake(center.x, hidariue.y + 20.0)
                            radius:(sqrt(416))
                        startAngle:atan(5.0/20.0)
                          endAngle:(M_PI - atan(5.0/20.0))
                         clockwise:NO];
            [path closePath];
            
            path.lineCapStyle = kCGLineCapRound;
            path.lineJoinStyle = kCGLineJoinRound;
            path.lineWidth = 4.0;
            
            [path addArcWithCenter:CGPointMake(center.x, center.y - 9.0)
                            radius:9.0
                        startAngle:0.0
                          endAngle:1.999999*M_PI
                         clockwise:YES];
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            break;
            
        case EEHUDResultViewStyleHome:
            
            ueMargin = 5.0;
            hidariMargin = -5.0;
            migiMargin = -5.0;
            shitaMargin = 0.0;
            
            hidariue = CGPointMake(center.x - r + hidariMargin, center.y - r + ueMargin);
            migiue = CGPointMake(center.x + r - migiMargin, center.y - r + ueMargin);
            migishita = CGPointMake(center.x + r - migiMargin, center.y + r - shitaMargin);
            hidarishita = CGPointMake(center.x - r + hidariMargin, center.y + r - shitaMargin);
            
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(center.x, hidariue.y)];
            
            theta = atan((center.y + 2.0 - hidariue.y)/(center.x - hidariue.x));
            
            [path addLineToPoint:CGPointMake(hidariue.x, center.y + 2.0)];
            [path addCurveToPoint:CGPointMake(hidariue.x + 9.0*sin(theta) + 9.0*2.0*cos(theta), center.y + 2.0 + 9.0*cos(theta) - 2.0*9.0*sin(theta))
                    controlPoint1:CGPointMake(hidariue.x + 9.0*sin(theta), center.y + 2.0 + 9.0*cos(theta))
                    controlPoint2:CGPointMake(hidariue.x + 9.0*sin(theta) + 9.0*cos(theta), center.y + 2.0 + 9.0*cos(theta) - 9.0*sin(theta))];
            [path addLineToPoint:CGPointMake(center.x, hidariue.y + 9.0/cos(atan((center.y + 2.0 - hidariue.y)/(center.x - hidariue.x))))];
            [path addLineToPoint:CGPointMake(migiue.x - 9.0*sin(theta) - 9.0*2.0*cos(theta), center.y + 2.0 + 9.0*cos(theta) - 2.0*9.0*sin(theta))];
            [path addCurveToPoint:CGPointMake(migiue.x, center.y + 2.0)
                    controlPoint1:CGPointMake(migiue.x - 9.0*sin(theta) - 9.0*cos(theta), center.y + 2.0 + 9.0*cos(theta) - 9.0*sin(theta))
                    controlPoint2:CGPointMake(migiue.x - 9.0*sin(theta), center.y + 2.0 + 9.0*cos(theta))];
            [path closePath];
            
            path.lineWidth = 1.0;
            path.lineJoinStyle = kCGLineJoinRound;
            path.lineCapStyle = kCGLineCapRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            path = nil;
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(center.x - 10.0, hidarishita.y)];
            [path addLineToPoint:CGPointMake(center.x - 10.0, hidarishita.y - 5.0)];
            [path addArcWithCenter:CGPointMake(center.x, hidarishita.y - 5.0)
                            radius:10.0
                        startAngle:M_PI
                          endAngle:0.0
                         clockwise:YES];
            [path addLineToPoint:CGPointMake(center.x + 10.0, migishita.y)];
            [path addLineToPoint:CGPointMake(center.x + 20.0, migishita.y)];
            [path addLineToPoint:CGPointMake(center.x + 20.0, migishita.y - 20.0)];
            [path addLineToPoint:CGPointMake(center.x, migishita.y - 20.0 - (20.0*tan(theta)))];
            [path addLineToPoint:CGPointMake(center.x - 20.0, hidarishita.y - 20.0)];
            [path addLineToPoint:CGPointMake(center.x - 20.0, hidarishita.y)];
            [path closePath];
            
            path.lineWidth = 4.0;
            path.lineJoinStyle = kCGLineJoinRound;
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            break;
        case EEHUDResultViewStyleTweet:
            
            ueMargin = 5.0;
            hidariMargin = -5.0;
            migiMargin = -5.0;
            shitaMargin = 0.0;
            
            hidariue = CGPointMake(center.x - r + hidariMargin, center.y - r + ueMargin);
            migiue = CGPointMake(center.x + r - migiMargin, center.y - r + ueMargin);
            migishita = CGPointMake(center.x + r - migiMargin, center.y + r - shitaMargin);
            hidarishita = CGPointMake(center.x - r + hidariMargin, center.y + r - shitaMargin);
            
//            path = [UIBezierPath bezierPath];
//            [path moveToPoint:hidariue];
//            [path addLineToPoint:migiue];
//            [path addLineToPoint:migishita];
//            [path addLineToPoint:hidarishita];
//            [path closePath];
//            
//            [EEHUD_COLOR_IMAGE set];
//            [path stroke];
//            
//            path = nil;
            
            path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(hidariue.x, 
                                                                     hidariue.y, 
                                                                     migiue.x - hidariue.x, 
                                                                     hidarishita.y - hidariue.y - 8.0)];
            
            [path addArcWithCenter:CGPointMake(center.x - 15.0, center.y)
                            radius:4.0
                        startAngle:0.0
                          endAngle:1.999999*M_PI
                         clockwise:YES];
            [path closePath];
            
            [path addArcWithCenter:CGPointMake(center.x - 0.0, center.y)
                            radius:4.0
                        startAngle:0.0
                          endAngle:1.999999*M_PI
                         clockwise:YES];
            [path closePath];

            [path addArcWithCenter:CGPointMake(center.x + 15.0, center.y)
                            radius:4.0
                        startAngle:0.0
                          endAngle:1.999999*M_PI
                         clockwise:YES];
            [path closePath];
            
            path.usesEvenOddFillRule = YES;
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            path = nil;
            path = [UIBezierPath bezierPath];
            
            [path moveToPoint:CGPointMake(hidarishita.x + 10.0, hidarishita.y - 15.0)];
            [path addQuadCurveToPoint:CGPointMake(hidarishita.x + 15.0, hidarishita.y)
                         controlPoint:CGPointMake(hidarishita.x + 20.0, hidarishita.y - 10.0)];
            [path addLineToPoint:CGPointMake(hidarishita.x + 40.0, hidarishita.y - 10.0)];
            [path closePath];
            
            [EEHUD_COLOR_IMAGE set];
            [path fill];
            
            break;
        default:            
            break;
    }
    
    
    
}

@end
