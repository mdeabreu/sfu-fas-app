//
//  Bulletins.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebConnection.h"
#import "TransparentToolbar.h"

@class TransparentToolbar;

@interface Bulletins : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
	IBOutlet UIView *overlay;
	IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIView *overlay;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
