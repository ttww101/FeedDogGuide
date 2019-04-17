//
//  DogTypeTableViewCell.m
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "DogTypeTableViewCell.h"

@implementation DogTypeTableViewCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        self.backgroundColor = UIColor.clearColor;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat width = screenRect.size.width;
        CGFloat height = 200;
        CGFloat imageSize = 150;
        CGFloat spacing = 10;
        CGFloat y = (height - imageSize) / 2.0 - 10;
        CGFloat leftMargin = (width-imageSize*2-spacing)/2.0;
        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin, y, imageSize, imageSize)];
//        self.imageView1.backgroundColor = UIColor.yellowColor;
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin + imageSize + 10, y, imageSize, imageSize)];
//        self.imageView2.backgroundColor = UIColor.redColor;
        [self addSubview:self.imageView1];
        [self addSubview:self.imageView2];
        
        // button
        self.btn1 = [UIButton new];
        self.btn2 = [UIButton new];
        UIButton *btn1 = _btn1;
        btn1.frame = self.imageView1.frame;
//        [btn1 addTarget:self action:@selector(clickImg1) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        UIButton *btn2 = _btn2;
        btn2.frame = self.imageView2.frame;
//        [btn2 addTarget:self action:@selector(clickImg1) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn2];

        // corner
        self.imageView1.clipsToBounds = YES;
        self.imageView1.layer.cornerRadius = imageSize/2;
        self.imageView2.clipsToBounds = YES;
        self.imageView2.layer.cornerRadius = imageSize/2;
        
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"Loading...";
        [self.label1 sizeToFit];
        self.label1.center = CGPointMake(_imageView1.center.x, 182);
        [self addSubview:self.label1];
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"Loading...";
        [self.label2 sizeToFit];
        self.label2.center = CGPointMake(_imageView2.center.x, 182);
        [self addSubview:self.label2];
        
    }
    return self;
}

- (void)clickImg1 {
    NSLog(@"hahaha");
    
}

- (void)clickImg2 {
    NSLog(@"hahaha");
}

- (void)fitSize {
    [self.label1 sizeToFit];
    self.label1.center = CGPointMake(_imageView1.center.x, 182);
    [self.label2 sizeToFit];
    self.label2.center = CGPointMake(_imageView2.center.x, 182);
}

//- (void)setImage1:(UIImage*)image1 AndImage2:(UIImage*)image2 {
//
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
