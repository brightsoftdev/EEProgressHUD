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
                       showTime:10.5];
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
                case 9:
                    title = @"0";
                    break;
                case 10:
                    title = @"1";
                    break;
                case 11:
                    title = @"2";
                    break;
                case 12:
                    title = @"3";
                    break;
                case 13:
                    title = @"4";
                    break;
                case 14:
                    title = @"5";
                    break;
                case 15:
                    title = @"6";
                    break;
                case 16:
                    title = @"7";
                    break;
                case 17:
                    title = @"8";
                    break;
                case 18:
                    title = @"9";
                    break;
                case 19:
                    title = @"!";
                    break;
                case 20:
                    title = @"Cloud";
                    break;
                case 21:
                    title = @"CloudUP";
                    break;
                case 22:
                    title = @"CloudDOWN";
                    break;
                case 23:
                    title = @"Mail";
                    break;
                case 24:
                    title = @"Microphone";
                    break;
                case 25:
                    title = @"Location";
                    break;
                case 26:
                    title = @"Home";
                    break;
                case 27:
                    title = @"Tweet";
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
                case 9:
                    self.resultStyle = EEHUDResultViewStyleZero;
                    break;
                case 10:
                    self.resultStyle = EEHUDResultViewStyleOne;
                    break;
                case 11:
                    self.resultStyle = EEHUDResultViewStyleTwo;
                    break;
                case 12:
                    self.resultStyle = EEHUDResultViewStyleThree;
                    break;
                case 13:
                    self.resultStyle = EEHUDResultViewStyleFour;
                    break;
                case 14:
                    self.resultStyle = EEHUDResultViewStyleFive;
                    break;
                case 15:
                    self.resultStyle = EEHUDResultViewStyleSix;
                    break;
                case 16:
                    self.resultStyle = EEHUDResultViewStyleSeven;
                    break;
                case 17:
                    self.resultStyle = EEHUDResultViewStyleEight;
                    break;
                case 18:
                    self.resultStyle = EEHUDResultViewStyleNine;
                    break;
                case 19:
                    self.resultStyle = EEHUDResultViewStyleExclamation;
                    break;
                case 20:
                    self.resultStyle = EEHUDResultViewStyleCloud;
                    break;
                case 21:
                    self.resultStyle = EEHUDResultViewStyleCloudUp;
                    break;
                case 22:
                    self.resultStyle = EEHUDResultViewStyleCloudDown;
                    break;
                case 23:
                    self.resultStyle = EEHUDResultViewStyleMail;
                    break;
                case 24:
                    self.resultStyle = EEHUDResultViewStyleMicrophone;
                    break;
                case 25:
                    self.resultStyle = EEHUDResultViewStyleLocation;
                    break;
                case 26:
                    self.resultStyle = EEHUDResultViewStyleHome;
                    break;
                case 27:
                    self.resultStyle = EEHUDResultViewStyleTweet;
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
            count = 28;
            break;
        default:
            break;
    }
    return count;
}

@end
