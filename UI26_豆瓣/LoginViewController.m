//
//  LoginViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/16.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UserDataBase.h"
#import "User.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *Key;

@property(nonatomic,retain)UIAlertController *alert;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.delegate=self;
    self.Key.delegate=self;
    // Do any additional setup after loading the view from its nib.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

- (IBAction)registerButton:(UIButton *)sender {
    RegisterViewController *registerVC=[[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
- (IBAction)loginButton:(UIButton *)sender {
    UserDataBase *dbuser=[UserDataBase shareManger];
    NSMutableArray *alluser=[dbuser alluser];
    __block BOOL RorF=NO;
    for (User *user in alluser) {
    if ([self.Key.text isEqualToString:user.key]&&[self.username.text isEqualToString:user.username]) {
        NSLog(@"登陆成功");
        NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
        [userDefault setObject:user.username forKey:@"是否登录"];
        [userDefault synchronize];
        UIAlertController *alertC=[UIAlertController alertControllerWithTitle:@"登陆成功" message:@"欢迎回来" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              RorF = YES;
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:^{
        }];
    }
    }
    if ((RorF=NO)) {
     self.alert =[UIAlertController alertControllerWithTitle:@"登录失败" message:@"账号密码不正确" preferredStyle:UIAlertControllerStyleAlert];
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(backView) userInfo:nil repeats:NO];
    [self presentViewController:self.alert animated:YES completion:nil];
    }
}
-(void)backView{
    [self.alert dismissViewControllerAnimated:YES completion:nil];
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
