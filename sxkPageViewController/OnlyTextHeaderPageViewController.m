//
//  OnlyTextHeaderPageViewController.m
//  sxkPageViewController
//
//  Created by 孙晓康 on 2017/10/12.
//  Copyright © 2017年 孙晓康. All rights reserved.
//

#import "OnlyTextHeaderPageViewController.h"

#import "ChildrenViewController.h"
@interface OnlyTextHeaderPageViewController ()<SXKBasePageControllerDelegate, SXKBasePageControllerDataSource>

@end

@implementation OnlyTextHeaderPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.dataSource = self;
    self.lineWidth = 40.0;
    self.chooseColor = [UIColor blueColor];
    
    [self reloadScrollPage];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackBtn)];
    
}


- (void)clickBackBtn {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}


#pragma mark--BasepageViewControllerDelegate DateSource

- (BOOL)titleViewIsNeedSilder {
    
    return  YES;
}

- (NSInteger)numberViewControllersInViewPager:(BasePageViewController *)viewPager {
    
    return 6;
    
}

- (UIViewController *)viewPager:(BasePageViewController *)viewPager indexViewControllers:(NSInteger)index {
    
    return [[ChildrenViewController alloc] init];
}

- (NSString *)viewPager:(BasePageViewController *)viewPager titleWithIndexViewControllers:(NSInteger)index {
    
    return @"测试";
}

- (CGFloat)titleBtnWidthWithViewPager:(BasePageViewController *)viewPager {
    
    return 60.0;
}


///两个按钮之间的间距 设置这个上方titleViewIsNeed需要传入YES
- (CGFloat)titleBtnPaddingWithViewPager:(BasePageViewController *)viewPager {
    
    return 20.0;
}

///设置按钮距离上边界的间隔 不实现默认为0
- (CGFloat)titleBtnDistanceWithViewPager:(BasePageViewController *)viewPager {
    
    return 10.0;
}

- (CGFloat)heightForTitleViewPager:(BasePageViewController *)viewPager {
    
    return 60.0;
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
