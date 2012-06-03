//
//  EEProgressHUD.m
//  KJPN
//
//  Created by Kudo Yoshiki on 11/12/05.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import "EEHUDView.h"
#import <QuartzCore/QuartzCore.h>

#import "EEHUDViewConstants.h"

#pragma mark - ** EEHUDViewController **
@interface EEHUDViewController : UIViewController  {
    
    UIView *hudView_;
    UILabel *message_;
    EEHUDResultView *resultView_;
    
}
@property (nonatomic, strong) UIView *hudView;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) EEHUDResultView *resultView;

@end

@implementation EEHUDViewController
@synthesize hudView = hudView_;
@synthesize message = message_;
@synthesize resultView = resultView_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 無ければ作る
    if (!self.hudView) [self hudView];
    if (!self.message) [self message];
    if (!self.resultView) [self resultView];
}

- (void)loadView
{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 1.0)];
    baseView.backgroundColor = [UIColor clearColor];
    baseView.userInteractionEnabled = NO;
    self.view = baseView;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.hudView = nil;
    self.message = nil;
    self.resultView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    /***************************************************************
     回転は目的に応じて
     
        EEHUDViewConstants.h
     
     内の各定数項を変更してください
     ***************************************************************/
    
    BOOL boolSwitch;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            boolSwitch = EEHUD_INTERFACE_ORIENTATION_PORTRAIT;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            boolSwitch = EEHUD_INTERFACE_ORIENTATION_LANDSCAPE_LEFT;
            break;
        case UIInterfaceOrientationLandscapeRight:
            boolSwitch = EEHUD_INTERFACE_ORIENTATION_LANDSCAPE_RIGHT;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            boolSwitch = EEHUD_INTERFACE_ORIENTATION_PORTRAIT_UPSIDEDOWN;
            break;
        default:
            boolSwitch = YES;
            break;
    }
    
    return boolSwitch;
}

- (void)viewDidLayoutSubviews
{
    CGRect hudRect = self.hudView.frame;
    
    switch (self.interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            hudRect.origin = CGPointMake((320.0 - hudRect.size.width)*0.5, (460.0 - hudRect.size.height)*0.5);
            break;
        case UIInterfaceOrientationLandscapeLeft:
            hudRect.origin = CGPointMake((480.0 - hudRect.size.width)*0.5, (300.0 - hudRect.size.height)*0.5);
            break;
        case UIInterfaceOrientationLandscapeRight:
            hudRect.origin = CGPointMake((480.0 - hudRect.size.width)*0.5, (300.0 - hudRect.size.height)*0.5);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            hudRect.origin = CGPointMake((320.0 - hudRect.size.width)*0.5, (460.0 - hudRect.size.height)*0.5);
            break;
        default:
            hudRect.origin = CGPointMake((320.0 - hudRect.size.width)*0.5, (460.0 - hudRect.size.height)*0.5);
            break;
    }
    
    self.hudView.frame = hudRect;
}

#pragma mark - Getter
- (UIView *)hudView
{
    if (!hudView_) {
        
        //CGSize fullRect = self.bounds.size;
        CGSize fullSize = CGSizeMake(320.0, 460.0);
        
        CGRect rect;
        rect.origin.x = (fullSize.width - EEHUD_VIEW_WIDTH) * 0.5;
        rect.origin.y = (fullSize.height - EEHUD_VIEW_HEIGHT) * 0.5;
        rect.size.width = EEHUD_VIEW_WIDTH;
        rect.size.height = EEHUD_VIEW_HEIGHT;
        
        hudView_ = [[UIView alloc] initWithFrame:rect];
        
        hudView_.backgroundColor = EEHUD_COLOR_HUDVIEW;
        hudView_.layer.cornerRadius = EEHUD_VIEW_CORNER_RADIUS;
        hudView_.clipsToBounds = YES;
        
    }
    
    if (!hudView_.superview) {
        [self.view addSubview:hudView_];
    }
    
    return hudView_;
}

