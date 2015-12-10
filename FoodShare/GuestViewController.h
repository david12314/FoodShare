//
//  GuestViewController.h
//  Guest
//
//  Created by Jimmy on 12/10/15.
//  Copyright © 2015 FoodShare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentedControlToggle;
@property (weak, nonatomic) IBOutlet UIView *MapViewContainer;
@property (weak, nonatomic) IBOutlet UIView *TableViewContainer;

@end
