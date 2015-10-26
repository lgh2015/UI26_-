//
//  MovieDetailViewController.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/20.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieViewController.h"
@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bbbAciton:(UIButton *)sender {
    MovieViewController *movieVC=[[MovieViewController alloc]init];
    [UIView transitionFromView:self.view toView:movieVC.view duration:2 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
