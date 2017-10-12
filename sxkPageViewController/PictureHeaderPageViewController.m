//
//  PictureHeaderPageViewController.m
//  sxkPageViewController
//
//  Created by 孙晓康 on 2017/10/12.
//  Copyright © 2017年 孙晓康. All rights reserved.
//

#import "PictureHeaderPageViewController.h"

#import "ChildrenViewController.h"
@interface PictureHeaderPageViewController ()<SXKBasePageControllerDataSource, SXKBasePageControllerDelegate>

@end

@implementation PictureHeaderPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    [self reloadScrollPage];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackBtn)];
    
}

- (void)clickBackBtn {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

#pragma mark -- BasePageViewControllerDelegate, DataSource

- (BOOL)titleViewIsNeedSilder {
    
    return YES;
}

- (NSInteger)numberViewControllersInViewPager:(BasePageViewController *)viewPager {
    
    return 8;
}

- (NSString *)viewPager:(BasePageViewController *)viewPager titleWithIndexViewControllers:(NSInteger)index {
    
    return @"";
}

- (UIViewController *)viewPager:(BasePageViewController *)viewPager indexViewControllers:(NSInteger)index {
    
    return [[ChildrenViewController alloc] init];
}

- (UIButton *)viewPager:(BasePageViewController *)viewPager titleButtonStyle:(NSInteger)index {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"airplane_cyan"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"airplane_green"] forState:UIControlStateSelected];
    
    return btn;
}

- (CGFloat)heightForTitleViewPager:(BasePageViewController *)viewPager {
    
    return 80.0;
}

- (CGFloat)titleBtnWidthWithViewPager:(BasePageViewController *)viewPager {
    
    return 100.0;
}

- (CGFloat)titleBtnPaddingWithViewPager:(BasePageViewController *)viewPager {
    
    return 20.0;
}



@end
