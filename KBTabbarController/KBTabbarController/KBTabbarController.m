//
//  KBTabbarController.m
//  KBTabbarController
//
//  Created by kangbing on 16/5/31.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBTabbarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "KBTabbar.h"

@interface KBTabbarController ()

@end

@implementation KBTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    OneViewController *hvc = [[OneViewController alloc] init];
    [self addChildController:hvc title:@"首页" imageName:@"tab1-heartshow" selectedImageName:@"tab1-heart" navVc:[UINavigationController class]];
    
    TwoViewController *fvc = [[TwoViewController alloc] init];
    [self addChildController:fvc title:@"活动" imageName:@"tab2-doctor" selectedImageName:@"tab2-doctorshow" navVc:[UINavigationController class]];
    
    ThreeViewController *MoreVc = [[ThreeViewController alloc] init];
    [self addChildController:MoreVc title:@"更多" imageName:@"tab4-more" selectedImageName:@"tab4-moreshow" navVc:[UINavigationController class]];
    
    FourViewController *svc = [[FourViewController alloc] init];
    [self addChildController:svc title:@"设置" imageName:@"tab5-file" selectedImageName:@"tab5-fileshow" navVc:[UINavigationController class]];
    
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
    [self setCustomtabbar];
    
    
    
}

- (void)setCustomtabbar{

    KBTabbar *tabbar = [[KBTabbar alloc]init];
    
    [self setValue:tabbar forKeyPath:@"tabBar"];

    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];


}

- (void)centerBtnClick:(UIButton *)btn{

    
    NSLog(@"点击了中间");
    
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }forState:UIControlStateSelected];
    
    UINavigationController* nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
