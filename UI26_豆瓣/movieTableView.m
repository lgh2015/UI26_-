//
//  movieTableView.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/22.
//  Copyright © 2015年 李国灏. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "movieTableView.h"
#import "MovieTableViewCell.h"
#define MOVIE_URL @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"


@implementation movieTableView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        self.tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:self.tableView];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
    }
    return self;
}


- (void)setDelegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate
{
    self.tableView.delegate = delegate;
    self.tableView.dataSource = delegate;
}


@end
