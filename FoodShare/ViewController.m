//
//  ViewController.m
//  FoodShare
//
//  Created by David Tang on 11/15/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "ViewController.h"
#import "DefaultView.h"

@interface ViewController ()

@end

@implementation ViewController{
    DefaultView *_defaultView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    _defaultView = [DefaultView new];
    self.view = _defaultView;
}

@end
