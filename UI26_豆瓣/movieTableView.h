//
//  movieTableView.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/22.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieModel.h"
@interface movieTableView : UIView


@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *movieArr;

- (void)setDelegate:(id<UITableViewDelegate, UITableViewDataSource>)delegate;

@end
