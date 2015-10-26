//
//  UserDataBase.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/17.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "UserDataBase.h"

@interface UserDataBase ()
{
    sqlite3 *dbpoint;
}
@end

@implementation UserDataBase

+(instancetype)shareManger{
        static UserDataBase *dbmanager=nil;
        if (dbmanager==nil) {
            dbmanager=[[UserDataBase alloc]init];
        }
    return dbmanager;
}
//打开数据库
-(void)openDB{
    NSString *dbpath=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"student.db"];
    int result=sqlite3_open([dbpath UTF8String], &dbpoint);
    [self judegeWithResult:result action:@"打开数据库"
     ];
}
//判断
-(void)judegeWithResult:(int)result action:(NSString *)action{
    if (result==SQLITE_OK) {
        NSLog(@"%@成功",action);
    }
    else{
        NSLog(@"%@失败",action);
        NSLog(@"%d",result);
    }
}
//关闭数据库
-(void)closeDB{
    int result=sqlite3_close(dbpoint);
    [self judegeWithResult:result action:@"关闭数据库"];
}
//创建表
-(void)createTable{
    [self openDB];
    NSString *sqlStr=@"Create table users(username text primary key ,key text ,phonenumber text, email text)";
    char *errmsg;
    int result=sqlite3_exec(dbpoint, [sqlStr UTF8String], NULL, NULL, &errmsg);
    [self judegeWithResult:result action:@"创建表"];
    sqlite3_free(errmsg);
    [self closeDB];
}
//创建用户
-(void)insertUser:(User *)user{
    [self openDB];
    NSString *sqlStr=[NSString stringWithFormat:@"insert into users(username,key,phonenumber,email) values('%@','%@','%@','%@')",user.username,user.key,user.phoneNumber,user.Email];
    char *errmsg;
    int result =sqlite3_exec(dbpoint, [sqlStr UTF8String], NULL, NULL, &errmsg);
    [self judegeWithResult:result action:@"添加用户成功"];
    sqlite3_free(errmsg);
    [self closeDB];
}

-(NSMutableArray *)alluser{
    [self openDB];
    NSMutableArray *userArr=[[NSMutableArray alloc]init];
    NSString *sqlStr=@"select * from users";
    sqlite3_stmt *stmt;
    
    int result =sqlite3_prepare(dbpoint, [sqlStr UTF8String], -1, &stmt, NULL);
    if (result==SQLITE_OK) {
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            User *user=[[User alloc]init];
            user.username = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            user.key =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            user.phoneNumber=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 2)];
            user.Email=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 3)];
            [userArr addObject:user];
        }
    }
    sqlite3_free(stmt);
    [self closeDB];
    return userArr;
    
    
}
























































@end
