//
//  EEProgressHUD.h
//  KJPN
//
//  Created by Kudo Yoshiki on 11/12/05.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEHUDResultView.h"

typedef enum _EEHUDViewShowStyle {
    EEHUDViewShowStyleNone = 0,
    EEHUDViewShowStyleFadeIn = 1,
    EEHUDViewShowStyleLutz = 2,
    EEHUDViewShowStyleShake = 3,
    EEHUDViewShowStyleNoAnime = 4,
    EEHUDViewShowStyleFromRight = 5,
    EEHUDViewShowStyleFromLeft = 6,
    EEHUDViewShowStyleFromTop = 7,
    EEHUDViewShowStyleFromBottom = 8
} EEHUDViewShowStyle;

typedef enum _EEHUDViewHideStyle {
    EEHUDViewHideStyleNone = 0,
    EEHUDViewHideStyleFadeOut = 1,
    EEHUDViewHideStyleLutz = 2,
    EEHUDViewHideStyleShake = 3,
    EEHUDViewHideStyleNoAnime = 4,
    EEHUDViewHideStyleToLeft = 5,
    EEHUDViewHideStyleToRight = 6,
    EEHUDViewHideStyleToBottom = 7,
    EEHUDViewHideStyleToTop = 8
} EEHUDViewHideStyle;

@interface EEHUDView : UIWindow 

+ (void)growlWithMessage:(NSString *)message
               showStyle:(EEHUDViewShowStyle)showStyle
               hideStyle:(EEHUDViewHideStyle )hideStyle
         resultViewStyle:(EEHUDResultViewStyle)resultViewStyle
                showTime:(CGFloat )time;

+ (BOOL)isShowing;

@end
