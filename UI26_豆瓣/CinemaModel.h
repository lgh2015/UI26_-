//
//  CinemaModel.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/10.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject


@property(nonatomic,retain)NSString *cinemaName;
@property(nonatomic,retain)NSString *address;
@property(nonatomic,retain)NSString *telephone;

-(instancetype)initWithDictionary:(NSMutableDictionary *)dic;
@end
