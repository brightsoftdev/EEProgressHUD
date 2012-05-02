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
    EEHUDResultViewStyleLeftArrow = 7
} EEHUDResultViewStyle;
@interface EEHUDResultView : UIView {
    
    EEHUDResultViewStyle viewStyle_;
}

@property (nonatomic) EEHUDResultViewStyle viewStyle;
//- (id)init;
@end
