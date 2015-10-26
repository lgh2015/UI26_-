//
//  imageDownload.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/14.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "imageDownload.h"

@implementation imageDownload

+(void)downloadimageWithURL:(NSString *)URLStr completionHandler:(void(^)(UIImage *image))imageblock{
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:[NSURL URLWithString:URLStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image=[UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageblock(image);
        });
    }];
    [dataTask resume];
    
}


@end
