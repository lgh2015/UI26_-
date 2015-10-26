//
//  movietableV.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/22.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "movietableV.h"

@implementation movietableV
-(instancetype)initWithFrame:(CGRect)frame  {
    self=[super initWithFrame:frame];
    if (self) {
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(120, 40, 100, 40)];
        [self addSubview:self.label];
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 120)];
        [self addSubview:self.imageView];
        self.label.font=[UIFont systemFontOfSize:15];
        self.label.textAlignment=NSTextAlignmentCenter;
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
