//
//  allVIew.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "allVIew.h"

@implementation allVIew
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.label=[[UILabel alloc]
                    initWithFrame:CGRectMake(5, 5, 350, 18)];
        [self addSubview:self.label];
        self.activity2=[[ActivityView2 alloc]initWithFrame:CGRectMake(5, 32, 345, 121) image:[UIImage imageNamed:@"bg_cell.png"] labeltext1:@"感兴趣:" labeltext2:@"参加:"];
        self.activity2.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.activity2];
        self.activity2.layer.cornerRadius=5;
        self.LIview1=[[Image_Label_View alloc]initWithFrame:CGRectMake(10, 35, 240, 22) labelText:@"" image:[UIImage imageNamed:@"11.png"]];
        self.LIview2=[[Image_Label_View alloc]initWithFrame:CGRectMake(10, 60, 240, 22) labelText:@"" image:[UIImage imageNamed:@"12.png"]];
        self.LIview3=[[Image_Label_View alloc]initWithFrame:CGRectMake(10, 85, 240, 22) labelText:@"" image:[UIImage imageNamed:@"13.png"]];
        [self addSubview:self.LIview1];
        [self addSubview:self.LIview2];
        [self addSubview:self.LIview3];
        self.backgroundColor=[UIColor colorWithRed:0.768 green:0.843 blue:0.874 alpha:1.0];
        self.LIview1.label.font=[UIFont systemFontOfSize:14];
        self.LIview2.label.font=[UIFont systemFontOfSize:14];
        self.LIview3.label.font=[UIFont systemFontOfSize:14];

        
        
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
