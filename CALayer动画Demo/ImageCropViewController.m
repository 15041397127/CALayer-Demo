//
//  ImageCropViewController.m
//  CALayer动画Demo
//
//  Created by ZhangXu on 16/3/15.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ImageCropViewController.h"
#define PhotoWidth 100
@interface ImageCropViewController ()

@end

@implementation ImageCropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawImage];
}


-(void)drawImageWithContent{
    
    CALayer *layer = [CALayer  layer];
    
    layer.bounds = CGRectMake(0, 0, PhotoWidth, PhotoWidth);
    layer.position = self.view.center;
    layer.cornerRadius = PhotoWidth /2;
    layer.masksToBounds = YES;
    layer.borderWidth = 1;
    layer.borderColor  = [UIColor cyanColor].CGColor;
    
    // 如果只是显示图片，不做其它处理，直接设置contents就可以了，也就不会出现
    // 绘图和图像倒立的问题了
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"zw"].CGImage);
    
    [self.view.layer addSublayer:layer];
   
}

-(void)drawImage{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, PhotoWidth, PhotoWidth);
    layer.position = self.view.center;
    layer.cornerRadius = PhotoWidth/2;
    layer.masksToBounds = YES;
    layer.borderColor= [UIColor cyanColor].CGColor;
    layer.borderWidth = 1;
    
    //  // 阴影
    //  layer.shadowColor = [UIColor blueColor].CGColor;
    //  layer.shadowOffset = CGSizeMake(4, 4);
    //  layer.shadowOpacity = 0.9;
    
    //指定代理
    layer.delegate = self;
    
    //添加到父图层上
    [self.view.layer addSublayer:layer];
    
    // 当设置masksToBounds为YES后，要想要阴影效果，就需要额外添加一个图层作为阴影图层了
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.position = layer.position;
    shadowLayer.bounds =layer.bounds;
    shadowLayer.cornerRadius = layer.cornerRadius;
    shadowLayer.shadowOpacity = 1.0;
    shadowLayer.shadowColor= [UIColor redColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(2, 1);
    shadowLayer.borderWidth = layer.borderWidth;
    shadowLayer.borderColor = [UIColor cyanColor].CGColor;
    [self.view.layer insertSublayer:shadowLayer below:layer];
    
    
    [layer setNeedsDisplay];
}

#pragma mark CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    //将当前上文入栈
    
    CGContextSaveGState(ctx);
    
    // 注意：坐标系统与UIView的不同，这里使用的是笛卡尔积坐标系，也就是左下角为(0,0)
    // 所以，我们只要记住这点就可以很容易地变换了。
    
    // 处理图片倒立的问题
    // 默认呈现是倒立的，因此需要将形变矩阵的sy设置为-1就成了正立的了
    // 先缩放后平移也可以
    
//     CGContextScaleCTM(ctx, 1, -1);
//     CGContextTranslateCTM(ctx, 0, -PhotoWidth);
    
    // 先向平移后旋转也可以解决倒立的问题
    
    CGContextTranslateCTM(ctx, PhotoWidth, PhotoWidth);
    CGContextRotateCTM(ctx, M_PI/180 *180);
    
    UIImage *image = [UIImage imageNamed:@"zw"];
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, PhotoWidth, PhotoWidth), image.CGImage);
    
    //任务完成后,将当前上下文退栈
    
    CGContextRestoreGState(ctx);
    
    
    
    
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
