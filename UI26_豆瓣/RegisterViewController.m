//
//  RegisterViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/16.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserDataBase.h"
#import "User.h"
#import "LoginViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *Key;
@property (strong, nonatomic) IBOutlet UITextField *KeyAgain;
@property (strong, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *mail;



@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.delegate=self;
    self.Key.delegate=self;
    self.KeyAgain.delegate=self;
    self.PhoneNumber.delegate=self;
    self.mail.delegate=self;
    
    // Do any additional setup after loading the view from its nib.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)addButton:(UIButton *)sender {
    //如果密码和确认密码一样 就让注册
    if ([self.Key.text isEqualToString:self.KeyAgain.text]) {
        
        //实力单例
        UserDataBase *dbuser=[UserDataBase shareManger];
        //防止用户名重复
        NSMutableArray *alluser=[dbuser alluser];
        for (User *user in alluser) {
            if ([self.username.text isEqualToString:user.username]) {
                NSLog(@"用户名已存在");
                return;
            }
        }
        [dbuser createTable];
        User *user=[[User alloc]initWithusername:self.username.text key:self.Key.text phonenum:self.PhoneNumber.text Email:self.mail.text];
        [dbuser insertUser:user];
        NSLog(@"注册成功");
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"注册成功" message:@"欢迎加入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"前去登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
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
