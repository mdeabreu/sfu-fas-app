    //
//  Maps.m
//  FASApp
//
//  Created by Matthew DeAbreu on 10-12-02.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import "Maps.h"


@implementation Maps

@synthesize map, mapsView;

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidLoad];
	
	//A string containing the path of the map
	NSString *mapFile = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"gif"];
	//Load the data of the map into the application
	NSData *mapData = [NSData dataWithContentsOfFile:mapFile];
	//Put the map into the image view
	UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:mapData]];
	[self setMap:tempImageView];
	[tempImageView release];
	
	//Settings for the view including the size of the map, max/min zooms and the default zoom level
	mapsView.contentSize = CGSizeMake(map.frame.size.width, map.frame.size.height);
	mapsView.maximumZoomScale = 1.5;
	mapsView.minimumZoomScale = 0.30;
	mapsView.clipsToBounds = YES;
	mapsView.delegate = self;
    [mapsView addSubview:map];
	mapsView.zoomScale = 0.30;
	
	//Apply color to the navigation controller
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.710 green:0.067 blue:0.102 alpha:1.00];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	//Enables pinch to zoom in the map view
	return map;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}


@end
