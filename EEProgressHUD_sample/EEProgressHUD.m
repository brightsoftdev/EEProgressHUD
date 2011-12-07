//
//  EEProgressHUD.m
//  KJPN
//
//  Created by Kudo Yoshiki on 11/12/05.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import "EEProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

#define HUD_VIEW_WIDTH 161.8
#define HUD_VIEW_HEIGHT 100.0
#define HUD_IMAGE_ORIGINY 10.0
#define HUD_IMAGE_WIDTH 161.8
#define HUD_IMAGE_HEIGHT 60.0
#define HUD_LABEL_ORIGINY_OFFSET 10.0
#define HUD_LABEL_WIDTH 161.8
#define HUD_LABEL_HEIGHT 20.0

#define HUD_DURATION_APPEAR 0.25
#define HUD_DURATION_DISAPPEAR 0.25

#define HUD_RATIO_FADESIZE 0.9
#define HUD_TIME_DELAY 1.6

/*****************************************
 original result view
 
 
 
 *********************************************/

#pragma mark -  ** EEProgressHUDResultViewStyleOK **
@interface EEProgressHUDResultView : UIView
- (id)init;
@end

@implementation EEProgressHUDResultView
- (id)init {
    
    CGRect rect;
    rect.origin = CGPointMake(0.0, HUD_IMAGE_ORIGINY);
    rect.size.width = HUD_IMAGE_WIDTH;
    rect.size.height = HUD_IMAGE_HEIGHT;
    self = [super initWithFrame:rect];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}
@end

#pragma mark - EEProgressHUDResultViewOK
@interface EEProgressHUDResultViewOK : EEProgressHUDResultView
- (id)init;
@end
@implementation EEProgressHUDResultViewOK
- (id)init {self = [super init];return self;}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = self.bounds.size.width;             // 180
    CGFloat height = self.bounds.size.height;           // 60
    
    CGFloat oneSide = (width < height) ? width : height;
    
    CGPoint center = CGPointMake(width * 0.5, height * 0.5);
    CGFloat r = (oneSide * 0.5) * 0.5;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:r
                                                    startAngle:0.0
                                                      endAngle:2.0 * M_PI
                                                     clockwise:YES];
    path.lineWidth = 9.0;
    
    [[UIColor colorWithWhite:1.0 alpha:1.0] set];
    
    [path stroke];
    
}
@end

#pragma mark - EEProgressHUDResultViewNG
@interface EEProgressHUDResultViewNG : EEProgressHUDResultView
- (id)init;
@end
@implementation EEProgressHUDResultViewNG
- (id)init {self = [super init]; return self;}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = self.bounds.size.width;             // 180
    CGFloat height = self.bounds.size.height;           // 60
    
    CGFloat oneSide = (width < height) ? width : height;
    CGFloat r = (oneSide * 0.5) * 0.5;
    
    CGPoint center = CGPointMake(width * 0.5, height * 0.5);
    CGPoint hidariue = CGPointMake(center.x - r, center.y - r);
    CGPoint migishita = CGPointMake(center.x + r, center.y + r);
    CGPoint migiue = CGPointMake(center.x + r, center.y - r);
    CGPoint hidarishita = CGPointMake(center.x - r, center.y + r);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:hidariue];
    [path addLineToPoint:migishita];
    [path moveToPoint:migiue];
    [path addLineToPoint:hidarishita];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = 9.0;
    
//    CGFloat red, blue, green;
//    CGFloat alpha;
//    red = 1.0;
//    green = 1.0;
//    blue = 1.0;
//    alpha = 1.0;
//    [[UIColor colorWithRed:red
//                     green:green
//                      blue:blue
//                     alpha:alpha] set];
    [[UIColor colorWithWhite:1.0 alpha:1.0] set];
    
    [path stroke];
}
@end

