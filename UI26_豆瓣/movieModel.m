//
//  movieModel.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/9.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "movieModel.h"

@implementation movieModel
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
