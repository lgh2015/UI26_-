//
//  User.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/17.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithusername:(NSString *)username key:(NSString *)key phonenum:(NSString *)phoneNumber Email:(NSString *)email{
    self=[super init];
    if ( self) {
        _username =username;
        _key =key;
        _phoneNumber =phoneNumber;
        _Email=email;
    }
    return self;
}
@end
