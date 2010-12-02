//
//  FASAppAppDelegate.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-10-26.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebConnection.h"

@interface FASAppAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate, UIWebViewDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
}

- (void)saveTabOrder;
- (void)restoreTabOrder;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

