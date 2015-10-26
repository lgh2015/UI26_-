//
//  ActivityView2.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "ActivityView2.h"

@implementation ActivityView2

-(instancetype)initWithFrame:(CGRect)frame
                       image:(UIImage *)image
                  labeltext1:(NSString *)labeltext1
                  labeltext2:(NSString *)labeltext2{
    self=[super initWithFrame:frame];
    if (self) {
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(255, 4, 80, 114)];
        self.label1=[[UILabel alloc]initWithFrame:CGRectMake(15, 92, 80, 25)];
        self.label2=[[UILabel alloc]initWithFrame:CGRectMake(135, 92, 80, 25)];
        self.label1.text=labeltext1;
        self.label2.text=labeltext2;
        self.label1.font=[UIFont systemFontOfSize:12];
        self.label2.font=[UIFont systemFontOfSize:12];
        [self addSubview:self.imageView];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        
        
    }
    return self;
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
