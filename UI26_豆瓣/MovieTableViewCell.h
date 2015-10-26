//
//  MovieTableViewCell.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/9.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movietableV.h"
#import "movieModel.h"
@interface MovieTableViewCell : UITableViewCell

@property(nonatomic,retain)movietableV *movieView;


@property(nonatomic,retain)movieModel *moviemodel;

@end
