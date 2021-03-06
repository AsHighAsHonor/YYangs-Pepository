//
//  SheetView.m
//  GXMoblieOA
//
//  Created by YYang on 16/3/1.
//  Copyright © 2016年 YYang. All rights reserved.
//

#import "SheetView.h"

@interface SheetView()
@property(nonatomic,strong)UIView *containerView;
@property(nonatomic,strong)UIView *toolView;
@property(nonatomic,strong)UIButton *closeBtn;
@property(nonatomic,strong)UIButton *okBtn;
@property(nonatomic,strong)UIButton *cancleBtn;
@property(nonatomic,strong)NSArray *dateSources;
@property(nonatomic,strong)UIView *fView;
@property(nonatomic,assign)BOOL hasShowActionSheet;
/**
 *  @author YYang, 16-03-01 10:03:47
 *
 *  要添加的内容视图
 */
@property(nonatomic,strong) UIView *contentView;

@end

@implementation SheetView
-(instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert(NO, @"Use initWithContentView.....to init ,please");
    }
    return self;
}

+(instancetype)sheetViewWithContentView:(UIView *)contentView andSuperview:(UIView *)superView
{
    return [[SheetView alloc]initWithContentView:contentView andSuperview:superView];
}


-(instancetype)initWithContentView:(UIView *)contentView andSuperview:(UIView *)superView
{
    self = [super init];
    if(self)
    {
        self.contentView = contentView;
        self.fView = superView;
        [self generateSubview];
    }
    return self;
}

#pragma mark - InitSubviews
-(void)generateSubview
{
        //1.空白区域 button
    self.closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.closeBtn addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeBtn];
    
    
    //2.toolView
    self.toolView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50) ];
    [self.toolView setBackgroundColor:[UIColor whiteColor]];

    //退出按钮
    _cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, 50)];
    [_cancleBtn setTitle:@"Cancle" forState:UIControlStateNormal];
    [_cancleBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancleBtn addTarget:self action:@selector(actionDone) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:_cancleBtn];
    
    //确定按钮
    _okBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_cancleBtn.frame)+SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 50)];
    [_okBtn setTitle:@"OK" forState:UIControlStateNormal];
    [_okBtn setTitleColor:[UIColor blackColor]  forState:UIControlStateNormal];
    [_okBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_okBtn addTarget:self action:@selector(actionCancle) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:_okBtn];
    
    //3.containerView
    self.containerView = [[UIView alloc]init];
//    [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame)+CGRectGetHeight(self.toolView.frame))];
    [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];

    [self addSubview:self.containerView];
//    [self.containerView addSubview:self.toolView];

    
    //4.contentView
//    [self.contentView setFrame:CGRectMake(0, CGRectGetMaxY(self.toolView.frame), CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
    [self.contentView setFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];

    [self.containerView addSubview:self.contentView];
    

    //5.self
    [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    

}

#pragma mark - AddConstaints


#pragma mark - DelegateMethod

#pragma mark - CustomMethod
-(void)showActionSheet
{

    if(!_hasShowActionSheet)
    {
       
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.3 options:0 animations:^{
            
            [self.fView addSubview:self];

//            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
            
//            [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT-(CGRectGetHeight(self.contentView.frame)+CGRectGetHeight(self.toolView.frame)+64), SCREEN_WIDTH, CGRectGetHeight(self.contentView.frame)+CGRectGetHeight(self.toolView.frame))];
            [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT-(CGRectGetHeight(self.contentView.frame) + 90), SCREEN_WIDTH, CGRectGetHeight(self.contentView.frame))];

            NSLog(@"contentView----->>>>>%@containerView------->>%@",NSStringFromCGRect(self.contentView.frame),NSStringFromCGRect(self.containerView.frame));

        } completion:^(BOOL finished) {
            _hasShowActionSheet = YES;
        }];
 
    }

}
/**
 * 隐藏
 */
-(void)dismissActionSheet
{
    
    [UIView animateWithDuration:0.2 animations:^{
        
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
//    [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT+320, SCREEN_WIDTH, CGRectGetHeight(self.contentView.frame)+CGRectGetHeight(self.toolView.frame))];
    [self.containerView setFrame:CGRectMake(0, SCREEN_HEIGHT+320, SCREEN_WIDTH, CGRectGetHeight(self.contentView.frame))];

    } completion:^(BOOL finished) {
        _hasShowActionSheet = NO;
        self.didDismiss(self.tag);
        [self removeFromSuperview];
    } ];
    
    
}

#pragma mark - NetworkMethod

#pragma mark - ClickEvent
-(void)closeButtonClicked
{
    [self dismissActionSheet];
}

-(void)actionCancle
{
    [self dismissActionSheet];
}

-(void)actionDone
{
    
    
}


@end
