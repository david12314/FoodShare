//
//  ViewController.h
//  FoodShare
//
//  Created by David Tang on 11/15/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (id)initAsHostAddWithFood: (NSArray *)food Friends: (NSArray *)friends;
- (id)initAsHostEditWithFood: (NSArray *)food Friends: (NSArray *)friends;
- (id)initAsGuestViewWithFood: (NSArray *)food Friends: (NSArray *)friends hasRSVP: (BOOL)hasRSVP;

@end

