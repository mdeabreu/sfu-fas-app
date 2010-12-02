//
//  EventsList.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-10-28.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import "EventsList.h"
#import "DetailViewController.h"
#import "RSSParser.h"


@implementation EventsList


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	if ([stories count] == 0) {
		NSString * path = @"https://events.sfu.ca/rss/calendar_id/2.xml";
		
		//parsing the rss feed into an array
		RSSParser *eventsParser = [[RSSParser alloc] init];
		stories = [eventsParser parseURL:path];
		[eventTable reloadData];
		[eventsParser release];
	}
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.static NSString *CellIdentifier = @"Cell";
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    return [stories count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	cell.textLabel.text = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
	cell.detailTextLabel.text = [[stories objectAtIndex: storyIndex] objectForKey: @"date"];
    
	return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	
	//creating a detail view and push it on the stack
	DetailViewController *dv = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle: [NSBundle mainBundle]];
	dv.DDict = [[stories objectAtIndex:storyIndex] copy];
	dv.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController: dv animated: YES];
	[dv release];
	dv = nil;
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
	[eventTable release];
	[stories release];
	
    [super dealloc];
}


@end

