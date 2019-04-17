//
//  ChatViewController.h
//  iHealthS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ApiAI/ApiAI.h>
//#import <JSQMessagesViewController/JSQMessages.h>
#import "iHealthS-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController
@property(nonatomic, strong) ApiAI *apiAI;
@end

NS_ASSUME_NONNULL_END
