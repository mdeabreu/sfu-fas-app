    //
//  DetailViewController.m
//  CMPT275_v1
//
//  Created by Samuel To on 10-11-16.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

@synthesize DDict;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *navTitle = [[NSString alloc] initWithFormat:@"Event Details"];
	self.navigationItem.title = navTitle;
	
	DTitle.text = [DDict objectForKey:@"title"];
	DDate.text = [DDict objectForKey:@"date"];
	DSummary.text = [DDict objectForKey:@"summary"];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[DTitle release];
	[DDate release];
	[DSummary release];
	[DDict release];
	
    [super dealloc];
}


@end
