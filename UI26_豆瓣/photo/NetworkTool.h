//
//  NetworkTool.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/14.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkToolDelegate <NSObject>

-(void)networkResult:(id)result;


@end


@interface NetworkTool : NSObject

-(instancetype)initWithURL:(NSString *)URLStr delegate:(id<NetworkToolDelegate>)delegate;

-(void)startTask;


@property(nonatomic,retain)id<NetworkToolDelegate>delegate;






@end
