//
//  CinemaTableViewCell.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/10.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cinemaV=[[CinemaView alloc]initWithFrame:CGRectMake(8, 8, 359, 120)];
        self.cinemaV.backgroundColor=[UIColor colorWithRed:0.768 green:0.843 blue:0.874 alpha:1.0];
        [self.contentView addSubview:self.cinemaV];
        self.cinemaV.layer.cornerRadius=5;
    }
    return self;
}




-(void)setModel:(CinemaModel *)model{
    _model=model;
    self.cinemaV.label1.text=model.cinemaName;
    self.cinemaV.label2.text=model.address;
    self.cinemaV.label3.text=model.telephone;
    self.cinemaV.label1.font=[UIFont systemFontOfSize:20];
    self.cinemaV.label2.font=[UIFont systemFontOfSize:13];
    self.cinemaV.label3.font=[UIFont systemFontOfSize:13];
    self.cinemaV.label2.numberOfLines=0;
    [self.cinemaV.label2 sizeToFit];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
