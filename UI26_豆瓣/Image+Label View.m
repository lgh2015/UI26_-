//
//  Image+Label View.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "Image+Label View.h"

@implementation Image_Label_View

-(instancetype)initWithFrame:(CGRect)frame
                   labelText:(NSString *)labelText
                       image:(UIImage *)image{
    self=[super initWithFrame:frame];
    if (self) {
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/6, 0, self.frame.size.width/3*2, self.frame.size.height)];
        self.label.text=labelText;
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/8, self.frame.size.height)];
        self.imageView.image=image;
        [self addSubview:self.label];
        [self addSubview:self.imageView];
        
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
