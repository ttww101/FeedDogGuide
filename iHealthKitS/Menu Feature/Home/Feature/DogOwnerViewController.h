//
//  DogOwnerViewController.h
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DogOwnerViewController : UIViewController <UIPopoverPresentationControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) NSMutableArray *problems;
@property (strong, nonatomic) NSMutableArray *answers;

@end

NS_ASSUME_NONNULL_END
