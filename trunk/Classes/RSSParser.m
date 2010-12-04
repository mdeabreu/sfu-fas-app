//
//  RSSParser.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-11-18.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//
//  modified code adapted from <http://gigaom.com/apple/tutorial-build-a-simple-rss-reader-for-iphone/>
//

#import "RSSParser.h"


@implementation RSSParser

- (id) init {
	self = [super init];
	//gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	
	return self;
}

- (NSMutableArray *) parseURL:(NSString *)URL {
	[self parseXMLFileAtURL: URL];
	return [stories copy];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");
	
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
	//initializing xml parser
    NSURL *xmlURL = [NSURL URLWithString:URL];
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [rssParser setDelegate:self];
	
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
	//parsing the RSS file from the website
    [rssParser parse];
	
}

//error handling
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array
		
		[currentTitle replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentTitle length])];
		
		[currentLink replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentLink length])];
		[currentLink replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentLink length])];
		[currentLink replaceOccurrencesOfString:@"	" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentLink length])];
		
		[currentSummary replaceOccurrencesOfString:@"<br />" withString:@"\n" options:NSLiteralSearch range:NSMakeRange(0, [currentSummary length])];
		int substring_start = 0;
		BOOL find_substring_end = FALSE;
		for (int i = 0; i < [currentSummary length]; i++) {
			if (([currentSummary characterAtIndex:i] == '<') && !find_substring_end) {
				substring_start = i;
				find_substring_end = TRUE;
			}
			
			if (find_substring_end && ([currentSummary characterAtIndex:i] == '>')) {
				[currentSummary deleteCharactersInRange: NSMakeRange(substring_start, i - substring_start + 1)];
				i = substring_start - 1;
				find_substring_end = FALSE;
			}
		}
		
		[currentDate replaceOccurrencesOfString:@"-0800" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentDate length])];
		[currentDate replaceOccurrencesOfString:@"-0700" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentDate length])];
		
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
}
//end of modified code

/*
- (void)dealloc {
	[activityIndicator dealloc];
	[rssParser dealloc];
	[stories dealloc];
	[item dealloc];
	[currentElement dealloc];
	[currentTitle dealloc];
	[currentDate dealloc];
	[currentSummary dealloc];
	[currentLink dealloc];
	//[gregorian dealloc];
	
	[super dealloc];
}*/

@end
