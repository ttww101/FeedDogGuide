//
//  DogTypeTableViewCell.h
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DogTypeTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;

- (void)fitSize;

@end

NS_ASSUME_NONNULL_END
