//
//  ViewController.m
//  XBTouchTool
//
//  Created by xxb on 2019/3/13.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "PrivaceCoverView.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic,strong) PrivaceCoverView *touchView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PrivaceCoverView *touchView = [PrivaceCoverView new];
    [self.view addSubview:touchView];
    [touchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(130);
    }];
//    touchView.frame = CGRectMake(20, 100, 300, 30);
    touchView.backgroundColor = [UIColor redColor];
    self.touchView = touchView;
    NSLog(@"%@",self.view);
    NSLog(@"%@",touchView);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    UIView *touchView = [touch view];
    if (self.touchView == touchView)
    {
        self.touchView.backgroundColor = [UIColor blackColor];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    UIView *touchView = [touch view];
    NSLog(@"%@",touchView);
    
    if (self.touchView == touchView)
    {
        [self.touchView layoutIfNeeded];
        CGRect frame = self.touchView.frame;
        
        CGPoint point = [touch locationInView:touchView]; //返回触摸点在视图中的当前坐标
        
        if (frame.size.height - point.y < 60)
        {
            CGPoint touchPoint = [touch locationInView:self.view];
            CGFloat height = touchPoint.y - frame.origin.y;
            if (height < 30)
            {
                height = 30;
            }
            if (height > 400)
            {
                height = 400;
            }
            frame.size.height =  height;
            [self.touchView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(height);
                make.top.mas_equalTo(130);
            }];
            [self.touchView layoutIfNeeded];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    UIView *touchView = [touch view];

    if (self.touchView == touchView)
    {
        [self.touchView layoutIfNeeded];
        CGRect frame = self.touchView.frame;
        
        CGPoint point = [touch locationInView:touchView]; //返回触摸点在视图中的当前坐标
        
        if (frame.size.height - point.y < 60)
        {
            CGPoint touchPoint = [touch locationInView:self.view];
            CGFloat height = touchPoint.y - frame.origin.y;
            if (height < 30)
            {
                height = 30;
            }
            if (height > 200)
            {
                height = 400;
            }
            else
            {
                height = 30;
            }
            frame.size.height =  height;
            
            [self.touchView layoutIfNeeded];
//            [UIView animateWithDuration:0.3 animations:^{
                [self.touchView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.view).offset(130);
                    make.left.right.equalTo(self.view);
                    make.height.mas_equalTo(height);
                }];
                [self.touchView layoutIfNeeded];
//            }];
        }
    }
    
//    if (self.touchView == touchView)
//    {
//        [self.touchView layoutIfNeeded];
//        __block CGRect frame = self.touchView.frame;
//
//        CGPoint point = [touch locationInView:touchView]; //返回触摸点在视图中的当前坐标
//        if (frame.size.height - point.y < 60)
//        {
//            [UIView animateWithDuration:0.3 animations:^{
//                CGPoint touchPoint = [touch locationInView:self.view];
//                CGFloat height = touchPoint.y - frame.origin.y;
//                if (height < 30)
//                {
//                    height = 30;
//                }
//                if (frame.size.height > 200)
//                {
//                    frame.size.height = 400;
//                    self.touchView.backgroundColor = [UIColor blackColor];
//                }
//                else
//                {
//                    frame.size.height = 30;
//                    self.touchView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//                }
//                [self.touchView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                    make.left.right.equalTo(self.view);
//                    make.height.mas_equalTo(frame.size.height);
//                    make.top.mas_equalTo(130);
//                }];
//                [self.touchView layoutIfNeeded];
//            }];
//        }
//    }
}



@end
