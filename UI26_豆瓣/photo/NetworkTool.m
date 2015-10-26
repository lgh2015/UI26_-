//
//  NetworkTool.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/14.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "NetworkTool.h"

@interface NetworkTool ()<NSURLSessionDataDelegate>

@property(nonatomic,retain)NSURLSessionDataTask *dataTask;

@property(nonatomic,retain)NSMutableData *mdata;
@end

@implementation NetworkTool

-(instancetype)initWithURL:(NSString *)URLStr delegate:(id<NetworkToolDelegate>)delegate{
    self=[super init];
    if (self) {
        self.delegate=delegate;
        NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        self.dataTask=[session dataTaskWithURL:[NSURL URLWithString:URLStr]];
        self.mdata=[[NSMutableData alloc]init];
    }
    return  self;
}

-(void)startTask{
    [self.dataTask resume];
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    [self.mdata appendData:data];
}


-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    
    id result=[NSJSONSerialization JSONObjectWithData:self.mdata options:NSJSONReadingMutableContainers error:NULL];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(networkResult:)]) {
        [self.delegate networkResult:result];
    }
}




@end
