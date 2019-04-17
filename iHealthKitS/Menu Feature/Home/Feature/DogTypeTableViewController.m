//
//  DogTypeTableViewController.m
//  iHealthS
//
//  Created by Apple on 2019/4/9.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

#import "DogTypeTableViewController.h"
#import "DogTypeTableViewCell.h"
#import "TypeDetailViewController.h"

@interface DogTypeTableViewController ()

@property (assign, nonatomic) NSInteger dogId;

@end

@implementation DogTypeTableViewController
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:DogTypeTableViewCell.class forCellReuseIdentifier:@"dogTypeCell"];
    
    self.tableView.backgroundColor = UIColor.clearColor;
    
    
    {
        NSURLSession *session = [NSURLSession sharedSession];
        NSURL *url = [NSURL URLWithString:@"http://47.75.131.189/a860d318d1f1b8cbb47eb7df29446f9f/?type=puppy"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error ==nil) {
                _dogTypeNames = [NSMutableArray new];
                NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                NSArray *myData = jsonObject[@"data"];
                NSInteger count = [myData count];
                for (int i=0; i<count; ++i) {
                    NSString *problem = myData[i][@"name"];
                    [self.dogTypeNames addObject:problem];
                }
                [self.tableView reloadData];
            }
            
        }];
        [task resume];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DogTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dogTypeCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    NSString *imageName1 = [NSString stringWithFormat:@"dog_2016x2688_p%02zd", row*2+1];
    NSString *imageName2 = [NSString stringWithFormat:@"dog_2016x2688_p%02zd", row*2+2];
    cell.imageView1.image = [UIImage imageNamed:imageName1];
    cell.imageView2.image = [UIImage imageNamed:imageName2];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_dogTypeNames != nil) {
        NSString *dogName1 = _dogTypeNames[row*2];
        NSString *dogName2 = _dogTypeNames[row*2+1];
        cell.label1.text = dogName1;
        cell.label2.text = dogName2;
        cell.btn1.tag = row*2;
        cell.btn2.tag = row*2+1;
        [cell.btn1 addTarget:self action:@selector(clickImage:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn2 addTarget:self action:@selector(clickImage:) forControlEvents:UIControlEventTouchUpInside];

        [cell fitSize];
    }
    return cell;
}

- (void)clickImage:(UIButton*)sender {
    TypeDetailViewController *popVC = [TypeDetailViewController new];
    popVC.dogId = sender.tag;
    popVC.preferredContentSize = CGSizeMake(300, 300);
    DogTypeTableViewCell *cell = [sender superview];
    
    popVC.modalPresentationStyle = UIModalPresentationPopover;
    popVC.popoverPresentationController.delegate = self;
    popVC.popoverPresentationController.sourceView = sender;
    popVC.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(sender.bounds), CGRectGetMidY(sender.bounds), 0, 0);
    [self presentViewController:popVC animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
