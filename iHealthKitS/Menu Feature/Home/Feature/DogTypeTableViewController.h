//
//  DogTypeTableViewController.h
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DogTypeTableViewController : UITableViewController <UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) NSMutableArray *dogTypeNames;

@end

NS_ASSUME_NONNULL_END
