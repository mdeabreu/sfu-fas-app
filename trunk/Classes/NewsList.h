//
//  NewsList.h
//  CMPT275_v1
//
//  Created by Samuel To on 10-10-27.
//  Copyright 2010 Simon Fraser University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewsList : UITableViewController {
	
	IBOutlet UITableView *newsTable;
	
	NSMutableArray *stories, *feeds;
}

@end
