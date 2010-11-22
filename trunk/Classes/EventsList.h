//
//  EventsList.h
//  CMPT275_v1
//
//  Created by Samuel To on 10-10-28.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventsList : UITableViewController {
	
	IBOutlet UITableView * eventTable;
	
	NSXMLParser * rssParser;
	
	NSMutableArray *stories;
}

@end
