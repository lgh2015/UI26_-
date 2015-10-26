//
//  ActivityViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityModel.h"
#import "NetworkTool.h"
#import "ActivityDetailViewController.h"


#define ACTIVITY_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"

@interface ActivityViewController ()<UITableViewDelegate,UITableViewDataSource,NetworkToolDelegate>

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *activityArr;
@property(nonatomic,retain)NSMutableArray *collectArr;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    // Do any additional setup after loading the view.
    //判断用户是否是第一次进入应用程序
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    if ([userDefaults boolForKey:@"isFirst"]==NO) {
        
        NSLog(@"第一次");
        [userDefaults setObject:nil forKey:@"是否登录"];
        NSLog(@"%@",[userDefaults objectForKey:@"是否登录"]);
    }else{
        NSLog(@"BUG");
        
    }
    [userDefaults synchronize];
    
    self.activityArr=[[NSMutableArray alloc]init];
    self.collectArr=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"活动";
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor=[UIColor whiteColor];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorColor=[UIColor whiteColor];
    NetworkTool *nettool=[[NetworkTool alloc]initWithURL:ACTIVITY_URL delegate:self];
    [nettool startTask];
}

-(void)networkResult:(id)result{
    NSMutableArray *arr =[result objectForKey:@"events"];
    for (NSMutableDictionary *dic in arr) {
        ActivityModel *model=[[ActivityModel alloc]initWithDictionary:dic];
        [self.activityArr addObject:model];
    }
    [self.tableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.activityArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (cell==nil) {
        cell=[[ActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    cell.model=self.activityArr[indexPath.row];
    
    if (cell.model.picture) {
        cell.allView.activity2.imageView.image=cell.model.picture;
    }
    else{
        [cell.model  addObserver:self forKeyPath:@"picture" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(cell)];
    }
    return cell;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    UIImage *image =[change objectForKey:@"new"];
    
    ActivityTableViewCell *cell=(__bridge ActivityTableViewCell *)(context);
    NSArray *visiblecellarr=self.tableView.visibleCells;
    if ([visiblecellarr containsObject:cell ]) {
        cell.allView.activity2.imageView.image=image;
    }
    
    //移除观察者
    [cell.model removeObserver:self forKeyPath:@"picture" context:context];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==self.activityArr.count-1) {
        return 250;
    }
    return  180;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//选中的方法,点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //推出下一个页面
    ActivityDetailViewController *detailVC=[[ActivityDetailViewController alloc]init];
    
    detailVC.ACmodel=self.activityArr[indexPath.row];
    
    detailVC.count=indexPath.row;
    
    [self.navigationController pushViewController:detailVC animated:YES];
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
