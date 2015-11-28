//
//  OldDetailCell.h
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldDetailCell : UITableViewCell
@property (nonatomic,strong) UIImageView* imageview;
//label自上到下写的
@property (nonatomic,strong) UILabel* SeriesidLb;
@property (nonatomic,strong) UILabel* SpacenameLb;
@property (nonatomic,strong) UILabel* registraiondate;
@property (nonatomic,strong) UILabel* priceLb;

//最右边的label
@property (nonatomic,strong) UILabel* pdataLb;


@end
