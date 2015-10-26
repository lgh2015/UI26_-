//
//  ActivityModel.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityModel : NSObject<NSCoding>
@property(nonatomic,retain)NSString  *title;
@property(nonatomic,retain)NSString  *begin_time;
@property(nonatomic,retain)NSString  *address;
@property(nonatomic,retain)NSString  *category_name;
@property(nonatomic,retain)UIImage   *picture;
@property(nonatomic,retain)NSString  *image;

-(instancetype)initWithDictionary:(NSMutableDictionary *)dic;


@end
