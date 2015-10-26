//
//  ActivityModel.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(instancetype)initWithDictionary:(NSMutableDictionary *)dic{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
//复杂对象归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.begin_time forKey:@"begin_time"];
    [aCoder encodeObject:self.category_name forKey:@"category_name"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.picture forKey:@"picture"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =[super init];
    if (self) {
        self.title=[aDecoder decodeObjectForKey:@"title"];
        self.begin_time=[aDecoder decodeObjectForKey:@"begin_time"];
        self.category_name=[aDecoder decodeObjectForKey:@"category_name"];
        self.address =[aDecoder decodeObjectForKey: @"address"];
        self.picture=[aDecoder decodeObjectForKey:@"picture"];
    }
    return self;
}










@end
