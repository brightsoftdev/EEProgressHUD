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
            
        default:
        
            
            break;
    }
    
    
    
}

@end
