//
//  MyCollectionViewCell.h
//  HellowPhotoViewer
//
//  Created by tkbg on 2014/10/7.
//  Copyright (c) 2014年 Howard Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end
