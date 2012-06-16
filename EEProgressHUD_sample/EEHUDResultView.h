//
//  EEProgressHUDResultView.h
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 12/02/12.
//  Copyright (c) 2012年 Milestoneeee.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _EEHUDResultViewStyle {
    EEHUDResultViewStyleOK = 0,
    EEHUDResultViewStyleNG = 1,
    EEHUDResultViewStyleChecked = 2,
    EEHUDResultViewStyleUpArrow = 3,
    EEHUDResultViewStyleDownArrow = 4,
    EEHUDResultViewStyleRightArrow = 5,
    EEHUDResultViewStyleLeftArrow = 6,
    EEHUDResultViewStylePlay = 7,
    EEHUDResultViewStylePause = 8,
    EEHUDResultViewStyleZero = 9,
    EEHUDResultViewStyleOne = 10,
    EEHUDResultViewStyleTwo = 11,
    EEHUDResultViewStyleThree = 12,
    EEHUDResultViewStyleFour = 13,
    EEHUDResultViewStyleFive = 14,
    EEHUDResultViewStyleSix = 15,
    EEHUDResultViewStyleSeven = 16,
    EEHUDResultViewStyleEight = 17,
    EEHUDResultViewStyleNine = 18,
    EEHUDResultViewStyleExclamation = 19,
    EEHUDResultViewStyleCloud = 20,
    EEHUDResultViewStyleCloudUp = 21,
    EEHUDResultViewStyleCloudDown = 22,
    EEHUDResultViewStyleMail = 23,
    EEHUDResultViewStyleMicrophone = 24,
    EEHUDResultViewStyleLocation = 25,
    EEHUDResultViewStyleHome = 26,
    EEHUDResultViewStyleTweet = 27
} EEHUDResultViewStyle;
@interface EEHUDResultView : UIView {
    
    EEHUDResultViewStyle viewStyle_;
}

@property (nonatomic) EEHUDResultViewStyle viewStyle;
//- (id)init;
@end
