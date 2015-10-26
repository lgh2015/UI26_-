//
//  ActivityTableViewCell.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "imageDownload.h"

@implementation ActivityTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.allView=[[allVIew alloc]initWithFrame:CGRectMake(10, 10, 355, 160)];
        self.allView.layer.cornerRadius=5;
        [self.contentView addSubview:self.allView];
    }
    return self;
}



-(void)setModel:(ActivityModel *)model{
    _model=model;
    self.allView.label.text=model.title;
    self.allView.LIview1.label.text=model.begin_time;
    self.allView.LIview2.label.text=model.address;
    self.allView.LIview3.label.text=[NSString stringWithFormat:@"类型:%@",model.category_name];
    
    if (!model.picture) {
    [imageDownload downloadimageWithURL:model.image completionHandler:^(UIImage *image) {
        model.picture =image;
    }];
    }
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
