//
//  CABasicAnimationController.m
//  CALayer动画Demo
//
//  Created by ZhangXu on 16/3/14.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "CABasicAnimationController.h"

@implementation CABasicAnimationController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self baseTranslationAnimation];
    [self baseRotationAnimation];
    [self baseScaleAnimation];
    [self blinkAnimation];
    [self baseAnimation];
    
}
//平移动画
-(void)baseTranslationAnimation{
    UIView *springView =[[UIView alloc]initWithFrame:CGRectMake(0, 300, 50, 50)];
    UIView *springView1 =[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 300, 50, 50)];
    [self.view addSubview:springView];
    [self.view addSubview:springView1];
    springView.layer.cornerRadius = 25 ;
    springView.layer.borderColor = [UIColor redColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor cyanColor];
    
    springView1.layer.cornerRadius = 25 ;
    springView1.layer.borderColor = [UIColor orangeColor].CGColor;
    springView1.layer.borderWidth = 2;
    springView1.backgroundColor = [UIColor greenColor];
//    springView.layer.masksToBounds = YES;
    
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.duration = 2;
    
    //Z轴旋转180°
    CGFloat width = self.view.frame.size.width;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(width-50, 0)];
    // 指定动画重复多少圈是累加的
    animation.cumulative = YES;
    // 动画完成是不自动很危险
    animation.removedOnCompletion = NO;
     // 设置移动的效果为快入快出
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    // 设置无限循环动画
    animation.repeatCount = HUGE_VALF;
     // 设置动画完成时，自动以动画回到原点
    animation.autoreverses = YES;
    // 设置动画完成时，返回到原点
    animation.fillMode = kCAFillModeForwards;
    
    
    CABasicAnimation *animation1  = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    //transform.translation.y垂直移动
    animation1.duration = 2;
    //Z轴旋转180°
    CGFloat width1 = self.view.frame.size.width;
    animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(50-width1, 0)];
    // 指定动画重复多少圈是累加的
    animation1.cumulative = YES;
    // 动画完成是不自动很危险
    animation1.removedOnCompletion = NO;
    // 设置移动的效果为快入快出
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    // 设置无限循环动画
    animation1.repeatCount = HUGE_VALF;
    // 设置动画完成时，自动以动画回到原点
    animation1.autoreverses = YES;
    // 设置动画完成时，返回到原点
    animation1.fillMode = kCAFillModeForwards;
    
    [springView.layer addAnimation:animation forKey:@"transform.translation"];
    [springView1.layer addAnimation:animation1 forKey:@"transform.translation"];
    
    
}
// 旋转动画
- (void)baseRotationAnimation{
     UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-25, 240, 50, 50)];
    [self.view addSubview:view];
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.borderWidth = 2;
//    view.layer.cornerRadius =25;
    view.backgroundColor = [UIColor blueColor];
    
    CABasicAnimation *anmition = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    anmition.duration = 2;
    
    //Z轴旋转180度
//    CATransform3D transform3D = CATransform3DMakeRotation(M_PI, 0, 1,0);//翻转
    CATransform3D transform3D = CATransform3DMakeRotation(M_PI, 0, 0,1);
    anmition.toValue = [NSValue valueWithCATransform3D:transform3D];
    anmition.cumulative = YES;
    anmition.removedOnCompletion = NO;
    anmition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anmition.repeatCount = HUGE_VALF;
    anmition.autoreverses = YES;
    anmition.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:anmition forKey:@"transform"];
 
}

//缩放动画
-(void)baseScaleAnimation{
    
    UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_2592" ofType:@"JPG"]]];
    imageView.frame = CGRectMake(self.view.frame.size.width/2-40, 140, 80, 80);
    [self.view addSubview:imageView];
    
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.layer.borderWidth = 2;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 2;
    animation.fromValue = @(2);
    animation.toValue =@(0.5);
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode= kCAFillModeForwards;
    [imageView.layer addAnimation:animation forKey:@"transform.scale"];
    
}

//闪烁动画
-(void)blinkAnimation{
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"22"]];
    
    imageView.frame = CGRectMake(self.view.frame.size.width/2-30,50, 70, 70);
    imageView.layer.borderColor = [UIColor greenColor].CGColor;
    imageView.layer.borderWidth = 2;
    [self.view addSubview:imageView];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration =2 ;
    animation.removedOnCompletion = NO;
    animation.fromValue =@(1);
    animation.toValue = @(0.1);
    animation.timingFunction  = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.repeatDuration =HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:animation forKey:@"opacity"];

}

//路径动画
-(void)baseAnimation{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zw"]];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:imageView];
    imageView.layer.borderWidth = 2;
    imageView.layer.borderColor = [UIColor cyanColor].CGColor;
    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
     // 起点，这个值是指position，也就是layer的中心值
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    // 终点，这个值是指position，也就是layer的中心值
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(arc4random()%500, arc4random()%200)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 100)];
    
    // byValue与toValue的区别：byValue是指x方向再移动到指定的宽然后y方向移动指定的高
    // 而toValue是整体移动到指定的点
//      animation.byValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width - 50 - 50,
//                                                                self.view.bounds.size.height - 50 - 50 - 50)];
    
    // 线性动画
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.removedOnCompletion = NO;
    
    // 设定开始值到结束值花费的时间，也就是动画时长，单位为秒
    animation.duration = 2;
    // 播放速率，默认为1，表示常速
    // 设置为2则以2倍的速度播放，同样设置为N则以N倍速度播放
    // 如果值小于1，自然就是慢放
    animation.speed = 0.5;
      // 开始播放动画的时间，默认为0.0，通常是在组合动画中使用
    
    animation.beginTime = 0.0;
    
    // 播放动画的次数，默认为0，表示只播放一次
    // 设置为3表示播放3次
    // 设置为HUGE_VALF表示无限动画次数
    animation.repeatCount = HUGE_VALF;
    
    // 默认为NO，设置为YES后，在动画达到toValue点时，就会以动画由toValue返回到fromValue点。
    // 如果不设置或设置为NO，在动画到达toValue时，就会突然马上返回到fromValue点
    animation.autoreverses = YES;
    
    
    // 当autoreverses设置为NO时，最终会留在toValue处
    animation.fillMode = kCAFillModeForwards;
    // 将动画添加到层中
    [imageView.layer addAnimation:animation forKey:@"position"];
    
    
}






@end
