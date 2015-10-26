//
//  CinemaModel.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/10.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(instancetype)initWithDictionary:(NSMutableDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
