//
//  ActivityTableViewCell.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityView2.h"
#import "Image+Label View.h"
#import "allVIew.h"
#import "ActivityModel.h"
@interface ActivityTableViewCell : UITableViewCell
@property(nonatomic,retain)allVIew *allView;

@property(nonatomic,retain)ActivityModel *model;


@end
