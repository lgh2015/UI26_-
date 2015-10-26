//
//  MovieTableViewCell.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/9.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.movieView=[[movietableV alloc]initWithFrame:CGRectMake(10, 10, 355, 120)];
        [self.contentView addSubview:self.movieView];
        self.movieView.backgroundColor=[UIColor  colorWithRed:0.768 green:0.843 blue:0.874 alpha:1.0];
        self.movieView.layer.cornerRadius=5;
    }
    return self;
}

-(void)setMoviemodel:(movieModel *)moviemodel{
    _moviemodel=moviemodel;
    self.movieView.label.text=moviemodel.movieName;
}


  
    
    
    
//    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
//    NSURL *murl=[[NSURL alloc]initWithString:model.pic_url];
//    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:murl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        UIImage *image=[UIImage imageWithData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.movieView.imageView.image=image;
//        });
//    }];
//    [dataTask resume];
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
