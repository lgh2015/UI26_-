//
//  MovieCollectionViewCell.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/20.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.movieV=[[movieView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:self.movieV];
        
    }
    return self;
}
-(void)setMoviewmodel:(movieModel *)moviewmodel{
    _moviewmodel=moviewmodel;
    self.movieV.label.text=moviewmodel.movieName;
}
//-(void)setMoviewmodel:(movieModel *)moviewmodel
//{
//    _moviewmodel=moviewmodel;
//    self.movieV.label.text=moviewmodel.movieName;
//}




@end
