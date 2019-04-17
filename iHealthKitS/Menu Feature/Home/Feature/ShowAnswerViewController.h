//
//  ShowAnswerViewController.h
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowAnswerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (assign, nonatomic) int questionId;
@end

NS_ASSUME_NONNULL_END
