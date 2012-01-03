//
//  EEProgressHUD.h
//  KJPN
//
//  Created by Kudo Yoshiki on 11/12/05.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _EEProgressHUDShowStyle {
    EEProgressHUDShowStyleNone = 0,
    EEProgressHUDShowStyleFadeIn = 1,
    EEProgressHUDShowStyleLutz = 2,
    EEProgressHUDShowStyleShake = 3,
    EEProgressHUDShowStyleNoAnime = 4,
    EEProgressHUDShowStyleFromRight = 5,
    EEProgressHUDShowStyleFromLeft = 6
} EEProgressHUDShowStyle;

typedef enum _EEProgressHUDHideStyle {
    EEProgressHUDHideStyleNone = 0,
    EEProgressHUDHideStyleFadeOut = 1,
    EEProgressHUDHideStyleLutz = 2,
    EEProgressHUDHideStyleShake = 3,
    EEProgressHUDHideStyleNoAnime = 4,
    EEProgressHUDHideStyleToLeft = 5,
    EEProgressHUDHideStyleToRight = 6
} EEProgressHUDHideStyle;

typedef enum _EEProgressHUDProgressViewStyle {
    EEProgressHUDProgressViewStyleNone = 0,
    EEProgressHUDProgressViewStyleIndicator = 1
} EEProgressHUDProgressViewStyle;

typedef enum _EEProgressHUDResultViewStyle {
    EEProgressHUDResultViewStyleNone = 0,
    EEProgressHUDResultViewStyleOK = 1,
    EEProgressHUDResultViewStyleNG = 2,
    EEProgressHUDResultViewStyleChecked = 3
    
} EEProgressHUDResultViewStyle;

@interface EEHUDView : UIWindow 

/* Progress Type */
+ (void)showWithMessage:(NSString *)message 
              showStyle:(EEProgressHUDShowStyle)showStyle 
      progressViewStyle:(EEProgressHUDProgressViewStyle)progressViewStyle;
+ (void)hideWithMessage:(NSString *)message
              hideStyle:(EEProgressHUDHideStyle)hideStyle
        resultViewStyle:(EEProgressHUDResultViewStyle)resultViewStyle;

/* Growl Type */
+ (void)growlWithMessage:(NSString *)message
               showStyle:(EEProgressHUDShowStyle)showStyle
               hideStyle:(EEProgressHUDHideStyle )hideStyle
         resultViewStyle:(EEProgressHUDResultViewStyle)resultViewStyle
                showTime:(CGFloat )time;

/* information */
+ (BOOL)isShowing;

@end