- (UILabel *)message
{
    if (!message_) {
        
        /***
         message
         ***/
        CGRect messageRect = CGRectMake(EEHUD_VIEW_BOTHENDS_MARGIN,
                                        EEHUD_VIEW_HEIGHT - EEHUD_LABEL_HEIGHT - EEHUD_LABEL_BOTTOM_MARGIN,
                                        EEHUD_VIEW_WIDTH - 2.0*EEHUD_VIEW_BOTHENDS_MARGIN,
                                        EEHUD_LABEL_HEIGHT);
        message_ = [[UILabel alloc] initWithFrame:messageRect];
        message_.backgroundColor = [UIColor clearColor];
        message_.textAlignment = UITextAlignmentCenter;
        message_.font = EEHUD_LABEL_FONT;
        message_.textColor = EEHUD_LABEL_TEXTCOLOR;
        
    }
    
    if (!message_.superview) {
        [self.hudView addSubview:message_];
    }
    
    return message_;
}

- (EEHUDResultView *)resultView
{
    if (!resultView_) {
        
        /***
         resultView
         ***/
        CGRect rect;
        rect.origin = CGPointMake(EEHUD_VIEW_BOTHENDS_MARGIN, EEHUD_IMAGE_ORIGINY);
        rect.size.width = EEHUD_IMAGE_WIDTH - 2.0 * EEHUD_VIEW_BOTHENDS_MARGIN;
        rect.size.height = EEHUD_IMAGE_HEIGHT;
        
        resultView_ = [[EEHUDResultView alloc] initWithFrame:rect];
        resultView_.backgroundColor = [UIColor clearColor];
        
    }
    
    if (!resultView_.superview) {
        [self.hudView addSubview:resultView_];
    }
    
    return resultView_;
}

@end

#pragma mark - Constant
typedef enum EEHUDViewState_{
    EEHUDViewStateTransparent = 0,          // 非表示時
    EEHUDViewStateAnimatingIn = 1,          // 表示時のアニメーション中
    EEHUDViewStateAppeal = 2,               // 表示中
    EEHUDViewStateAnimatingOut = 3          // 表示終わって消す為のアニメーション中
}EEHUDViewState;

#pragma mark - ** EEHUDView **
@interface EEHUDView ()
{
    EEHUDViewController *viewController_;
    NSTimer *timer_;
    CGFloat time_;
}

@property (nonatomic) EEHUDViewShowStyle showStyle;
@property (nonatomic) EEHUDViewHideStyle hideStyle;
@property (nonatomic) EEHUDResultViewStyle resultViewStyle;
@property (nonatomic) EEHUDViewState state;

@property (nonatomic, weak) UIWindow *previousKeyWindow;
@property (nonatomic, strong) EEHUDViewController *viewController;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat time;

+ (id)sharedView;
- (void)growlWithMessage:(NSString *)message
               showStyle:(EEHUDViewShowStyle)showStyle
               hideStyle:(EEHUDViewHideStyle)hideStyle
         resultViewStyle:(EEHUDResultViewStyle)resultViewStyle
                showTime:(CGFloat)time;

- (void)showAnimation;
- (void)hideAnimation:(NSTimer *)timer;
- (void)cleaning;
- (void)makeTimer;

@end

#pragma mark - Implementation
@implementation EEHUDView

@synthesize showStyle;
@synthesize hideStyle;
@synthesize resultViewStyle;
@synthesize state;

@synthesize previousKeyWindow;
@synthesize viewController = viewController_;
@synthesize timer = timer_;
@synthesize time = time_;

static EEHUDView *sharedInstance_ = nil;

+ (id)sharedView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance_) {
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
        self.state = EEHUDViewStateTransparent;
        
        
    }
	
    return self;
}

