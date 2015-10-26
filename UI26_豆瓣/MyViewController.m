//
//  MyViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/16.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "CollectViewController.h"
#import "User.h"
#import "UserDataBase.h"
#import "SDImageCache.h"


@interface MyViewController ()

@end

@implementation MyViewController

- (IBAction)clearcachesButton:(UIButton *)sender {
    NSLog(@"%@",NSHomeDirectory());
    NSUInteger size=[[SDImageCache sharedImageCache]getSize];
    NSLog(@"%lu",size);
    [[SDImageCache sharedImageCache]clearDisk];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"我的";
}
//跳去登陆
- (IBAction)loginbutton:(UIButton *)sender
{
    LoginViewController *loginVC=[[LoginViewController   alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
//注销
- (IBAction)logoutButton:(UIButton *)sender {
    
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setObject:nil forKey:@"是否登陆"];
    [userDefault synchronize];
}
//我的收藏
- (IBAction)myActivityButton:(UIButton *)sender
{
    NSUserDefaults *userDefault =[NSUserDefaults standardUserDefaults];
    if ([userDefault objectForKey:@"是否登录"]!=nil) {
    CollectViewController *collectVC=[[CollectViewController alloc]init];
    [self.navigationController pushViewController:collectVC animated:YES];
    }
    else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"请先登陆" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"马上去登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            LoginViewController *loginVC=[[LoginViewController   alloc]init];
            [self.navigationController pushViewController:loginVC animated:YES];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
