//
//  DetailViewController.h
//  HellowPhotoViewer
//
//  Created by tkbg on 2014/10/7.
//  Copyright (c) 2014年 Howard Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIScrollViewDelegate>
//還需從scrollView拉線到Detail(主)才算完成

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong ,nonatomic)NSMutableArray *datas;
@property (assign, nonatomic)NSInteger targetIndex;
//nonatomic是誰都隨時可以存取它
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *theImageView;
@property (weak, nonatomic) IBOutlet UISlider *theIntervalSlider;

@property(strong,nonatomic)NSMutableArray *datas1;


@end

