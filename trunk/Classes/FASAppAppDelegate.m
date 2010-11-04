//
//  FASAppAppDelegate.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-10-26.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import "FASAppAppDelegate.h"

@implementation FASAppAppDelegate

@synthesize window, map;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	/*
	 * Bulletins
	 */
	//Loads a string containing the URL to view into an NSURL object
	NSURL *url = [NSURL URLWithString:@"http://cgi.sfu.ca/~avts/cgi-bin/imagecycler.cgi"];
	//Which is then added to the request
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	//And the request is processed, loading the page into a webview
	[bulletinsView loadRequest:request];
    
	/*
	 * Maps
	 */
	//A string containing the path of the map
	NSString *mapFile = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"gif"];
	//Load the data of the map into the application
	NSData *mapData = [NSData dataWithContentsOfFile:mapFile];
	//Put the map into the image view
	UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:mapData]];
	[self setMap:tempImageView];
	[tempImageView release];
	
	//Settings for the view including the size of the map, max/min zooms and the default zoom level
	mapsView.contentSize = CGSizeMake(map.frame.size.width, map.frame.size.height);
	mapsView.maximumZoomScale = 1.5;
	mapsView.minimumZoomScale = 0.30;
	mapsView.clipsToBounds = YES;
	mapsView.delegate = self;
    [mapsView addSubview:map];
	mapsView.zoomScale = 0.30;
	
	/*
	 * Faculty News
	 */
	
	/*
	 * Faculty Directory
	 */
	//Loads a local html file into a webview, very similar to loading a url
	NSString *facFile = [[NSBundle mainBundle] pathForResource:@"faculty" ofType:@"html"];
	NSData *facData = [NSData dataWithContentsOfFile:facFile];
	[facDirView loadData:facData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	//Needed to open links in Mobile Safari
	facDirView.delegate = self;
	
	/*
	 * Alumni Info
	 */
	
	/*
	 * Contact Info
	 */
	NSString *conFile = [[NSBundle mainBundle] pathForResource:@"contact" ofType:@"html"];
	NSData *conData = [NSData dataWithContentsOfFile:conFile];
	[contactView loadData:conData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	contactView.delegate = self;
	
	/*
	 * About FAS
	 */
	NSString *fasFile = [[NSBundle mainBundle] pathForResource:@"aboutFAS" ofType:@"html"];
	NSData *fasData = [NSData dataWithContentsOfFile:fasFile];
	[aboutFASView loadData:fasData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	aboutFASView.delegate = self;
	
	/*
	 * About Us
	 */
	NSString *aboutFile = [[NSBundle mainBundle] pathForResource:@"aboutUs" ofType:@"html"];
	NSData *aboutData = [NSData dataWithContentsOfFile:aboutFile];
	[aboutUsView loadData:aboutData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	aboutUsView.delegate = self;
	
	/*
	 * SFU Connect
	 */
	NSURL *conURL = [NSURL URLWithString:@"http://connect.sfu.ca"];
	NSURLRequest *conRequest = [NSURLRequest requestWithURL:conURL];
	[connectView loadRequest:conRequest];
	
	
    // Override point for customization after application launch.
    [window makeKeyAndVisible];
    
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	//Enables pinch to zoom in the map view
	return map;
}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	//In local html pages being displayed, links are opened in Mobile Safari instead of the webview
    [[UIApplication sharedApplication] openURL:[inRequest URL]];
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
