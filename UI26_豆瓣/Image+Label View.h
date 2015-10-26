//
//  Image+Label View.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Image_Label_View : UIView
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UILabel *label;

-(instancetype)initWithFrame:(CGRect)frame
                   labelText:(NSString *)labelText
                       image:(UIImage *)image;

@end
