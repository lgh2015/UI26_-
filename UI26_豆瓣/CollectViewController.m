//
//  CollectViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/16.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "CollectViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityModel.h"

@interface CollectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *modelarr;

@property(nonatomic,retain)ActivityModel *acmodel;
@end

@implementation CollectViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"我的收藏";
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.modelarr=[[NSMutableArray alloc]init];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (cell==nil) {
        cell=[[ActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    cell.model=self.modelarr[indexPath.row];
    cell.allView.activity2.imageView.image=cell.model.picture;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==self.modelarr.count-1) {
        return 280;
    }
    return  180;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelarr.count;
}


-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *str=[userDefault objectForKey:@"是否登录"];
    for (int i=0; i<21; i++) {
        NSString *arrfilePath =[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@modelarr%d.da",str,i]];
        NSData *data=[[NSData alloc]initWithContentsOfFile:arrfilePath];
        if (data!=nil) {
            NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
            self.acmodel=[unarchiver decodeObjectForKey:@"ac"];
            [self.modelarr addObject:self.acmodel];
        }
        else{
            continue;
        }
    }
}
#pragma mark--删除相关的方法
//1.进入编辑状态
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

//2.指定哪些能被编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}
//3.设置编辑状态
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
//4.提交编辑

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSFileManager *fileManger=[NSFileManager defaultManager];
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *str=[userDefault objectForKey:@"是否登录"];
//    for (int i=0; i<21; i++) {
    NSLog(@"%@",str);
        NSString *arrfilePath =[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@modelarr%ld.da",str,indexPath.row]];
    NSLog(@"%@",arrfilePath);
    BOOL exis=[[NSFileManager defaultManager]fileExistsAtPath:arrfilePath];
    NSLog(@"%d",exis);
    BOOL delete=[fileManger removeItemAtPath:arrfilePath error:NULL];
    if (delete) {
        NSLog(@"%d",delete);
    }
//        NSData *data=[[NSData alloc]initWithContentsOfFile:arrfilePath];
//        if (data!=nil) {
//            NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
//            self.acmodel=[unarchiver decodeObjectForKey:@"ac"];
//            [self.modelarr addObject:self.acmodel];
//        }
//        else{
//            continue;
//        }
//    }

    //先删除数据源,再删除UI
//    NSMutableArray *stuArr=[self.stuDic objectForKey:self.fisrtCharArr[indexPath.section]];
    [self.modelarr removeObjectAtIndex:indexPath.row];
    //刷新UI
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    if (self.modelarr.count==0) {
//        
//        //删除对应的键值对数组
//        [self.stuDic removeObjectForKey:self.fisrtCharArr[indexPath.section]];
//        //删除首字母
//        [self.fisrtCharArr removeObjectAtIndex:indexPath.section];
//        //删除UI
//        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
//    }
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
