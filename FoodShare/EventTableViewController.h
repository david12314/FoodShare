//
//  EventTableViewController.h
//  	
//
//  Created by David Tang on 12/5/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewController : UITableViewController
- (id)initWithData: (NSMutableArray *)data;
- (id)initWithEdit: (NSMutableArray *)data;
@end
