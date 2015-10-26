//
//  MovieViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "MovieViewController.h"
#import "movieTableView.h"
#import "movieModel.h"
#import "MovieCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MovieDetailViewController.h"
#import "NetworkTool.h"
#import "MovieTableViewCell.h"
#import "movietableV.h"
#define MOVIE_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"

@interface MovieViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,NetworkToolDelegate, UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,retain)NSMutableArray *movieArr;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"影片";
    self.movieArr=[[NSMutableArray alloc]init];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.minimumLineSpacing=30;
    flowLayout.itemSize=CGSizeMake(100, 150);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    [self.view addSubview:self.collectionView];
    NetworkTool *nettool=[[NetworkTool alloc]initWithURL:MOVIE_URL delegate:self];
    [nettool startTask];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"change" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
}
-(void)rightAction:(UIBarButtonItem *)button
{
    movieTableView *view = [[movieTableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [view setDelegate:self];
    [view.tableView registerClass:[MovieTableViewCell class] forCellReuseIdentifier:@"reuse"];
    [UIView transitionFromView:self.view toView:view duration:2 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movieArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    movieModel *model=self.movieArr[indexPath.row];
    cell.moviemodel=model;
    [cell.movieView.imageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.movieArr.count;
}
#pragma mark------collectionView
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    movieModel *moviemodel=self.movieArr[indexPath.row];
    [cell.movieV.imageView sd_setImageWithURL:[NSURL URLWithString:moviemodel.pic_url]];
//    cell.movieV.label.text=moviemodel.movieName;
    cell.moviewmodel=moviemodel;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailViewController *movieDetailVC=[[MovieDetailViewController alloc]init];
    [self.navigationController pushViewController:movieDetailVC animated:YES];
    
}
-(void)networkResult:(id)result{
    NSMutableArray *arr=[result objectForKey:@"result"];
    for (NSMutableDictionary *dic in arr) {
        movieModel *model =[[movieModel alloc]initWithDictionary:dic];
        [self.movieArr addObject:model];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
    });
}


//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.movieArr.count;
//}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"movie" forIndexPath:indexPath];
//    if (cell==nil) {
//        cell=[[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"movie"];
//    }
//    cell.moviemodel=self.movieArr[indexPath.row];
//    
//    if (cell.moviemodel.image) {
//        cell.movieView.imageView.image=cell.moviemodel.image;
//    }
//    else{
//        [cell.moviemodel addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(cell)];
//    }
//    return  cell;
//}

//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    UIImage *image=change[@"new"];
//    
//    MovieTableViewCell *cell=(__bridge MovieTableViewCell *)(context);
//    
//    // 获取当前显示在屏幕上的cell
//    NSArray *visibleCells = self.tableView.visibleCells;
//    if ([visibleCells containsObject:cell]) {
//        cell.movieView.imageView.image = image;
//    }
//
////     在不需要观察者(赋值完成的时候)的时候, 移除self的观察者身份
//    [object removeObserver:self forKeyPath:keyPath context:context];
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == self.movieArr.count-1) {
//        return 250;
//    }
//    return 146;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

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
