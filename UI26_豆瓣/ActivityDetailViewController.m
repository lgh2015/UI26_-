//
//  ActivityDetailViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/15.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "imageDownload.h"


@interface ActivityDetailViewController ()

@property(nonatomic,retain)NSMutableDictionary *modeldic;

@property(nonatomic,retain)UIAlertController *alert;
@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.modeldic=[[NSMutableDictionary alloc]init];
    self.acnameLabel.text = self.ACmodel.title;
    self.timeLabel.text=self.ACmodel.begin_time;
    [imageDownload downloadimageWithURL:self.ACmodel.image completionHandler:^(UIImage *image) {
        self.imageV.image=image;
    }];
    self.acaddressLabel.text=[NSString stringWithFormat:@"地址: %@",self.ACmodel.address];
    self.accategorynameLabel.text=[NSString stringWithFormat:@"类型: %@",self.ACmodel.category_name];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAciton:)];
    
}
-(void)rightBarButtonAciton:(UIBarButtonItem *)button{
//    NSMutableArray *modelarr=[[NSMutableArray alloc]init];
    //创建一个可变的data数据
    NSMutableData *data =[[NSMutableData alloc]init];
    //创建一个归档对象
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //归档
    [archiver encodeObject:self.ACmodel forKey:@"ac"];
    //结束归档
    [archiver finishEncoding];
    
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *str=[userDefault objectForKey:@"是否登录"];
    if (str==nil) {
        NSLog(@"请先登录");
    }
    else{
    //将ACmodel对象转成data存入本地
    NSString *ACModel=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@modelarr%ld.da",str,self.count]];
    [data writeToFile:ACModel atomically:YES];
     self.alert=[UIAlertController alertControllerWithTitle:@"收藏成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:self.alert animated:YES completion:^{
        [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(backView) userInfo:nil repeats:YES];
    }];
    }
}

-(void)backView{
    [self.alert  dismissViewControllerAnimated:YES completion:nil];
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