#pragma mark - Common
+ (void)growlWithMessage:(NSString *)message
               showStyle:(EEHUDViewShowStyle)showStyle
               hideStyle:(EEHUDViewHideStyle)hideStyle
         resultViewStyle:(EEHUDResultViewStyle)resultViewStyle
                showTime:(CGFloat)time
{
    [[EEHUDView sharedView] growlWithMessage:message
                                   showStyle:showStyle
                                   hideStyle:hideStyle
                             resultViewStyle:resultViewStyle
                                    showTime:time];
}

+ (BOOL)isShowing
{
    BOOL is = NO;
    
    EEHUDView *hud = [EEHUDView sharedView];
    if (hud.previousKeyWindow) {
        is = YES;
    }
    
    return is;
}

#pragma mark - Private
- (void)growlWithMessage:(NSString *)aMessage
               showStyle:(EEHUDViewShowStyle)aShowStyle
               hideStyle:(EEHUDViewHideStyle)aHideStyle
         resultViewStyle:(EEHUDResultViewStyle)aResultViewStyle
                showTime:(CGFloat)aTime
{
    if (!self.viewController) {
        self.viewController = [[EEHUDViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    if (!self.viewController.view.superview) {
        [self addSubview:viewController_.view];
    }
    
    /* show */
    if(![self isKeyWindow]) {
        
        [[UIApplication sharedApplication].windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIWindow *window = (UIWindow*)obj;
            if(window.windowLevel == UIWindowLevelNormal && ![[window class] isEqual:[EEHUDView class]]) {
                self.previousKeyWindow = window;
                *stop = YES;
            }
        }];
        
        [self makeKeyAndVisible];
    }
    
    /******************************
     状態によって処理変える。
     ●EEHUDViewStateTransparent = 0,          // 非表示時
        アニメーションスタート(特に問題無し)
     
     ●EEHUDViewStateAnimatingIn = 1,          // 表示時のアニメーション中
        表示開始した時に呼ばれた場合はアニメーション自体をやり直す。
        今動いてるアニメーション削除して作り直し
     
     ●EEHUDViewStateAppeal = 2,               // 表示中
        このフェーズで呼ばれたら表示アニメーションはせずにmessage&resultViewを更新
     
     ●EEHUDViewStateAnimatingOut = 3          // 表示終わって消す為のアニメーション中
        今動いてるアニメーションを削除し、表示アニメーションからスタート
     ******************************/
    
    
    switch (self.state) {
        case EEHUDViewStateTransparent:
            
            self.viewController.message.text = aMessage;
            self.viewController.resultView.viewStyle = aResultViewStyle;
            
            self.showStyle = aShowStyle;
            self.hideStyle = aHideStyle;
            
            self.time = aTime;
            
            // アニメーションスタート
            [self showAnimation];
            
            break;
        case EEHUDViewStateAnimatingIn:
            // animationDidStartで削除するので普通に追加する
            
            self.viewController.message.text = aMessage;
            self.viewController.resultView.viewStyle = aResultViewStyle;
            
            self.showStyle = aShowStyle;
            self.hideStyle = aHideStyle;
            
            // アニメーションスタート
            [self showAnimation];
            
            break;

        case EEHUDViewStateAppeal:
            
            // EEHUDViewStateAppeal状態へと遷移した模様
            self.viewController.message.text = aMessage;
            self.viewController.resultView.viewStyle = aResultViewStyle;
            
            self.hideStyle = aHideStyle;
            
            // タイマーリフレッシュ
            [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:aTime]];
            
            break;
        case EEHUDViewStateAnimatingOut:
            
            self.viewController.message.text = aMessage;
            self.viewController.resultView.viewStyle = aResultViewStyle;
            
            self.showStyle = aShowStyle;
            self.hideStyle = aHideStyle;
            
            self.time = aTime;
            
            // アニメーションスタート
            [self showAnimation];
            
            break;
        default:
            break;
    }
}

#pragma mark - Private
- (void)showAnimation
{
    CGFloat fromAlpha, toAlpha;
    CGRect fromRect, toRect;
    CGPoint point1, point2;
    
    CGFloat duration;
    
    CAAnimationGroup *allAnimationGroup;
    CABasicAnimation *alphaAnime;
    CABasicAnimation *expandAnime;
    CABasicAnimation *jumpUpAnime, *jumpDownAnime;
    CABasicAnimation *rotateAnime;
    CAKeyframeAnimation *shakeAnime;
    CABasicAnimation *moveAnime;
    
    CGFloat shakeTheta;
    NSMutableArray *transforms, *timingFunctions, *durations;
    
    // ユニークなkey作成
    CFUUIDRef   uuid;
    NSString*   identifier;
    uuid = CFUUIDCreate(NULL);
    identifier = (__bridge NSString*)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    NSString *animationKey = identifier;
    
    
    switch (self.showStyle) {
        case EEHUDViewShowStyleFadeIn:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            fromRect = self.viewController.hudView.frame;
            fromRect.size.width *= EEHUD_SIZERATIO_FADEIN;
            fromRect.size.height *= EEHUD_SIZERATIO_FADEIN;
            
            toRect = self.viewController.hudView.frame;
            
            duration = EEHUD_DURATION_FADEIN;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 拡大
            expandAnime = [CABasicAnimation animationWithKeyPath:@"bounds"];
            expandAnime.fromValue = [NSValue valueWithCGRect:fromRect];
            expandAnime.toValue = [NSValue valueWithCGRect:toRect];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, expandAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            allAnimationGroup.delegate = self;
            
            // start
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            
            break;
            
        case EEHUDViewShowStyleLutz:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            duration = EEHUD_DURATION_LUTZIN;
            
            fromRect = self.viewController.hudView.bounds;
            fromRect.size.width *= EEHUD_SIZERATIO_LUTZIN;
            fromRect.size.height *= EEHUD_SIZERATIO_LUTZIN;
            
            toRect = self.viewController.hudView.bounds;
            
            //
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.y -= EEHUD_HEIGHT_JUMP_LUTZIN;
            
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = duration * 0.5;
            alphaAnime.beginTime = 0.0;
            
            // 拡大
            expandAnime = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
            expandAnime.fromValue = [NSValue valueWithCGSize:fromRect.size];
            expandAnime.toValue = [NSValue valueWithCGSize:toRect.size];
            expandAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            expandAnime.removedOnCompletion = NO;
            expandAnime.fillMode = kCAFillModeForwards;
            expandAnime.duration = duration * 0.5;
            expandAnime.beginTime = 0.0;
            
            // jumpUP
            jumpUpAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            jumpUpAnime.fromValue = [NSValue valueWithCGPoint:point1];
            jumpUpAnime.toValue = [NSValue valueWithCGPoint:point2];
            jumpUpAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            jumpUpAnime.duration = duration * 0.5;
            jumpUpAnime.beginTime = 0.0;
            
            // jumpDown
            jumpDownAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            jumpDownAnime.fromValue = [NSValue valueWithCGPoint:point2];
            jumpDownAnime.toValue = [NSValue valueWithCGPoint:point1];
            jumpDownAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            jumpDownAnime.duration = duration * 0.5;
            jumpDownAnime.beginTime = duration * 0.5;
            
            // 回転
            rotateAnime = [CABasicAnimation animationWithKeyPath:@"transform"];
            rotateAnime.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            rotateAnime.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.0f, 1.0f, 0.0f)];
            rotateAnime.repeatCount = EEHUD_COUNT_ROTATION_LUTZIN;
            rotateAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            rotateAnime.duration = duration / (float)EEHUD_COUNT_ROTATION_LUTZIN;
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:
                                            alphaAnime,
                                            expandAnime,
                                            jumpUpAnime,
                                            jumpDownAnime,
                                            rotateAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleShake:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            duration = EEHUD_DURATION_SHAKEIN;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = duration * 0.5;
            alphaAnime.beginTime = 0.0;
            
            // シェイク
            shakeAnime = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            
            shakeTheta = 0.5 * EEHUD_THETA_DEGREE_SHAKEIN * M_PI / 180.0;
            transforms = [NSMutableArray array];
            timingFunctions = [NSMutableArray array];
            durations = [NSMutableArray array];
            
            for (int i = 0; i < EEHUD_COUNT_SHAKEIN; i++) {
                
                /* transform */
                if (i == 0) {
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:0.0]];
                    
                }else if (i == EEHUD_COUNT_SHAKEIN - 1){
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }else if (i % 2 == 0){
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(shakeTheta, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }else {
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(- shakeTheta, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }
                
                /* timingFunction */
                if (i == 0) {
                    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
                    
                }else {
                    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                }
            }
            
            shakeAnime.values = transforms;
            shakeAnime.timingFunctions = timingFunctions;
            shakeAnime.keyTimes = durations;
            shakeAnime.duration = duration;
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, shakeAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.delegate = self;
            
            //
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleFromLeft:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point1.x -= EEHUD_LENGTH_FROM_LEFT;
            
            duration = EEHUD_DURATION_FROM_LEFT;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleFromRight:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point1.x += EEHUD_LENGTH_FROM_RIGHT;
            
            duration = EEHUD_DURATION_FROM_RIGHT;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleNoAnime:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = EEHUD_DURATION_NOANIME;
            alphaAnime.delegate = self;
            
            //
            [self.viewController.hudView.layer addAnimation:alphaAnime forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleFromTop:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point1.y -= EEHUD_LENGTH_FROM_TOP;
            
            duration = EEHUD_DURATION_FROM_TOP;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewShowStyleFromBottom:
            
            fromAlpha = 0.0;
            toAlpha = 1.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point1.y += EEHUD_LENGTH_FROM_BOTTOM;
            
            duration = EEHUD_DURATION_FROM_BOTTOM;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        default:
            break;
    }
}

