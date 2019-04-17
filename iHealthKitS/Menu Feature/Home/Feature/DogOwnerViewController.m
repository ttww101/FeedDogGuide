//
//  DogOwnerViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "DogOwnerViewController.h"
#import "ShowAnswerViewController.h"
#import "AFNetworking.h"
#import "iHealthS-Swift.h"


@interface DogOwnerViewController ()
@property (nonatomic, assign) int problemNum;

@end

@implementation DogOwnerViewController

- (UINavigationController *)getNav {
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    UIWindow *window = appDelegate.window;
    UIViewController *rootViewController = window.rootViewController;
    //    let resideVC = window?.rootViewController as? RESideMenu else { return }
    RESideMenu *resideVC = window.rootViewController;
    UINavigationController *nav = resideVC.contentViewController;
    return nav;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

- (IBAction)clickTest:(id)sender {
    UIViewController *popVC = [UIViewController new];
    popVC.modalPresentationStyle = UIModalPresentationPopover;
    popVC.popoverPresentationController.delegate = self;
    popVC.popoverPresentationController.sourceView = self.view;
    popVC.popoverPresentationController.sourceRect = CGRectZero;
    [self presentViewController:popVC animated:YES completion:nil];
}

// IBAction
- (IBAction)clickShowAnswer:(UIButton *)sender {
    ShowAnswerViewController *showAnswerVC = [ShowAnswerViewController new];
    showAnswerVC.questionId = self.problemNum + 1;
//    [self presentViewController:showAnswerVC animated:showAnswerVC completion:nil];
    [[self getNav] pushViewController:showAnswerVC animated:YES];
    
}

- (IBAction)clickNextPage:(id)sender {
    if (self.problemNum < [self.problems count]-1) {
        self.problemNum++;
        self.questionLabel.text = self.problems[self.problemNum];
    }
}

- (IBAction)clickPreviousPage:(id)sender {
    if (self.problemNum > 0) {
        self.problemNum--;
        self.questionLabel.text = self.problems[self.problemNum];
    }
}

// life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.problemNum = 0;
    self.problems = [NSMutableArray new];
    
    
    {
        NSURLSession *session = [NSURLSession sharedSession];
        NSURL *url = [NSURL URLWithString:@"http://47.75.131.189/a860d318d1f1b8cbb47eb7df29446f9f/?type=problem"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error == nil) {
                NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                NSArray *myData = jsonObject[@"data"];
                NSInteger count = [myData count];
                for (int i=0; i<count; ++i) {
                    NSString *problem = myData[i][@"problem"];
                    [self.problems addObject:problem];
                }
                [self performSelectorOnMainThread:@selector(updateLabel:) withObject:_problems[0] waitUntilDone:YES];
            }
        }];
        [task resume];
    }
    
    
    
}

- (void)updateLabel:(NSString*)text {
    _questionLabel.text = text;
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