#pragma mark - EEProgressHUDResultViewChecked
@interface EEProgressHUDResultViewChecked : EEProgressHUDResultView
- (id)init;
@end
@implementation EEProgressHUDResultViewChecked
- (id)init {self = [super init]; return self;}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = self.bounds.size.width;             // 180
    CGFloat height = self.bounds.size.height;           // 60
    
    CGFloat oneSide = (width < height) ? width : height;
    CGFloat r = (oneSide * 0.5) * 0.5;
    
    CGPoint center = CGPointMake(width * 0.5, height * 0.5);
    CGPoint start = CGPointMake(center.x - r, center.y);
    CGPoint relay = CGPointMake(start.x + r*0.8, start.y + r);
    CGPoint migiue = CGPointMake(center.x + r*1.2, center.y - r);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [path addLineToPoint:relay];
    [path addLineToPoint:migiue];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = 9.0;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [[UIColor colorWithWhite:1.0 alpha:1.0] set];
    
    [path stroke];
}
@end

/*****************************************
 HUD
 
 
 
 *********************************************/
#pragma mark - ** EEProgressHUD **
@interface EEProgressHUD ()

@property (nonatomic, weak) UIWindow *previousKeyWindow;
@property (nonatomic, strong) UIView *hudView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIView *imageView;

+ (id)sharedView;

- (void)showWithMessage:(NSString *)message 
              showStyle:(EEProgressHUDShowStyle)showStyle 
      progressViewStyle:(EEProgressHUDProgressViewStyle)progressViewStyle;
- (void)hideWithMessage:(NSString *)message
              hideStyle:(EEProgressHUDHideStyle)hideStyle
        resultViewStyle:(EEProgressHUDResultViewStyle)resultViewStyle;


- (void)cleaning;

/* Aniamtion */
- (void)animationAppear:(BOOL)isAppear;
@end

@implementation EEProgressHUD

@synthesize showStyle = showStyle_;
@synthesize hideStyle = hideStyle_;
@synthesize progressViewStyle = progressViewStyle_;
@synthesize resultViewStyle = resultViewStyle_;

@synthesize previousKeyWindow = previousKeywindow_;
@synthesize hudView = hudView_;
@synthesize messageLabel = messageLabel_;
@synthesize imageView = imageView_;

static EEProgressHUD *sharedInstance_ = nil;

+ (id)sharedView
{
    NSLog(@"sharedView");
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"dispatch");
        if (!sharedInstance_) {
            NSLog(@"Init");
            sharedInstance_ = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        }
    });
    
    return sharedInstance_;
}

#pragma mark - Initializer
- (id)initWithFrame:(CGRect)frame {
	
    if ((self = [super initWithFrame:frame])) {
		self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
    }
	
    return self;
}

#pragma mark - Common
+ (void)showWithMessage:(NSString *)message
              showStyle:(EEProgressHUDShowStyle)showStyle
      progressViewStyle:(EEProgressHUDProgressViewStyle)progressViewStyle
{
    NSLog(@"called ");
    
    [[EEProgressHUD sharedView] showWithMessage:message
                                      showStyle:showStyle
                              progressViewStyle:progressViewStyle];
}

+ (void)hideWithMessage:(NSString *)message
              hideStyle:(EEProgressHUDHideStyle)hideStyle
        resultViewStyle:(EEProgressHUDResultViewStyle)resultViewStyle
{
    [[EEProgressHUD sharedView] hideWithMessage:message
                                      hideStyle:hideStyle
                                resultViewStyle:resultViewStyle];
}

#pragma mark - Private
- (void)showWithMessage:(NSString *)message
              showStyle:(EEProgressHUDShowStyle)aShowStyle
      progressViewStyle:(EEProgressHUDProgressViewStyle)aProgressViewStyle
{
    self.showStyle = aShowStyle;
    self.progressViewStyle = aProgressViewStyle;
    
    /* make messageLabel */
    self.messageLabel.text = message;
    
    /* make imageView */
    [self imageView];
    
    NSLog(@"called show");
    
    /* show */
    if(![self isKeyWindow]) {
        
        [[UIApplication sharedApplication].windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIWindow *window = (UIWindow*)obj;
            if(window.windowLevel == UIWindowLevelNormal && ![[window class] isEqual:[EEProgressHUD class]]) {
                self.previousKeyWindow = window;
                *stop = YES;
            }
        }];
        
        [self makeKeyAndVisible];
    }
    
    /* Animation */
    [self animationAppear:YES];
}

