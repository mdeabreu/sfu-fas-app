//
//  WebConnection.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-11-29.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//
//  Code borrowed/motified from http://www.iphonedevsdk.com/forum/iphone-sdk-development/7300-test-if-internet-connection-available.html
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <netdb.h>

@interface WebConnection : NSObject {
	
}

+(BOOL) isConnected;

@end
