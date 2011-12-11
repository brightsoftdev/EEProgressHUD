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
@synthesize segIn, segOut;
@synthesize inScrollView, outScrollView;

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
    
    CGSize inSize = inScrollView.contentSize;
    inSize.width = 640.0;
    inScrollView.contentSize = inSize;
    
    CGSize outSize = outScrollView.contentSize;
    outSize.width = 640.0;
    outScrollView.contentSize = outSize;
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
    NSInteger selected = self.segIn.selectedSegmentIndex;
    
    EEProgressHUDShowStyle showStyle;
    if (selected == 0) {
        showStyle = EEProgressHUDShowStyleFadeIn;
    }else if (selected == 1) {
        showStyle = EEProgressHUDShowStyleLutz;
    }else if (selected == 2) {
        showStyle = EEProgressHUDShowStyleShake;
    }else if (selected == 3) {
        showStyle = EEProgressHUDShowStyleNoAnime;
    }else if (selected == 4) {
        showStyle = EEProgressHUDShowStyleFromRight;
    }else if (selected == 5) {
        showStyle = EEProgressHUDShowStyleFromLeft;
    }

    [EEProgressHUD showWithMessage:message
                         showStyle:showStyle
                 progressViewStyle:EEProgressHUDProgressViewStyleIndicator];
    
}

- (IBAction)hideOK:(id)sender
{
    NSString *message = self.textField.text;
    
    NSInteger selected = self.segOut.selectedSegmentIndex;
    
    EEProgressHUDHideStyle hideStyle;
    if (selected == 0) {
        hideStyle = EEProgressHUDHideStyleFadeOut;
    }else if (selected == 1){
        hideStyle = EEProgressHUDHideStyleLutz;
    }else if (selected == 2){
        hideStyle = EEProgressHUDHideStyleShake;
    }else if (selected == 3){
        hideStyle = EEProgressHUDHideStyleNoAnime;
    }else if (selected == 4){
        hideStyle = EEProgressHUDHideStyleToLeft;
    }else if (selected == 5){
        hideStyle = EEProgressHUDHideStyleToRight;
    }
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:hideStyle
                   resultViewStyle:EEProgressHUDResultViewStyleOK];
}

- (IBAction)hideNG:(id)sender
{
    NSString *message = self.textField.text;
    
    NSInteger selected = self.segOut.selectedSegmentIndex;
    
    EEProgressHUDHideStyle hideStyle;
    if (selected == 0) {
        hideStyle = EEProgressHUDHideStyleFadeOut;
    }else if (selected == 1){
        hideStyle = EEProgressHUDHideStyleLutz;
    }else if (selected == 2){
        hideStyle = EEProgressHUDHideStyleShake;
    }else if (selected == 3){
        hideStyle = EEProgressHUDHideStyleNoAnime;
    }else if (selected == 4){
        hideStyle = EEProgressHUDHideStyleToLeft;
    }else if (selected == 5){
        hideStyle = EEProgressHUDHideStyleToRight;
    }
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:hideStyle
                   resultViewStyle:EEProgressHUDResultViewStyleNG];
}

- (IBAction)hideChecked:(id)sender
{
    NSString *message = self.textField.text;
    
    NSInteger selected = self.segOut.selectedSegmentIndex;
    
    EEProgressHUDHideStyle hideStyle;
    if (selected == 0) {
        hideStyle = EEProgressHUDHideStyleFadeOut;
    }else if (selected == 1){
        hideStyle = EEProgressHUDHideStyleLutz;
    }else if (selected == 2){
        hideStyle = EEProgressHUDHideStyleShake;
    }else if (selected == 3){
        hideStyle = EEProgressHUDHideStyleNoAnime;
    }else if (selected == 4){
        hideStyle = EEProgressHUDHideStyleToLeft;
    }else if (selected == 5){
        hideStyle = EEProgressHUDHideStyleToRight;
    }
    
    [EEProgressHUD hideWithMessage:message
                         hideStyle:hideStyle
                   resultViewStyle:EEProgressHUDResultViewStyleChecked];
}

#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)aTextField
{
    [aTextField resignFirstResponder];
    
    return YES;
}

@end
