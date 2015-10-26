//
//  CinemaView.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/10.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "CinemaView.h"

@implementation CinemaView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.label1=[[UILabel alloc]initWithFrame:CGRectMake(8, 2, 350, 40)];
        self.label2=[[UILabel alloc]initWithFrame:CGRectMake(8, 48, 350, 30)];
        self.label3=[[UILabel alloc]initWithFrame:CGRectMake(8, 85, 350, 30)];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self addSubview:self.label3];
        
    }
    return  self;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
