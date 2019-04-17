//
//  ShowAnswerViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "ShowAnswerViewController.h"

@interface ShowAnswerViewController ()

@end

@implementation ShowAnswerViewController
- (IBAction)clickBack:(UIButton *)sender {
    [[self getNav] popViewControllerAnimated:YES];
}

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
    NSLog(@"show answer enter");
    {
        NSURLSession *session = [NSURLSession sharedSession];
        NSString *urlString = [NSString stringWithFormat:@"http://47.75.131.189/a860d318d1f1b8cbb47eb7df29446f9f/?type=answer&id=%zd", self.questionId];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
                NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                NSDictionary *myData = jsonObject[@"data"];
                NSString *answer = myData[@"answer"];
                [self performSelectorOnMainThread:@selector(updateLabel:) withObject:answer waitUntilDone:YES];
            }
            

            
        }];
        [task resume];
    }
}

- (void)updateLabel:(NSString*)text {
    _answerLabel.text = text;
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
