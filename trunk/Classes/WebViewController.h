//
//  WebViewController.h
//  CMPT275_v1
//
//  Created by Samuel To on 10-11-17.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {

	IBOutlet UIWebView *webView;
	
	NSString *urlAddress, *navTitle;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString *urlAddress;
@property (nonatomic, retain) NSString *navTitle;

@end
