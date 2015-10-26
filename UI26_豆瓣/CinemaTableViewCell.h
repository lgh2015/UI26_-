//
//  CinemaTableViewCell.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/10.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaView.h"
#import "CinemaModel.h"
@interface CinemaTableViewCell : UITableViewCell

@property(nonatomic,retain)CinemaView *cinemaV;

@property(nonatomic,retain)CinemaModel *model;

@end
