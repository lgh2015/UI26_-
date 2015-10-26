//
//  UserDataBase.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/17.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "User.h"

@interface UserDataBase : NSObject

+(instancetype)shareManger;

-(void)openDB;

-(void)closeDB;

-(void)judegeWithResult:(int)result action:(NSString *)action;


-(void)createTable;

-(void)insertUser:(User *)user;

-(NSMutableArray *)alluser;










@end
