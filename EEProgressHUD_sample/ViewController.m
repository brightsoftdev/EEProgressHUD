//
//  ViewController.m
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 11/12/07.
//  Copyright (c) 2011年 Milestoneeee.com. All rights reserved.
//

#import "ViewController.h"
#import "EEHUDView.h"

#pragma mark - Private Interface
@interface ViewController(){
    
    
}
@property (nonatomic) EEHUDViewShowStyle showStyle;
@property (nonatomic) EEHUDViewHideStyle hideStyle;
@property (nonatomic) EEHUDResultViewStyle resultStyle;
@end

#pragma mark - Implementation
@implementation ViewController
@synthesize textField;
@synthesize showStyle = _showStyle, hideStyle = _hideStyle, resultStyle = _resultStyle;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.showStyle = EEHUDViewShowStyleFadeIn;
    self.hideStyle = EEHUDViewHideStyleFadeOut;
    self.resultStyle = EEHUDResultViewStyleOK;
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

- (IBAction)start:(id)sender
{
    /****************
     You need only below method to use [EEHUDView].
     *****************/
    [EEHUDView growlWithMessage:self.textField.text
                      showStyle:self.showStyle
                      hideStyle:self.hideStyle
                resultViewStyle:self.resultStyle
                       showTime:10.0];
}

- (IBAction)done:(id)sender
{
    [self.textField resignFirstResponder];
}

#pragma mark - Picker Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    switch (component) {
        case 0:
            // show
            
            switch (row) {
                case 0:
                    title = @"Fadein";
                    break;
                case 1:
                    title = @"Lutz";
                    break;
                case 2:
                    title = @"Shake";
                    break;
                case 3:
                    title = @"No";
                    break;
                case 4:
                    title = @"Right";
                    break;
                case 5:
                    title = @"Left";
                    break;
                case 6:
                    title = @"Top";
                    break;
                case 7:
                    title = @"Bottom";
                    break;
                default:
                    break;
            }
            break;
        case 1:
            // hide
            
            switch (row) {
                case 0:
                    title = @"Fadeout";
                    break;
                case 1:
                    title = @"Lutz";
                    break;
                case 2:
                    title = @"Shake";
                    break;
                case 3:
                    title = @"No";
                    break;
                case 4:
                    title = @"Left";
                    break;
                case 5:
                    title = @"Right";
                    break;
                case 6:
                    title = @"Bottom";
                    break;
                case 7:
                    title = @"Top";
                    break;
                default:
                    break;
            }
            
            break;
            
        case 2:
            
            switch (row) {
                case 0:
                    title = @"OK";
                    break;
                case 1:
                    title = @"NG";
                    break;
                case 2:
                    title = @"Checked";
                    break;
                case 3:
                    title = @"Up↑";
                    break;
                case 4:
                    title = @"Down↓";
                    break;
                case 5:
                    title = @"Right→";
                    break;
                case 6:
                    title = @"Left←";
                    break;
                case 7:
                    title = @"Play";
                    break;
                case 8:
                    title = @"Pause";
                    break;
                default:
                    break;
            }
            
            break;
        default:
            break;
    }
    
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            switch (row) {
                case 0:
                    self.showStyle = EEHUDViewShowStyleFadeIn;
                    break;
                case 1:
                    self.showStyle = EEHUDViewShowStyleLutz;
                    break;
                case 2:
                    self.showStyle = EEHUDViewShowStyleShake;
                    break;
                case 3:
                    self.showStyle = EEHUDViewShowStyleNoAnime;
                    break;
                case 4:
                    self.showStyle = EEHUDViewShowStyleFromRight;
                    break;
                case 5:
                    self.showStyle = EEHUDViewShowStyleFromLeft;
                    break;
                case 6:
                    self.showStyle = EEHUDViewShowStyleFromTop;
                    break;
                case 7:
                    self.showStyle = EEHUDViewShowStyleFromBottom;
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (row) {
                case 0:
                    self.hideStyle = EEHUDViewHideStyleFadeOut;
                    break;
                case 1:
                    self.hideStyle = EEHUDViewHideStyleLutz;
                    break;
                case 2:
                    self.hideStyle = EEHUDViewHideStyleShake;
                    break;
                case 3:
                    self.hideStyle = EEHUDViewHideStyleNoAnime;
                    break;
                case 4:
                    self.hideStyle = EEHUDViewHideStyleToLeft;
                    break;
                case 5:
                    self.hideStyle = EEHUDViewHideStyleToRight;
                    break;
                case 6:
                    self.hideStyle = EEHUDViewHideStyleToBottom;
                    break;
                case 7:
                    self.hideStyle = EEHUDViewHideStyleToTop;
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (row) {
                case 0:
                    self.resultStyle = EEHUDResultViewStyleOK;
                    break;
                case 1:
                    self.resultStyle = EEHUDResultViewStyleNG;
                    break;
                case 2:
                    self.resultStyle = EEHUDResultViewStyleChecked;
                    break;
                case 3:
                    self.resultStyle = EEHUDResultViewStyleUpArrow;
                    break;
                case 4:
                    self.resultStyle = EEHUDResultViewStyleDownArrow;
                    break;
                case 5:
                    self.resultStyle = EEHUDResultViewStyleRightArrow;
                    break;
                case 6:
                    self.resultStyle = EEHUDResultViewStyleLeftArrow;
                    break;
                case 7:
                    self.resultStyle = EEHUDResultViewStylePlay;
                    break;
                case 8:
                    self.resultStyle = EEHUDResultViewStylePause;
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

#pragma mark - Picker DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int count = 0;
    switch (component) {
        case 0:
            count = 8;
            break;
        case 1:
            count = 8;
            break;
        case 2:
            count = 9;
            break;
        default:
            break;
    }
    return count;
}

@end
