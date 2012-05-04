//
//  EEProgressHUDResultView.h
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 12/02/12.
//  Copyright (c) 2012年 Milestoneeee.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _EEHUDResultViewStyle {
    EEHUDResultViewStyleNone = 0,
    EEHUDResultViewStyleOK = 1,
    EEHUDResultViewStyleNG = 2,
    EEHUDResultViewStyleChecked = 3,
    EEHUDResultViewStyleUpArrow = 4,
    EEHUDResultViewStyleDownArrow = 5,
    EEHUDResultViewStyleRightArrow = 6,
    EEHUDResultViewStyleLeftArrow = 7,
    EEHUDResultViewStylePlay = 8,
    EEHUDResultViewStylePause = 9,
    EEHUDResultViewStyleZero = 10,
    EEHUDResultViewStyleOne = 11,
    EEHUDResultViewStyleTwo = 12,
    EEHUDResultViewStyleThree = 13,
    EEHUDResultViewStyleFour = 14,
    EEHUDResultViewStyleFive = 15,
    EEHUDResultViewStyleSix = 16,
    EEHUDResultViewStyleSeven = 17,
    EEHUDResultViewStyleEight = 18,
    EEHUDResultViewStyleNine = 19,
    EEHUDResultViewStyleExclamation = 20,
    EEHUDResultViewStyleCloud = 21,
    EEHUDResultViewStyleCloudUp = 22,
    EEHUDResultViewStyleCloudDown = 23
} EEHUDResultViewStyle;
@interface EEHUDResultView : UIView {
    
    EEHUDResultViewStyle viewStyle_;
}

@property (nonatomic) EEHUDResultViewStyle viewStyle;
//- (id)init;
@end
