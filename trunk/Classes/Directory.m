//
//  Directory.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-12-03.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import "Directory.h"
#import "WebViewController.h"


@implementation Directory


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];

    CSListing = [[NSMutableArray alloc] init];
	ESListing = [[NSMutableArray alloc] init];
	
	NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
	NSURL *tempURL;
	[tempDict setObject:@"Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CSProfessors" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[CSListing addObject:[tempDict copy]];
	[tempDict setObject:@"Assistant Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CSAssistantProf" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[CSListing addObject:[tempDict copy]];
	[tempDict setObject:@"Associate Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CSAssociateProf" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[CSListing addObject:[tempDict copy]];
	[tempDict setObject:@"Lecturers" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CSLecturers" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[CSListing addObject:[tempDict copy]];
	[tempDict setObject:@"Senior Lectureres" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CSSeniorLecturers" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[CSListing addObject:[tempDict copy]];
	
	[tempDict setObject:@"Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ESProfessors" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[ESListing addObject:[tempDict copy]];
	[tempDict setObject:@"Assistant Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ESAssistantProf" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[ESListing addObject:[tempDict copy]];
	[tempDict setObject:@"Associate Professors" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ESAssociateProf" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[ESListing addObject:[tempDict copy]];
	[tempDict setObject:@"Lecturers" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ESLecturers" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[ESListing addObject:[tempDict copy]];
	[tempDict setObject:@"Senior Lectureres" forKey:@"title"];
	tempURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ESSeniorLecturers" ofType:@"html"]];
	[tempDict setObject:[tempURL absoluteString] forKey:@"link"];
	[ESListing addObject:[tempDict copy]];
	
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
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	int r = 0;
	if (section == 0) {
		r = [CSListing count];
	} else {
		r = [ESListing count];
	}

    return r;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *sectionTitle;
	if (section == 0) {
		sectionTitle = [[NSString alloc] initWithFormat:@"Computer Science"];
	} else {
		sectionTitle = [[NSString alloc] initWithFormat:@"Engineering Science"];
	}
	
	return sectionTitle;
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
	NSMutableArray *listing;
	if (indexPath.section == 0) {
		listing = CSListing;
	} else {
		listing = ESListing;
	}
	
    cell.textLabel.text = [[listing objectAtIndex:index] objectForKey:@"title"];
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = [indexPath indexAtPosition: [indexPath length] - 1];
	NSMutableArray *listing;
	if (indexPath.section == 0) {
		listing = CSListing;
	} else {
		listing = ESListing;
	}
	
	WebViewController *wv = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]];
	wv.urlAddress = [[listing objectAtIndex:index] objectForKey:@"link"];
	wv.navTitle = [[listing objectAtIndex:index] objectForKey:@"title"];
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
	[CSListing dealloc];
	[ESListing dealloc];
	
    [super dealloc];
}


@end

