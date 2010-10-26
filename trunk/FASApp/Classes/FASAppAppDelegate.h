//
//  FASAppAppDelegate.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-10-26.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FASAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

