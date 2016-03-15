//
//  MoveLayerViewController.m
//  CALayer动画Demo
//
//  Created by ZhangXu on 16/3/15.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "MoveLayerViewController.h"
#define LayerWidth 50
@interface MoveLayerViewController ()

@property (nonatomic ,strong)CALayer *moveCircleLayer;

@end

@implementation MoveLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moveCircleLayer = [CALayer layer];
    //指定大小
    self.moveCircleLayer.bounds = CGRectMake(0, 0, LayerWidth, LayerWidth);
    //指定中心
    self.moveCircleLayer.position = self.view.center;
    //变成圆形
    self.moveCircleLayer.cornerRadius = LayerWidth/2;
    //指定背景颜色
    self.moveCircleLayer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置阴影
    self.moveCircleLayer.shadowColor = [UIColor grayColor].CGColor;
    
    self.moveCircleLayer.shadowOffset = CGSizeMake(3, 3);
    
    self.moveCircleLayer.shadowOpacity = 0.8;
    [self.view.layer addSublayer:self.moveCircleLayer];

    
    // Do any additional setup after loading the view.
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGFloat width = LayerWidth;
    
    if (self.moveCircleLayer.bounds.size.width <=LayerWidth) {
        width = LayerWidth *3;
    }
    
    //修改大小
    
    self.moveCircleLayer.bounds = CGRectMake(0, 0, width, width);
    //中心位置放置到点击位置
    
    self.moveCircleLayer.position = [[touches anyObject]locationInView:self.view];
    
    //再修改圆形
    self.moveCircleLayer.cornerRadius = width /2;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
