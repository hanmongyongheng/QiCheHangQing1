//
//  LatestViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"

@interface LatestViewModel : BaseViewModel

- (id)initWithNewsListType:(NewsListType)type;
@property(nonatomic) NewsListType type;

@property(nonatomic) NSInteger rowNumber;
//分页加载，必须要有可变的字典
//@property(nonatomic,strong) NSMutableArray *dataArr;
//头部滚动栏，图片数组
@property(nonatomic,strong) NSArray *headImageURLs;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)dateForRow:(NSInteger)row;
- (NSString *)commentNumberForRow:(NSInteger)row;
- (NSNumber *)IDForRow:(NSInteger)row;

@property(nonatomic,strong) NSString *updateTime;
@property(nonatomic) NSInteger page;

//刷新
- (void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
//加载更多
- (void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

@end














