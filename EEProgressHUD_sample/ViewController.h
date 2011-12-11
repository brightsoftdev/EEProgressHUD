//
//  ViewController.h
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 11/12/07.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segIn, *segOut;
@property (nonatomic, strong) IBOutlet UIScrollView *inScrollView, *outScrollView;

- (IBAction)show:(id)sender;
- (IBAction)hideOK:(id)sender;
- (IBAction)hideNG:(id)sender;
- (IBAction)hideChecked:(id)sender;
@end
