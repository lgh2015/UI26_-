//
//  User.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/17.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,retain)NSString *username;
@property(nonatomic,retain)NSString *key;
@property(nonatomic,retain)NSString *phoneNumber;
@property(nonatomic,retain)NSString *Email;

-(instancetype)initWithusername:(NSString *)username
                            key:(NSString *)key
                       phonenum:(NSString *)phoneNumber
                          Email:(NSString *)email;


@end
