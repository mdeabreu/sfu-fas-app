//
//  Bulletins.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebConnection.h"


@interface Bulletins : UIViewController {
	IBOutlet UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
