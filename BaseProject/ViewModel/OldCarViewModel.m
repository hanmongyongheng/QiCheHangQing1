//
//  OldCarViewModel.m
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "OldCarViewModel.h"

@implementation OldCarViewModel

//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
        [OrdCarNetManager getOrdCarSign:self.sign Brandid:self.brandid CompletionHandle:^(OrdCarModel* model, NSError *error) {
            [self.dataArr removeAllObjects];
            [self.dataArr addObjectsFromArray:model.result.carlist];
            completionHandle(error);
        }];
}

-(OrdCarCarlistModel* )modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

//从视图中得到的
- (NSURL* )getImgURLForRow:(NSInteger)row{

    return [NSURL URLWithString:[self modelForRow:row].image];
}
- (NSString* )getSeriesidForRow:(NSInteger)row{
    return [self modelForRow:row].SeriesName;
}
- (NSString *)getSpaceNameForRow:(NSInteger)row{
    return [self modelForRow:row].SpecName;
}
/** 得到registraiondate 的两个数据 */
- (NSString* )getregistraiondateForRow:(NSInteger)row{
    NSString* mile = [NSString stringWithFormat:@"%@万公里/",[self modelForRow:row].mileage] ;
    return [mile stringByAppendingString:[NSString stringWithFormat:@"%@年",[self  modelForRow:row].registrationdate]];
}

- (NSString* )getPriceForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%@ 万",[self modelForRow:row].price];
}
- (NSString* )getpdataForRow:(NSInteger)row{
    return [self modelForRow:row].pdate;
}




-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(instancetype)initWithSign:(NSString* )sign Brandid:(NSInteger)brandid{
    if (self = [super init]) {
        self.sign = sign;
        self.brandid = brandid;
    }
    return self;
}
-(instancetype)init{
    if (self = [super init]) {
        NSAssert(NO, @"%s不能用init初始化应该使用initWithSign..初始化",__FUNCTION__);
    }
    return self;
}

- (NSInteger)getPidForRow:(NSInteger)row{
    return [self modelForRow:row].pid;
}
- (NSInteger)getCidForRow:(NSInteger)row{
    return [self modelForRow:row].cid;
}

@end
