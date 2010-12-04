    //
//  SFUConnect.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//
//  Modified code for buttons
//  http://osmorphis.blogspot.com/2009/05/multiple-buttons-on-navigation-bar.html
//

#import "SFUConnect.h"


@implementation SFUConnect

@synthesize webView, overlay, activityIndicator;

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidLoad];
	
	//Creating a toolbar for our 2 buttons
	TransparentToolbar *tools = [[TransparentToolbar alloc] initWithFrame:CGRectMake(0, 0, 85, 44)];
	[tools setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
	//The array that will hold the buttons
	NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:2];
	UIBarButtonItem *bi;
	//Back button
	bi = [[UIBarButtonItem alloc] initWithTitle:@"◄" style:UIBarButtonItemStyleBordered target:webView action:@selector(goBack)];
	[buttons addObject:bi];
	[bi release];
	//Forward button
	bi = [[UIBarButtonItem alloc] initWithTitle:@"►" style:UIBarButtonItemStyleBordered target:webView action:@selector(goForward)];
	[buttons addObject:bi];
	[bi release];
	//Apply color to the buttons and the toolbar
	tools.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
	//Put the buttons in the toolbar
	[tools setItems:buttons animated:NO];
	[buttons release];
	//Put the toolbar in the navbar
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tools];
	[tools release];
	
	//Apply color to the navigation controller
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
	
	//Check if the device has an active net connection
	BOOL conTest = [WebConnection isConnected];
	
	//Ensure properly sized views after rotation
	webView.autoresizesSubviews = YES;
	webView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	
	//Preparing the offline page
	NSString *offFile= [[NSBundle mainBundle] pathForResource:@"offline" ofType:@"html"];
	NSData *offData = [NSData dataWithContentsOfFile:offFile];
	
	//Preparing the online page
	NSURL *URL = [NSURL URLWithString:@"http://connect.sfu.ca"];
	NSURLRequest *Request = [NSURLRequest requestWithURL:URL];
	
	//If connected, load the page normally otherwise load the offline page
	if (conTest) {
		[webView loadRequest:Request];
	} else {
		[webView loadData:offData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	}
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	overlay.hidden = FALSE;
	activityIndicator.hidden = FALSE;
	[activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	activityIndicator.hidden = TRUE;
	overlay.hidden = TRUE;
	[activityIndicator stopAnimating];
}

- (BOOL)webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	//In local html pages being displayed, links are opened in Mobile Safari instead of the webview
	/*
	[[UIApplication sharedApplication] openURL:[inRequest URL]];
	return NO;
	
	NSString *searchForMe = @"Howdi";
	NSRange range = [searchThisString rangeOfString : searchForMe];
	
	if (range.location != NSNotFound) {
		NSLog(@"I found something.");
	}
	if ([[[request URL] absoluteString] isEqual:@"http://arashpayan.com/myInitialPage/"])
        return YES;
    
    [[UIApplication sharedApplication] openURL:[request URL]];
    return NO;
	*/
	
	BOOL stay;
	
	NSString *url1 = @"connect.sfu.ca";
	NSString *url2 = @"cas.sfu.ca";
	NSRange range1 = [[[inRequest URL] absoluteString] rangeOfString:url1];
	NSRange range2 = [[[inRequest URL] absoluteString] rangeOfString:url2];
	
	if ((range1.location != NSNotFound) || (range2.location != NSNotFound)) {
		stay = TRUE;
		NSLog(@"%@", [[inRequest URL] absoluteString]);
		NSLog(@"Stay: %d", (int)stay);
	}
	
	return YES;
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
	[activityIndicator release];
	[overlay release];
	[webView release];
    [super dealloc];
}


@end
