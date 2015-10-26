//
//  ActivityView2.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image+Label View.h"
@interface ActivityView2 : UIView


@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UILabel *label1;
@property(nonatomic,retain)UILabel *label2;


-(instancetype)initWithFrame:(CGRect)frame
                       image:(UIImage *)image
                   labeltext1:(NSString *)labeltext1
                  labeltext2:(NSString *)labeltext2;

@end
