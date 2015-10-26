//
//  imageDownload.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/14.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface imageDownload : NSObject

+(void)downloadimageWithURL:(NSString *)URLStr completionHandler:(void(^)(UIImage *image))imageblock;



@end
