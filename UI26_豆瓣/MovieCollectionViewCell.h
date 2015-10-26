//
//  MovieCollectionViewCell.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/20.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieModel.h"
#import "movieView.h"
@interface MovieCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)movieView *movieV;

@property(nonatomic,strong)movieModel *moviewmodel;
@end
