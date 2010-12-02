    //
//  AboutFAS.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import "AboutFAS.h"


@implementation AboutFAS

@synthesize webView;

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidLoad];
	
	//Ensure properly sized views after rotation
	webView.autoresizesSubviews = YES;
	webView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
	//Preparing the page
	NSString *File = [[NSBundle mainBundle] pathForResource:@"aboutFAS" ofType:@"html"];
	NSData *Data = [NSData dataWithContentsOfFile:File];
	
	//Loading the page
	[webView loadData:Data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	
	//Apply color to the navigation controller
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
	
	webView.delegate = self;
}

- (BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	//In local html pages being displayed, links are opened in Mobile Safari instead of the webview
	[[UIApplication sharedApplication] openURL:[inRequest URL]];
	return NO;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[webView release];
    [super dealloc];
}


@end
