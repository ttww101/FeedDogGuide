//
//  TypeDetailViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "TypeDetailViewController.h"

@interface TypeDetailViewController ()


@end

@implementation TypeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label = [UILabel new];
    _label.text = @"Loading...";
    _label.frame = CGRectMake(10, 0, 280, 300);
    _label.numberOfLines = 12;
//    [_label alig]
    [self.view addSubview:_label];
    {
        NSURLSession *session = [NSURLSession sharedSession];
        NSString *urlString = [NSString stringWithFormat:@"http://47.75.131.189/a860d318d1f1b8cbb47eb7df29446f9f/?type=introduction&id=%zd", self.dogId + 1];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSDictionary *myData = jsonObject[@"data"];
            NSString *introduction = myData[@"introduction"];
            NSLog(introduction);
            [self performSelectorOnMainThread:@selector(updateLabel:) withObject:introduction waitUntilDone:YES];
        }];
        [task resume];
    }
}

- (void)updateLabel:(NSString*)text {
    _label.text = text;
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

@interface UILabel (VerticalAlign)
- (void)alignTop;
- (void)alignBottom;
@end
// -- file: UILabel+VerticalAlign.m
@implementation UILabel (VerticalAlign)
- (void)alignTop {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [self.text stringByAppendingString:@"\n "];
}
- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}
@end
