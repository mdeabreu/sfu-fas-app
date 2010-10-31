//
//  FASAppAppDelegate.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-10-26.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FASAppAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate> {
    UIWindow *window;
	
	//Bulletins
	IBOutlet UIWebView *bulletinsView;
	
	//Maps
	IBOutlet UIScrollView *mapsView;
	UIImageView *map;
	
	//Faculty News
	IBOutlet UIWebView *facNewsView;
	
	//Faculty Directory
	IBOutlet UIWebView *facDirView;
	
	//Alumni Information
	IBOutlet UIWebView *alumInfoView;
	
	//Contact Info
	IBOutlet UIWebView *contactView;
	
	//About FAS
	IBOutlet UIWebView *aboutFASView;
	
	//About Us
	IBOutlet UIWebView *aboutUsView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UIImageView *map;

@end
