    //
//  Bulletins.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import "Bulletins.h"


@implementation Bulletins

@synthesize webView;

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidLoad];
	
	BOOL conTest = [WebConnection isConnected];
	
	webView.autoresizesSubviews = YES;
	webView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
	NSString *offFile= [[NSBundle mainBundle] pathForResource:@"offline" ofType:@"html"];
	NSData *offData = [NSData dataWithContentsOfFile:offFile];
	
	NSURL *URL = [NSURL URLWithString:@"http://cgi.sfu.ca/~avts/cgi-bin/imagecycler.cgi"];
	NSURLRequest *Request = [NSURLRequest requestWithURL:URL];
	
	if (conTest) {
		[webView loadRequest:Request];
	} else {
		[webView loadData:offData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	}
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
    [super dealloc];
}


@end
