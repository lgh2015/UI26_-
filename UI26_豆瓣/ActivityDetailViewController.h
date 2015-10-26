//
//  ActivityDetailViewController.h
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/15.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"






@interface ActivityDetailViewController : UIViewController

@property(nonatomic,retain)ActivityModel   *ACmodel;

@property (strong, nonatomic) IBOutlet UILabel *acnameLabel;
@property (strong, nonatomic) IBOutlet UILabel *acaddressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageV;

@property (strong, nonatomic) IBOutlet UILabel *accategorynameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property(nonatomic,copy)void(^block)(NSInteger );

@property(nonatomic,assign)NSInteger count;
@end
