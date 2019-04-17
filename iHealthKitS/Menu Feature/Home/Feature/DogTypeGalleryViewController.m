//
//  DogTypeGalleryViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "DogTypeGalleryViewController.h"
#import "DogTypeTableViewController.h"

@interface DogTypeGalleryViewController ()

@end

@implementation DogTypeGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = self.view.frame.size;
    DogTypeTableViewController *tableVC = [DogTypeTableViewController new];
    [self addChildViewController:tableVC];//添加到父控制器中
    tableVC.view.frame = CGRectMake(0, 100, size.width, size.height-100);
    [self.view addSubview:tableVC.view];//把子控制器的 view 添加到父控制器的 view 上面
    [tableVC didMoveToParentViewController:self];
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
