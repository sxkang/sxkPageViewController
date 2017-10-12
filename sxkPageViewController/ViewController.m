//
//  ViewController.m
//  sxkPageViewController
//
//  Created by 孙晓康 on 2017/10/12.
//  Copyright © 2017年 孙晓康. All rights reserved.
//

#import "ViewController.h"

#import "OnlyTextHeaderPageViewController.h"
#import "PictureHeaderPageViewController.h"

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addHeaderToView];
    
    [self addJumpBtnToView];
}

- (void)addHeaderToView {
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.text = @"SXKPageViewControllerDemo";
    headerLabel.font = [UIFont systemFontOfSize:16];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:headerLabel];
    [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@64);
    }];
}


- (void)addJumpBtnToView {
    
    UIButton *onlyTextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [onlyTextBtn setTitle:@"只有文字" forState:UIControlStateNormal];
    [onlyTextBtn setBackgroundColor:[UIColor purpleColor]];
    [onlyTextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [onlyTextBtn addTarget:self action:@selector(clickOnlyTextBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:onlyTextBtn];
    [onlyTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.view.mas_top).offset(200);
        make.height.equalTo(@60);
    }];
    
    UIButton *pictureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pictureBtn setTitle:@"图片" forState:UIControlStateNormal];
    [pictureBtn setBackgroundColor:[UIColor purpleColor]];
    [pictureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pictureBtn addTarget:self action:@selector(clickPictureBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pictureBtn];
    [pictureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(onlyTextBtn.mas_bottom).offset(20);
        make.height.equalTo(@60);
    }];

}

- (void)clickOnlyTextBtn:(UIButton *)btn {
    
    OnlyTextHeaderPageViewController *vc = [[OnlyTextHeaderPageViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navi animated:YES completion:^{}];
}

- (void)clickPictureBtn:(UIButton *)btn {
    
    PictureHeaderPageViewController *vc = [[PictureHeaderPageViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navi animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
