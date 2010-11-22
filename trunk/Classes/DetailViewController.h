//
//  DetailViewController.h
//  CMPT275_v1
//
//  Created by Samuel To on 10-11-16.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {

	IBOutlet UILabel *DTitle;
	
	IBOutlet UILabel *DDate;
	
	IBOutlet UITextView *DSummary;
	
	NSMutableDictionary *DDict;
}

@property (nonatomic, retain) NSMutableDictionary *DDict;

@end
