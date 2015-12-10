//
//  HomeTableViewCell.h
//  	
//
//  Created by Hu Wenxuan on 12/10/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Foodname;
@property (weak, nonatomic) IBOutlet UILabel *Payment;
@property (weak, nonatomic) IBOutlet UILabel *Location;
@property (weak, nonatomic) IBOutlet UILabel *Date;
@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UIView *Capacity;
@property (weak, nonatomic) IBOutlet UILabel *Distance;
@property (weak, nonatomic) IBOutlet UILabel *Progress;

//set properties in controller file

@end