- (void)hideWithMessage:(NSString *)message
              hideStyle:(EEProgressHUDHideStyle)aHideStyle
        resultViewStyle:(EEProgressHUDResultViewStyle)aResultViewStyle
{
    self.hideStyle = aHideStyle;
    self.resultViewStyle = aResultViewStyle;
    
    /* set message */
    self.messageLabel.text = message;
    
    /* make imageView */
    if (self.progressViewStyle == EEProgressHUDProgressViewStyleIndicator) {
        UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)self.imageView;
        [indicator stopAnimating];
    }
    if (self.imageView.superview) {
        [self.imageView removeFromSuperview];
    }
    
    self.imageView = nil;
    
    /* make imageView */
    [self imageView];
    
    /* hide with delay */
    double delayInSeconds = HUD_TIME_DELAY;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self animationAppear:NO];
    });
    
}

#pragma mark - Setter


#pragma mark - Getter
- (UIView *)hudView
{
    if (!hudView_) {
        
        CGSize fullRect = self.bounds.size;
        
        CGRect rect;
        rect.origin.x = (fullRect.width - HUD_VIEW_WIDTH) * 0.5;
        rect.origin.y = (fullRect.height - HUD_VIEW_HEIGHT) * 0.5;
        rect.size.width = HUD_VIEW_WIDTH;
        rect.size.height = HUD_VIEW_HEIGHT;
        hudView_ = [[UIView alloc] initWithFrame:rect];
        hudView_.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        hudView_.layer.cornerRadius = 7.0;
        hudView_.clipsToBounds = YES;
        
        [self addSubview:hudView_];
    }
    
    return hudView_;
}

- (UILabel *)messageLabel
{
    if (!messageLabel_) {
        
        CGRect rect;
        rect.origin.x = 0.0;
        rect.origin.y = HUD_IMAGE_HEIGHT + HUD_LABEL_ORIGINY_OFFSET;
        rect.size.width = HUD_LABEL_WIDTH;
        rect.size.height = HUD_LABEL_HEIGHT;
        messageLabel_ = [[UILabel alloc] initWithFrame:rect];
        messageLabel_.backgroundColor = [UIColor clearColor];
        messageLabel_.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
        messageLabel_.textAlignment = UITextAlignmentCenter;
        messageLabel_.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        messageLabel_.text = @"";
        
        [self.hudView addSubview:messageLabel_];
    }
    
    return messageLabel_;
}

- (UIView *)imageView
{
    if ((showStyle_ != EEProgressHUDShowStyleNone) && (hideStyle_ == EEProgressHUDHideStyleNone)) {
        
        /* SHOW */
        if (!imageView_) {
            
            if (self.progressViewStyle == EEProgressHUDProgressViewStyleIndicator) {
                
                imageView_ = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                CGRect indicatorRect = imageView_.frame;
                CGSize indicatorSize = indicatorRect.size;
                indicatorRect.origin.x = (HUD_IMAGE_WIDTH - indicatorSize.width) * 0.5;
                indicatorRect.origin.y = HUD_IMAGE_ORIGINY + (HUD_IMAGE_HEIGHT - indicatorSize.height) * 0.5;
                
                imageView_.frame = indicatorRect;
                
                [self.hudView addSubview:imageView_];
            }
        }
    }else if (hideStyle_ != EEProgressHUDHideStyleNone) {
        
        /* HIDE */
        if (!imageView_) {
            
            /* OK */
            if (self.resultViewStyle == EEProgressHUDResultViewStyleOK) {
                
                imageView_ = [[EEProgressHUDResultViewOK alloc] init];
                [self.hudView addSubview:imageView_];
            }else if (self.resultViewStyle == EEProgressHUDResultViewStyleNG) {
                
                imageView_ = [[EEProgressHUDResultViewNG alloc] init];
                [self.hudView addSubview:imageView_];
            }else if (self.resultViewStyle == EEProgressHUDResultViewStyleChecked) {
                
                imageView_ = [[EEProgressHUDResultViewChecked alloc] init];
                [self.hudView addSubview:imageView_];
            }
        }
    }
    
    return imageView_;
}

