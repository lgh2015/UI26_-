//
//  movieModel.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/9.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface movieModel : NSObject


@property(nonatomic,retain)NSString *pic_url;
@property(nonatomic,retain)NSString *movieName;
@property(nonatomic,retain)NSString *movieid;
@property(nonatomic,retain)UIImage *image;

@property(nonatomic,retain)NSMutableDictionary *dic;

-(instancetype)initWithDictionary:(NSMutableDictionary *)dic;
@end
