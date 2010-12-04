//
//  SocialMedia.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-12-02.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import "SocialMedia.h"
#import "WebViewController.h"


@implementation SocialMedia


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	links = [[NSMutableArray alloc] init];
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];

    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
	[tempDict setObject:@"SFU Main Twitter" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/SFU" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU News" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/sfunews" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU Library" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/sfu_library" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU IT" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/sfu_it" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU Alumni" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/SFUalumni" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"WIL" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/wil_fraser" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU Bookstore" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/sfubookstores" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"SFU Central" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/SFUcentral" forKey:@"link"];
	[links addObject:[tempDict copy]];
	[tempDict setObject:@"CS Pop Machine" forKey:@"title"];
	[tempDict setObject:@"http://mobile.twitter.com/sfudrink" forKey:@"link"];
	[links addObject:[tempDict copy]];
	
	[tempDict release];
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [links count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	int index = [indexPath indexAtPosition: [indexPath length] - 1];
	cell.textLabel.text = [[links objectAtIndex: index] objectForKey: @"title"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	int index = [indexPath indexAtPosition: [indexPath length] - 1];
    
	WebViewController *wv = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]];
	wv.urlAddress = [[links objectAtIndex:index] objectForKey:@"link"];
	wv.navTitle = [[NSString alloc] initWithFormat:[[links objectAtIndex:index] objectForKey:@"title"]];
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
    [super dealloc];
}


@end

