//
//  FASAppAppDelegate.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-10-26.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import "FASAppAppDelegate.h"

@implementation FASAppAppDelegate

@synthesize window, map, tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
	[self restoreTabOrder];
	
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
	
	[window addSubview:tabBarController.view];
	
    // Override point for customization after application launch.
    [window makeKeyAndVisible];
    
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	//Enables pinch to zoom in the map view
	return map;
}

- (void)saveTabOrder {
	NSMutableArray *savedOrder = [NSMutableArray arrayWithCapacity:[tabBarController.viewControllers count]];
	NSArray *tabOrderToSave = tabBarController.viewControllers;
	
	for (UIViewController *aViewController in tabOrderToSave) {
		[savedOrder addObject:aViewController.tabBarItem.title];
	}
	
	[[NSUserDefaults standardUserDefaults] setObject:savedOrder forKey:@"savedTabOrder"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSLog(@"Tabs Saved!");
}

- (void)restoreTabOrder {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *savedOrder = [defaults arrayForKey:@"savedTabOrder"];
	NSMutableArray *orderedTabs = [NSMutableArray arrayWithCapacity:[tabBarController.viewControllers count]];
	if ([savedOrder count] > 0 ) {
		for (int i = 0; i < [savedOrder count]; i++){
			for (UIViewController *aController in tabBarController.viewControllers) {
				if ([aController.tabBarItem.title isEqualToString:[savedOrder objectAtIndex:i]]) {
					[orderedTabs addObject:aController];
				}
			}
		}
		tabBarController.viewControllers = orderedTabs;
	}
	NSLog(@"Tabs Restored!");
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
	[self saveTabOrder];
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
	[self saveTabOrder];
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
	[map release];
	[tabBarController release];
    [super dealloc];
}


@end