- (void)hideAnimation:(NSTimer *)timer;
{
    CGFloat fromAlpha, toAlpha;
    CGRect fromRect, toRect;
    CGPoint point1, point2;
    
    CGFloat duration;
    
    CAAnimationGroup *allAnimationGroup;
    CABasicAnimation *alphaAnime;
    CABasicAnimation *expandAnime;
    CABasicAnimation *jumpUpAnime, *jumpDownAnime;
    CABasicAnimation *rotateAnime;
    CAKeyframeAnimation *shakeAnime;
    CABasicAnimation *moveAnime;
    
    CGFloat shakeTheta;
    NSMutableArray *transforms, *timingFunctions, *durations;
    
    // ユニークなkey作成
    CFUUIDRef   uuid;
    NSString*   identifier;
    uuid = CFUUIDCreate(NULL);
    identifier = (__bridge NSString*)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    NSString *animationKey = identifier;
    
    switch (self.hideStyle) {
        case EEHUDViewHideStyleFadeOut:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            fromRect = self.viewController.hudView.frame;
            toRect = self.viewController.hudView.frame;
            toRect.size.width *= EEHUD_SIZERATIO_FADEOUT;
            toRect.size.height *= EEHUD_SIZERATIO_FADEOUT;
            
            duration = EEHUD_DURATION_FADEOUT;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 拡大
            expandAnime = [CABasicAnimation animationWithKeyPath:@"bounds"];
            expandAnime.fromValue = [NSValue valueWithCGRect:fromRect];
            expandAnime.toValue = [NSValue valueWithCGRect:toRect];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, expandAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            allAnimationGroup.delegate = self;
            
            // start
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleLutz:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            duration = EEHUD_DURATION_LUTZOUT;
            
            fromRect = self.viewController.hudView.bounds;
            
            toRect = self.viewController.hudView.bounds;
            toRect.size.width *= EEHUD_SIZERATIO_LUTZOUT;
            toRect.size.height *= EEHUD_SIZERATIO_LUTZOUT;
            
            //
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.y -= EEHUD_HEIGHT_JUMP_LUTZOUT;
            
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = duration * 0.5;
            alphaAnime.beginTime = duration * 0.5;
            
            // 拡大
            expandAnime = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
            expandAnime.fromValue = [NSValue valueWithCGSize:fromRect.size];
            expandAnime.toValue = [NSValue valueWithCGSize:toRect.size];
            expandAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            expandAnime.removedOnCompletion = NO;
            expandAnime.fillMode = kCAFillModeForwards;
            expandAnime.duration = duration * 0.5;
            expandAnime.beginTime = 0.0;
            
            // jumpUP
            jumpUpAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            jumpUpAnime.fromValue = [NSValue valueWithCGPoint:point1];
            jumpUpAnime.toValue = [NSValue valueWithCGPoint:point2];
            jumpUpAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            jumpUpAnime.duration = duration * 0.5;
            jumpUpAnime.beginTime = 0.0;
            
            // jumpDown
            jumpDownAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            jumpDownAnime.fromValue = [NSValue valueWithCGPoint:point2];
            jumpDownAnime.toValue = [NSValue valueWithCGPoint:point1];
            jumpDownAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            jumpDownAnime.duration = duration * 0.5;
            jumpDownAnime.beginTime = duration * 0.5;
            
            // 回転
            rotateAnime = [CABasicAnimation animationWithKeyPath:@"transform"];
            rotateAnime.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            rotateAnime.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.0f, 1.0f, 0.0f)];
            rotateAnime.repeatCount = EEHUD_COUNT_ROTATION_LUTZOUT;
            rotateAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            rotateAnime.duration = duration / (float)EEHUD_COUNT_ROTATION_LUTZOUT;
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:
                                            alphaAnime,
                                            expandAnime,
                                            jumpUpAnime,
                                            jumpDownAnime,
                                            rotateAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleShake:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            duration = EEHUD_DURATION_SHAKEIN;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = duration * 0.7;
            alphaAnime.beginTime = 0.3 * duration;
            
            // シェイク
            shakeAnime = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            
            shakeTheta = 0.5 * EEHUD_THETA_DEGREE_SHAKEIN * M_PI / 180.0;
            transforms = [NSMutableArray array];
            timingFunctions = [NSMutableArray array];
            durations = [NSMutableArray array];
            
            for (int i = 0; i < EEHUD_COUNT_SHAKEIN; i++) {
                
                /* transform */
                if (i == 0) {
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:0.0]];
                    
                }else if (i == EEHUD_COUNT_SHAKEIN - 1){
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }else if (i % 2 == 0){
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(shakeTheta, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }else {
                    [transforms addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(- shakeTheta, 0.0f, 0.0f, 1.0f)]];
                    [durations addObject:[NSNumber numberWithFloat:(i - 0.5)/((CGFloat)EEHUD_COUNT_SHAKEIN - 1.0)]];
                    
                }
                
                /* timingFunction */
                if (i == 0) {
                    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
                    
                }else {
                    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                }
            }
            
            shakeAnime.values = transforms;
            shakeAnime.timingFunctions = timingFunctions;
            shakeAnime.keyTimes = durations;
            shakeAnime.duration = duration;
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, shakeAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.delegate = self;
            
            //
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleToRight:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.x += EEHUD_LENGTH_TO_RIGHT;
            
            duration = EEHUD_DURATION_TO_RIGHT;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleToLeft:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.x -= EEHUD_LENGTH_TO_LEFT;
            
            duration = EEHUD_DURATION_TO_LEFT;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleNoAnime:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            alphaAnime.removedOnCompletion = NO;
            alphaAnime.fillMode = kCAFillModeForwards;
            alphaAnime.duration = EEHUD_DURATION_NOANIME;
            alphaAnime.delegate = self;
            
            //
            [self.viewController.hudView.layer addAnimation:alphaAnime forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleToBottom:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.y += EEHUD_LENGTH_TO_BOTTOM;
            
            duration = EEHUD_DURATION_TO_BOTTOM;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        case EEHUDViewHideStyleToTop:
            
            fromAlpha = 1.0;
            toAlpha = 0.0;
            
            point1 = self.viewController.hudView.layer.position;
            point2 = point1;
            point2.y -= EEHUD_LENGTH_TO_TOP;
            
            duration = EEHUD_DURATION_TO_TOP;
            
            // 透明度
            alphaAnime = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnime.fromValue = [NSNumber numberWithFloat:fromAlpha];
            alphaAnime.toValue = [NSNumber numberWithFloat:toAlpha];
            
            // 移動
            moveAnime = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnime.fromValue = [NSValue valueWithCGPoint:point1];
            moveAnime.toValue = [NSValue valueWithCGPoint:point2];
            
            // 合体
            allAnimationGroup = [CAAnimationGroup animation];
            allAnimationGroup.animations = [NSArray arrayWithObjects:alphaAnime, moveAnime, nil];
            allAnimationGroup.removedOnCompletion = NO;
            allAnimationGroup.fillMode = kCAFillModeForwards;
            allAnimationGroup.duration = duration;
            allAnimationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            allAnimationGroup.delegate = self;
            
            // 
            [self.viewController.hudView.layer addAnimation:allAnimationGroup forKey:animationKey];
            
            break;
            
        default:
            break;
    }
}

