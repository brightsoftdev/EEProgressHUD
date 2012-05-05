//
//  EEHUDViewConstants.h
//  EEProgressHUD_sample
//
//  Created by Kudo Yoshiki on 12/02/08.
//  Copyright (c) 2012年 Milestoneeee.com. All rights reserved.
//


// HUDView (golden ratio)
#define EEHUD_VIEW_WIDTH            161.8
#define EEHUD_VIEW_HEIGHT           100.0
#define EEHUD_VIEW_BOTHENDS_MARGIN  5.0
#define EEHUD_VIEW_CORNER_RADIUS    7.0

// image
#define EEHUD_IMAGE_ORIGINY 10.0
#define EEHUD_IMAGE_WIDTH 161.8
#define EEHUD_IMAGE_HEIGHT 60.0

// label
#define EEHUD_LABEL_BOTTOM_MARGIN       5.0
#define EEHUD_LABEL_HEIGHT              20.0
#define EEHUD_LABEL_FONT                [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
#define EEHUD_LABEL_TEXTCOLOR           [UIColor whiteColor]

// color of HUDView
#define EEHUD_COLOR_HUDVIEW [UIColor colorWithWhite:0.0 alpha:0.75]
#define EEHUD_COLOR_LABEL [UIColor whiteColor]
#define EEHUD_COLOR_IMAGE [UIColor whiteColor]

// 
//#define EEHUD_DURATION_STARTWAIT    3.0

// animation (Fade)
#define EEHUD_SIZERATIO_FADEIN          0.9
#define EEHUD_SIZERATIO_FADEOUT         0.9
#define EEHUD_DURATION_FADEIN           0.25
#define EEHUD_DURATION_FADEOUT          0.25

// animation (Lutz)
#define EEHUD_SIZERATIO_LUTZIN          0.95
#define EEHUD_SIZERATIO_LUTZOUT         0.95
#define EEHUD_DURATION_LUTZIN           0.4
#define EEHUD_DURATION_LUTZOUT          0.4
#define EEHUD_COUNT_ROTATION_LUTZIN     8
#define EEHUD_COUNT_ROTATION_LUTZOUT    8
#define EEHUD_HEIGHT_JUMP_LUTZIN        30.0
#define EEHUD_HEIGHT_JUMP_LUTZOUT       30.0

// animation (Shake)
#define EEHUD_THETA_DEGREE_SHAKEIN      12.0
#define EEHUD_THETA_DEGREE_SHAKEOUT     12.0
#define EEHUD_COUNT_SHAKEIN             9           // odd
#define EEHUD_COUNT_SHAKEOUT            9           // odd
#define EEHUD_DURATION_SHAKEIN          0.3
#define EEHUD_DURATION_SHAKEOUT         0.3

// animation (Holizontal Slide)
#define EEHUD_LENGTH_FROM_LEFT          10.0
#define EEHUD_LENGTH_FROM_RIGHT         10.0
#define EEHUD_LENGTH_TO_LEFT            15.0
#define EEHUD_LENGTH_TO_RIGHT           15.0
#define EEHUD_DURATION_FROM_LEFT        0.25
#define EEHUD_DURATION_FROM_RIGHT       0.25
#define EEHUD_DURATION_TO_LEFT          0.25
#define EEHUD_DURATION_TO_RIGHT         0.25

// animation (Vertical Slide)
#define EEHUD_LENGTH_FROM_BOTTOM        12.0
#define EEHUD_LENGTH_FROM_TOP           12.0
#define EEHUD_LENGTH_TO_BOTTOM          12.0
#define EEHUD_LENGTH_TO_TOP             12.0
#define EEHUD_DURATION_FROM_BOTTOM      0.25
#define EEHUD_DURATION_FROM_TOP         0.25
#define EEHUD_DURATION_TO_BOTTOM        0.25
#define EEHUD_DURATION_TO_TOP           0.25


// animation (no anime)
#define EEHUD_DURATION_NOANIME          0.001

