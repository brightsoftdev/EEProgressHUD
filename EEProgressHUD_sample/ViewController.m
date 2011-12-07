//
//  ViewController.m
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 11/12/07.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import "ViewController.h"
#import "EEProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController
@synthesize textField;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - 
- (IBAction)show:(id)sender
{
    NSString *message = self.textField.text;
    
    [EEProgressHUD showWithMessage:message
                         showStyle:EEProgressHUDShowStyleFadeIn
                 progressViewStyle:EEProgressHUDProgressViewStyleIndicator];
}

- (IBAction)hideOK:(id)sender
{
    NSString *message = self.textField.text;
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:EEProgressHUDHideStyleFadeOut
                   resultViewStyle:EEProgressHUDResultViewStyleOK];
}

- (IBAction)hideNG:(id)sender
{
    NSString *message = self.textField.text;
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:EEProgressHUDHideStyleFadeOut
                   resultViewStyle:EEProgressHUDResultViewStyleNG];
}

- (IBAction)hideChecked:(id)sender
{
    NSString *message = self.textField.text;
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:EEProgressHUDHideStyleFadeOut
                   resultViewStyle:EEProgressHUDResultViewStyleChecked];
}

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
