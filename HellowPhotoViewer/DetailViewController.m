//
//  DetailViewController.m
//  HellowPhotoViewer
//
//  Created by tkbg on 2014/10/7.
//  Copyright (c) 2014年 Howard Hong. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailViewController ()
{
    bool isplaybackmode;
}

@end

@implementation DetailViewController

#pragma mark - Managing the detail item
/*
- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}
*/
- (void)configureView {
    _datas1=[NSMutableArray arrayWithObjects:
             @"test1.jpg",
             @"test3.png",
             @"test2.jpg",
             nil];
        UIImage *targetImage=[UIImage imageNamed:_datas1[_targetIndex]];
    //指定的index的 MutableArray會轉成image
    NSLog(@"%ld",_targetIndex);
    
    _theImageView.image=targetImage;

    _theImageView.contentMode=UIViewContentModeScaleToFill;
    
    _theScrollView.contentSize=targetImage.size;
    _theScrollView.pagingEnabled=YES;
    
    
    
    //_theScrollView.maximumZoomScale=5.0;
    //放大5倍
    //_theScrollView.minimumZoomScale=0.5;
    //縮小5倍
    //float initScale=self.view.frame.size.height/targetImage.size.height;
    //浮動生成規模配合原圖大小寬度
    
    //initScale=1.0;
    
    _theScrollView.zoomScale=1.0;
    

    
    
}

//-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return _theImageView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    //不要去自動調整分析scrollview插圖
    
//    [self configureView];
    UISwipeGestureRecognizer *toLeft=[[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(toLeft)];
    
    toLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    
    [_theImageView addGestureRecognizer:toLeft];
    //將手勢移動加到imageview
    
    UISwipeGestureRecognizer *toRight=[[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(toRight)];
    toRight.direction=UISwipeGestureRecognizerDirectionRight;
    [_theImageView addGestureRecognizer:toRight];
    
    _theImageView.userInteractionEnabled=YES;
    //將user互動功能開啟
    
    _theIntervalSlider.hidden=YES;
//    isplaybackmode=YES;
//    [self performSelector:@selector(toLeft) withObject:self afterDelay:_theIntervalSlider.value];
}



-(void)viewDidLayoutSubviews
{
    [self configureView];
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}
//(重要)以上兩個是在跑slider圖片後按back後背景還在跑，所以要執行這兩個來取消預約

-(void)toRight{
    CATransition *transition=[CATransition animation];
    transition.duration=0.5;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.type=kCATransitionPush;
    transition.subtype=kCATransitionFromLeft;
    //以上是動畫效果
    
    _targetIndex--;
    if (_targetIndex<0)
        _targetIndex=_datas1.count-1;
    
    
    [self configureView];
    [_theImageView.layer addAnimation:transition forKey:nil];
    //執行效果
}
-(void)toLeft{
    CATransition *transition=[CATransition animation];
    transition.duration=0.5;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.type=kCATransitionPush;
    transition.subtype=kCATransitionFromRight;
    //以上是動畫效果
    
    _targetIndex++;
    if (_targetIndex>=_datas1.count)
        //若現在的照片編號大於現有張數
        _targetIndex=0;
    
    
    
    [self configureView];
    [_theImageView.layer addAnimation:transition forKey:nil];
    //執行效果
    if(isplaybackmode)
    {
        
        [self performSelector:@selector(toLeft) withObject:self afterDelay:
         _theIntervalSlider.value];
        NSLog(@"%f",_theIntervalSlider.value);
    }
    //執行playback效果
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
