//
//  ViewController.m
//  MasonryTest
//
//  Created by mob on 2018/11/28.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIView *greenView;
@property(nonatomic, strong)UIView *lightGrayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView
{
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    self.greenView = greenView;
    [self.view addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view.mas_left).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-100);
        make.bottom.equalTo(self.view.mas_top).offset(300);
    }];
    UIView *lightGrayView = [[UIView alloc] init];
    lightGrayView.backgroundColor = [UIColor lightGrayColor];
     self.lightGrayView = lightGrayView;
    [self.view addSubview:lightGrayView];
   
    [lightGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);

        make.top.equalTo(greenView.mas_bottom).offset(100);
        make.left.equalTo(greenView.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(200).priority(20);
        make.left.equalTo(self.view.mas_left).offset(0).priority(20);
    }];
    
    UIView  *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.top.equalTo(lightGrayView.mas_bottom).offset(100);
        make.left.equalTo(self.view.mas_left).offset(100);
        make.top.equalTo(greenView.mas_bottom).offset(0).priority(200);
        make.top.equalTo(self.view.mas_bottom).offset(-200).priority(100);
    }];
    
    UIButton *cancelbutton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [cancelbutton setBackgroundColor:[UIColor redColor]];
    [cancelbutton addTarget:self action:@selector(cancelView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelbutton];
    
}

-(void)cancelView:(UIButton *)btn
{
    [self.lightGrayView removeFromSuperview];
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.greenView removeFromSuperview];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
