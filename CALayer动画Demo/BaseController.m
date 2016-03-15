//
//  BaseController.m
//  CALayer动画Demo
//
//  Created by ZhangXu on 16/3/14.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "BaseController.h"

@implementation BaseController
- (instancetype)initWithTile:(NSString *)title{
    
    if (self = [super init]) {
        self.title =title;
    }
    return self;
    
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
@end
