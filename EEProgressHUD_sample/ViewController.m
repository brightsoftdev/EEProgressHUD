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
    
    BOOL is_;
    int count;
    int index;
}
@end

#pragma mark - Implementation
@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    is_ = NO;
    count = 0;
    index = 0;
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

// tableView 必要メソッド とりあえず一式
#pragma mark - TableView DataSource Method
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	NSString *title;
    int row = indexPath.row;
    
    switch (row) {
        case 0:
            title = @"Fade";
            break;
        case 1:
            title = @"Lutz";
            break;
        case 2:
            title = @"Shake";
            break;
        case 3:
            title = @"NoAnime";
            break;
        case 4:
            title = @"Right";
            break;
        case 5:
            title = @"Left";
        default:
            break;
    }
    
    cell.textLabel.text = title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"cellIdentifier";
	
	UITableViewCell	*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	// セル表示
	[self configureCell:cell atIndexPath:indexPath];
	
	return cell;
}

#pragma mark - TableView Delegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
	int row = indexPath.row;
    
    EEHUDViewShowStyle showStyle;
    EEHUDViewHideStyle hideStyle;
    
    switch (row) {
        case 0:
            showStyle = EEHUDViewShowStyleFadeIn;
            hideStyle = EEHUDViewHideStyleFadeOut;
            break;
        case 1:
            showStyle = EEHUDViewShowStyleLutz;
            hideStyle = EEHUDViewHideStyleLutz;
            break;
        case 2:
            showStyle = EEHUDViewShowStyleShake;
            hideStyle = EEHUDViewHideStyleShake;
            break;
        case 3:
            showStyle = EEHUDViewShowStyleNoAnime;
            hideStyle = EEHUDViewHideStyleNoAnime;
            break;
        case 4:
            showStyle = EEHUDViewShowStyleFromRight;
            hideStyle = EEHUDViewHideStyleToRight;
            break;
        case 5:
            showStyle = EEHUDViewShowStyleFromLeft;
            hideStyle = EEHUDViewHideStyleToLeft;
        default:
            break;
    }
    
    EEHUDResultViewStyle resultViewStyle;
    switch (index%7) {
        case 0:
            resultViewStyle = EEHUDResultViewStyleOK;
            break;
        case 1:
            resultViewStyle = EEHUDResultViewStyleNG;
            break;
        case 2:
            resultViewStyle = EEHUDResultViewStyleChecked;
            break;
        case 3:
            resultViewStyle = EEHUDResultViewStyleUpArrow;
            break;
        case 4:
            resultViewStyle = EEHUDResultViewStyleDownArrow;
            break;
        case 5:
            resultViewStyle = EEHUDResultViewStyleRightArrow;
            break;
        case 6:
            resultViewStyle = EEHUDResultViewStyleLeftArrow;
            break;
        default:
            resultViewStyle = EEHUDResultViewStyleOK;
            break;
    }
    
//    if (is_) {
//        [EEHUDView hideWithMessage:@"OK"
//                         hideStyle:hideStyle
//                   resultViewStyle:EEProgressHUDResultViewStyleOK];
//    }else {
//        [EEHUDView showWithMessage:@"Downloading..."
//                         showStyle:showStyle
//                 progressViewStyle:EEProgressHUDProgressViewStyleIndicator];
//    }
    
    NSString *countString = [NSString stringWithFormat:@"%d", count];
    [EEHUDView growlWithMessage:countString
                      showStyle:showStyle
                      hideStyle:hideStyle
                resultViewStyle:resultViewStyle
                       showTime:3.0];
    
    is_ = !is_;
    
    // countUP
    count++;
    index++;
}


@end
