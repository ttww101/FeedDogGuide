//
//  ChatViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (UINavigationController *)getNav {
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    UIWindow *window = appDelegate.window;
    UIViewController *rootViewController = window.rootViewController;
    //    let resideVC = window?.rootViewController as? RESideMenu else { return }
    RESideMenu *resideVC = window.rootViewController;
    UINavigationController *nav = resideVC.contentViewController;
    return nav;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ChartViewController1 *vc = [ChartViewController1 new];
    [[self getNav] pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
    self.apiAI = [[ApiAI alloc] init];
    
    // Define API.AI configuration here.
    id <AIConfiguration> configuration = [[AIDefaultConfiguration alloc] init];
    configuration.clientAccessToken = @"b874ebb196644ffa88a395b89f8d2e16";
    [ApiAI sharedApiAI].configuration = configuration;
    
    AITextRequest *request = [[ApiAI sharedApiAI] textRequest];
    request.query = @[@"你好"];

    [request setMappedCompletionBlockSuccess:^(AIRequest *request, id response) {
        AIResponse *myResponse = response;
        NSString *responseStr = myResponse.result.fulfillment.speech;
        NSLog(@"fjahdskjfajkdsllfka:%@", responseStr);
    } failure:^(AIRequest *request, NSError *error) {
        NSLog(@"fsdkflds");
    }];
    [[ApiAI sharedApiAI] enqueue:request];
    
    
//    JSQMessagesBubbleImage *bubble1 = [[JSQMessagesBubbleImageFactory new] incomingMessagesBubbleImageWithColor:UIColor.redColor];
//    JSQMessagesBubbleImage *bubble2 = [[JSQMessagesBubbleImageFactory new] outgoingMessagesBubbleImageWithColor:UIColor.grayColor];
    
}

- (void)reloadMessagesView {
    
}


@end