- (void)makeTimer
{
    // 状態遷移
    self.state = EEHUDViewStateAppeal;
    
    // なぜかこのタイミングでタイマー発動
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time
                                                  target:self
                                                selector:@selector(hideAnimation:)
                                                userInfo:nil
                                                 repeats:NO];
}

#pragma mark - Animation Delegate
- (void)animationDidStart:(CAAnimation *)anim
{
    switch (self.state) {
        case EEHUDViewStateTransparent:
            // 非表示状態
            
            // 状態更新
            self.state = EEHUDViewStateAnimatingIn;
            
            break;
        
        case EEHUDViewStateAnimatingIn:
            // アニメーション中
            
            // 削除
            for (NSString *key in self.viewController.hudView.layer.animationKeys) {
                if (![[self.viewController.hudView.layer animationForKey:key] isEqual:anim]) {
                    [self.viewController.hudView.layer removeAnimationForKey:key];
                }
            }
            break;
        
        case EEHUDViewStateAppeal:
            
            // 状態更新
            self.state = EEHUDViewStateAnimatingOut;
            
            break;
            
        case EEHUDViewStateAnimatingOut:
            
            // 状態更新
            self.state = EEHUDViewStateAnimatingIn;
            
            break;
            
        default:
            break;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        
        switch (self.state) {
            case EEHUDViewStateAnimatingIn:
                
                // 状態更新
                self.state = EEHUDViewStateAppeal;
                
                // 消去 (resultViewとmessage出てくる)
                [self.viewController.hudView.layer removeAllAnimations];
                
                // なぜかこのタイミングでタイマー発動
                self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time
                                                              target:self
                                                            selector:@selector(hideAnimation:)
                                                            userInfo:nil
                                                             repeats:NO];
                
                break;
                
            case EEHUDViewStateAnimatingOut:
                
                // 全て終わったので初期化
                [self cleaning];
                
                break;
                
            default:
                break;
        }
        
        
    }
    
    
}

#pragma mark - END
- (void)cleaning
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    if (self.viewController.hudView.superview) {
        [self.viewController.hudView removeFromSuperview];
    }
    self.viewController.hudView = nil;
    
    if (self.viewController.view.superview) {
        [self.viewController.view removeFromSuperview];
    }
    
    self.viewController = nil;
    
    self.state = EEHUDViewStateTransparent;
    
    [sharedInstance_.previousKeyWindow makeKeyWindow];
    sharedInstance_.previousKeyWindow = nil;
    
}

@end