#pragma mark - Animation
- (void)animationAppear:(BOOL)isAppear
{
    /* Fade */
    if (showStyle_ == EEProgressHUDShowStyleFadeIn || hideStyle_ == EEProgressHUDHideStyleFadeOut) {
        
        CGFloat fromAlpha, toAlpha;
        CGRect fromHUDRect, toHUDRect;
        NSString *hudKey;
        CAMediaTimingFunction *timingFunction;
        
        CGFloat duration;
        
        if (isAppear) {
            // 出現
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            fromHUDRect = hudView_.frame;
            CGFloat width = hudView_.frame.size.width * HUD_RATIO_FADESIZE;
            CGFloat height = hudView_.frame.size.height * HUD_RATIO_FADESIZE;
            fromHUDRect.size.width = width;
            fromHUDRect.size.height = height;
            
            toHUDRect = hudView_.frame;
            
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            duration = HUD_DURATION_APPEAR;
            
            hudKey = @"hud_fadein";
            
            
        }else {
            // 消去
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            toHUDRect = hudView_.frame;
            CGFloat width = hudView_.frame.size.width * HUD_RATIO_FADESIZE;
            CGFloat height = hudView_.frame.size.height * HUD_RATIO_FADESIZE;
            toHUDRect.size.width = width;
            toHUDRect.size.height = height;
            
            fromHUDRect = hudView_.frame;
            
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            duration = HUD_DURATION_DISAPPEAR;
            
            hudKey = @"hud_fadeout";
            
        }
        
        /* hudView_ */
        CABasicAnimation *alphaHUDAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
        alphaHUDAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
        alphaHUDAnime.toValue = [NSNumber numberWithFloat:toAlpha];
        
        CABasicAnimation *bounceHUDAnime = [CABasicAnimation animationWithKeyPath:@"bounds"];
        bounceHUDAnime.fromValue = [NSValue valueWithCGRect:fromHUDRect];
        bounceHUDAnime.toValue = [NSValue valueWithCGRect:toHUDRect];
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.removedOnCompletion = NO;
        group.fillMode = kCAFillModeForwards;
        group.timingFunction = timingFunction;
        group.duration = duration;
        group.delegate = self;
        
        NSArray *animations = [NSArray arrayWithObjects:alphaHUDAnime, bounceHUDAnime, nil];
        group.animations = animations;
        
        [hudView_.layer addAnimation:group forKey:hudKey];
    }
}

#pragma mark - Aniamtion delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([anim isEqual:[hudView_.layer animationForKey:@"hud_fadein"]]) {
        
        CALayer *layer = [hudView_.layer presentationLayer];
        
        hudView_.layer.opacity = layer.opacity;
        hudView_.frame = layer.frame;
        
        [hudView_.layer removeAnimationForKey:@"hud_fadein"];
        
        if (self.progressViewStyle == EEProgressHUDProgressViewStyleIndicator) {
            UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)self.imageView;
            [indicator startAnimating];
        }
    }else if ([anim isEqual:[hudView_.layer animationForKey:@"hud_fadeout"]]) {
        
        // 更新
        CALayer *layer = [hudView_.layer presentationLayer];
        
        /* サイズを大きいのを基準にするため更新はしない */
        hudView_.layer.opacity = layer.opacity;
        
        [hudView_.layer removeAnimationForKey:@"hud_fadeout"];
        
        // 終了処理
        [self cleaning];
    }
}

#pragma mark - END
- (void)cleaning
{
    self.showStyle = EEProgressHUDShowStyleNone;
    self.hideStyle = EEProgressHUDHideStyleNone;
    self.progressViewStyle = EEProgressHUDProgressViewStyleNone;
    self.resultViewStyle = EEProgressHUDResultViewStyleNone;
    
    if (self.imageView.superview) {
        [self.imageView removeFromSuperview];
    }
    
    if (self.messageLabel.superview) {
        [self.messageLabel removeFromSuperview];
    }
    
    if (self.hudView.superview) {
        [self.hudView removeFromSuperview];
    }
    
    self.imageView = nil;
    self.messageLabel = nil;
    self.hudView = nil;
    
    [sharedInstance_.previousKeyWindow makeKeyWindow];
    sharedInstance_.previousKeyWindow = nil;
    
    //sharedInstance_ = nil;
    
    
    NSLog(@"cleaned");
}

@end

