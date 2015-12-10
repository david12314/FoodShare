//
//  EventView.h
//  	
//
//  Created by David Tang on 12/5/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventView : UIView
- (id)initAsHostAdd: (UITableViewController *)tableViewController Friends: (UITableViewController *)friendsTableViewController VC: (UIViewController *)VC;

- (id)initAsHostEdit: (UITableViewController *)tableViewController Friends: (UITableViewController *) friendsTableViewController VC: (UIViewController *)VC;

- (id)initAsGuestView: (UITableViewController *)tableViewController Friends: (UITableViewController *)friendsTableViewController VC: (UIViewController *)VC hasRSVP: (BOOL)hasRSVP;

@property UITableViewController *foodTableViewController;
@property UITableViewController *friendsTableViewController;

@end
