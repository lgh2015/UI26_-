//
//  CinemaViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaTableViewCell.h"
#import "CinemaModel.h"
#import "MovieViewController.h"
#import "NetworkTool.h"

#define CINEMA_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate,NetworkToolDelegate>

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *cinemaArr;

@end

@implementation CinemaViewController


-(void)networkResult:(id)result{
    NSMutableArray *arr=[[result objectForKey:@"result"] objectForKey:@"data"];
    for (NSMutableDictionary *dic in arr) {
        CinemaModel *model =[[CinemaModel alloc]initWithDictionary:dic];
        [self.cinemaArr addObject:model];
    }
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cinemaArr=[NSMutableArray array];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
//    [self tableView];
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor=[UIColor whiteColor];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor=[UIColor whiteColor];

    NetworkTool *networktool=[[NetworkTool alloc]initWithURL:CINEMA_URL delegate:self];
    [networktool startTask];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cinemaArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cinema"];
    if (cell==nil) {
        cell=[[CinemaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cinema"];
    }
    cell.model=self.cinemaArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.cinemaArr.count-1) {
        return 250;
    }
    return 135;
}
//取消点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
