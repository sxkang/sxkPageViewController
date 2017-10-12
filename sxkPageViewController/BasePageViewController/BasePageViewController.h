//
//  BasePageViewController.h
//  sxkPageViewController
//
//  Created by 孙晓康 on 2017/10/12.
//  Copyright © 2017年 孙晓康. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BasePageViewController;

#pragma mark View Pager Delegate
@protocol  SXKBasePageControllerDelegate <NSObject>
@optional
///返回当前显示的视图控制器
-(void)viewPagerViewController:(BasePageViewController *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController;
///返回当前将要滑动的视图控制器
-(void)viewPagerViewController:(BasePageViewController *)viewPager willScrollerWithCurrentViewController:(UIViewController *)ViewController;
@end

#pragma mark View Pager DataSource
@protocol SXKBasePageControllerDataSource <NSObject>
@required
-(NSInteger)numberViewControllersInViewPager:(BasePageViewController *)viewPager;
-(UIViewController *)viewPager:(BasePageViewController *)viewPager indexViewControllers:(NSInteger)index;

/// 用不到可以传@"" 下面实现返回button的方法
-(NSString *)viewPager:(BasePageViewController *)viewPager titleWithIndexViewControllers:(NSInteger)index;

/// 传入NO 为不需要滑动 传入yes可以滑动  如果传NO 先计算出button的width 以及间隔 如果button数量为三 传NO 那么btn.width = (ScreenWidth - padding*4)/3.0
- (BOOL)titleViewIsNeedSilder;
@optional

///titleBtn 的宽度 不实现默认计算
- (CGFloat)titleBtnWidthWithViewPager:(BasePageViewController *)viewPager;

///两个按钮之间的间距 设置这个上方titleViewIsNeed需要传入YES
- (CGFloat)titleBtnPaddingWithViewPager:(BasePageViewController *)viewPager;

///设置按钮距离上边界的间隔 不实现默认为0
- (CGFloat)titleBtnDistanceWithViewPager:(BasePageViewController *)viewPager;

///设置上下间隔的背景颜色 不设置默认显示scrollview的背景颜色
- (UIColor *)settingDistanceColorWithViewPager:(BasePageViewController *)viewPager;
///设置控制器标题按钮的样式,不设置为默认
-(UIButton *)viewPager:(BasePageViewController *)viewPager titleButtonStyle:(NSInteger)index;
-(CGFloat)heightForTitleViewPager:(BasePageViewController *)viewPager;

//返回点击按钮将要选中的页面下标
- (void)willSelectIndex:(NSInteger )willSelectIndex;

///预留数据源 可以在上方加在一个view 下方实现多个controller滑动
-(UIView *)headerViewForInViewPager:(BasePageViewController *)viewPager;
-(CGFloat)heightForHeaderViewPager:(BasePageViewController *)viewPager;
//返回头部按钮视图
- (void)BasepageScrollTitleViewWith:(UIScrollView *)scrollTitleView;

@end


@interface BasePageViewController : UIViewController

@property (nonatomic,weak) id<SXKBasePageControllerDataSource> dataSource;
@property (nonatomic,weak) id<SXKBasePageControllerDelegate> delegate;
///刷新
-(void)reloadScrollPage;

///默认选中
@property(nonatomic,assign) NSInteger selectIndex;

///按钮下划线的高度 字体大小 默认颜色  选中颜色
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,strong) UIFont *titleFont;
@property (nonatomic,strong) UIColor *defaultColor;
@property (nonatomic,strong) UIColor *chooseColor;
//显示标题的头部视图
@property (nonatomic,strong) UIScrollView *titleBGScroll;

// 重写这个属性,用来跳转
@property (nonatomic, assign) NSInteger jumpVcIndex;

@end

#pragma mark 标题按钮
@interface XLBasePageTitleButton : UIButton

@property (nonatomic,assign) CGFloat buttonlineWidth;


@end
