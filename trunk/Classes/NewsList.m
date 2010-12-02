//
//  NewsList.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-10-27.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import "NewsList.h"
#import "WebViewController.h"
#import "RSSParser.h"
#import "FeedOption.h"


@implementation NewsList

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    newsTable.rowHeight = 60;
	
	UIBarButtonItem *feedButton = [[UIBarButtonItem alloc] initWithTitle:@"Feeds" style:UIBarButtonItemStyleBordered target:self action:@selector(feedOptions:)];
	self.navigationItem.rightBarButtonItem = feedButton;
	[feedButton release];
	
	feeds = [[NSMutableArray alloc] init];
	NSMutableDictionary *feedAtrb = [[NSMutableDictionary alloc] init];
	[feedAtrb setObject:[NSNumber numberWithBool:YES] forKey:@"toParse"];
	[feedAtrb setObject:@"http://www.sfu.ca/sfunews/News_Releases/rss/index.xml" forKey:@"link"];
	[feedAtrb setObject:@"SFU News" forKey:@"title"];
	[feeds addObject:[feedAtrb copy]];
	
	//Apply color to the navigation controller
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
	
	[feedAtrb release];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	if ([stories count] == 0) {
		stories = [[NSMutableArray alloc] init];
		RSSParser *newsParser = [[RSSParser alloc] init];
		
		for (int i = 0; i < [feeds count]; i++) {
			NSString *link = [[feeds objectAtIndex:i] objectForKey:@"link"];
			[stories addObjectsFromArray:[newsParser parseURL:link]];
		}
		
		[newsTable reloadData];
		[newsParser release];
	}
}

- (void)feedOptions:(UIBarButtonItem *)myButton {
	FeedOption *optionView = [[FeedOption alloc] initWithNibName:@"FeedOption" bundle:[NSBundle mainBundle]];
	optionView.feedList = feeds;
	[self.navigationController pushViewController:optionView animated:YES];
	[optionView release];
	optionView = nil;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [stories count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	cell.textLabel.text = [[stories objectAtIndex: storyIndex] objectForKey:@"title"];
	cell.textLabel.numberOfLines = 2;
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	
	NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@"/sfunews/" withString:@"/sfunews/print/"];
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@"shtml" withString:@"html"];
	
	NSLog(@"link: %@", storyLink);
	
	WebViewController *wv = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]];
	wv.urlAddress = [storyLink copy];
	wv.navTitle = [[NSString alloc] initWithFormat:@"News Detail"];
	wv.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController: wv animated: YES];
	[wv release];
	wv = nil;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[newsTable release];
	[stories release];
	
    [super dealloc];
}


@end

