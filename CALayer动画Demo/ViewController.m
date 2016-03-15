//
//  ViewController.m
//  CALayer动画Demo
//
//  Created by ZhangXu on 16/3/14.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ViewController.h"
#import "CABasicAnimationController.h"
#import "MoveLayerViewController.h"
#import "ImageCropViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)UITableViewCell *cell;
@property (nonatomic ,strong)NSArray *dataSoure;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    
    self.title = @"CALayer动画";
    self.dataSoure = @[[[CABasicAnimationController alloc]initWithTile:@"CABasicAnimation动画学习"],[[MoveLayerViewController alloc]initWithTile:@"移动圆形图层"],[[ImageCropViewController alloc]initWithTile:@"图片剪切"],];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        [_tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }

    return _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIViewController *contoller = self.dataSoure[indexPath.row];
    
    self.cell.textLabel.text =contoller.title;
    
    
    return self.cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataSoure.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller = self.dataSoure [indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
