//
//  OldCarViewModel.h
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "OrdCarNetManager.h"


@interface OldCarViewModel : BaseViewModel
@property (nonatomic,assign) NSInteger rowNumber;
//从视图中得到的
//@property (nonatomic,strong) UILabel* SeriesidLb;
//@property (nonatomic,strong) UILabel* SpacenameLb;
//@property (nonatomic,strong) UILabel* registraiondate;
//@property (nonatomic,strong) UILabel* priceLb;

//最右边的label
//@property (nonatomic,strong) UILabel* pdataLb;
- (NSURL* )getImgURLForRow:(NSInteger)row;
- (NSString* )getSeriesidForRow:(NSInteger)row;
- (NSString* )getSpaceNameForRow:(NSInteger)row;
/** 得到registraiondate 的两个数据 */
- (NSString* )getregistraiondateForRow:(NSInteger)row;

- (NSString* )getPriceForRow:(NSInteger)row;
- (NSString* )getpdataForRow:(NSInteger)row;

- (NSInteger)getPidForRow:(NSInteger)row;
- (NSInteger)getCidForRow:(NSInteger)row;
//从model的需求的到的
@property (nonatomic,strong)NSString* sign;
@property (nonatomic,assign)NSInteger brandid;
-(instancetype)initWithSign:(NSString* )sign Brandid:(NSInteger)brandid;



@end
