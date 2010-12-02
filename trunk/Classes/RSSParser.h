//
//  RSSParser.h
//  CMPT275_v1
//
//  Created by Samuel To on 10-11-18.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//
//  modified code adapted from <http://gigaom.com/apple/tutorial-build-a-simple-rss-reader-for-iphone/>
//

#import <Foundation/Foundation.h>


@interface RSSParser : NSObject {
	
	
@private
	UIActivityIndicatorView * activityIndicator;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	NSMutableDictionary * item;
	
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
	//NSCalendar *gregorian;
}

- (RSSParser *) init;

- (NSMutableArray *) parseURL: (NSString *) URL;

@end
