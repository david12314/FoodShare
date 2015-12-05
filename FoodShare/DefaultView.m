//
//  DefaultView.m
//  	
//
//  Created by David Tang on 12/5/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "DefaultView.h"

@implementation DefaultView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
