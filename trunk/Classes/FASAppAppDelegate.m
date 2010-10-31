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
	NSURL *url = [NSURL URLWithString:@"http://cgi.sfu.ca/~avts/cgi-bin/imagecycler.cgi"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[bulletinsView loadRequest:request];
    
	/*
	 * Maps
	 */
	NSString *mapFile = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"gif"];
	NSData *mapData = [NSData dataWithContentsOfFile:mapFile];
	UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:mapData]];
	[self setMap:tempImageView];
	[tempImageView release];
	
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
	
	/*
	 * Alumni Info
	 */
	
	/*
	 * Contact Info
	 */
	NSString *conFile = [[NSBundle mainBundle] pathForResource:@"contact" ofType:@"html"];
	NSData *conData = [NSData dataWithContentsOfFile:conFile];
	[contactView loadData:conData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	
	/*
	 * About FAS
	 */
	NSString *fasFile = [[NSBundle mainBundle] pathForResource:@"aboutFAS" ofType:@"html"];
	NSData *fasData = [NSData dataWithContentsOfFile:fasFile];
	[aboutFASView loadData:fasData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	
	/*
	 * About Us
	 */
	NSString *aboutFile = [[NSBundle mainBundle] pathForResource:@"aboutUs" ofType:@"html"];
	NSData *aboutData = [NSData dataWithContentsOfFile:aboutFile];
	[aboutUsView loadData:aboutData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@""]];
	
	
    // Override point for customization after application launch.
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return map;
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
