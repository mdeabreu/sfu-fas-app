//
//  Maps.h
//  FASApp
//
//  Created by Matthew DeAbreu on 10-12-02.
//  Copyright 2010 Homebaked Computer Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Maps : UIViewController<UIScrollViewDelegate> {
	IBOutlet UIScrollView *mapsView;
	UIImageView *map;
}

@property (nonatomic, retain) IBOutlet UIScrollView *mapsView;
@property (nonatomic, retain) UIImageView *map;

@end
