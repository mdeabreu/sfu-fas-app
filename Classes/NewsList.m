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


@implementation NewsList

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    newsTable.rowHeight = 60;
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
	
	if ([stories count] == 0) {
		NSString * path = @"http://www.sfu.ca/sfunews/News_Releases/rss/index.xml";
		
		//parsing the rss feed into an array
		RSSParser *eventsParser = [[RSSParser alloc] init];
		stories = [eventsParser parseURL:path];
		[newsTable reloadData];
		[newsTable release];
		[RSSParser release];
	}
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

