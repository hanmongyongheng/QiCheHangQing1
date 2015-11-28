//
//  OrdCarModel.h
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class OrdCarResultModel,OrdCarCarlistModel;
@interface OrdCarModel : BaseModel

@property (nonatomic, assign) NSInteger returncode;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) OrdCarResultModel *result;

@end
@interface OrdCarResultModel : NSObject

@property (nonatomic, strong) NSArray<OrdCarCarlistModel *> *carlist;

@property (nonatomic, assign) NSInteger pagecount;

@property (nonatomic, assign) NSInteger rowcount;

@property (nonatomic, assign) NSInteger pageindex;

@property (nonatomic, assign) NSInteger pagesize;

@end

@interface OrdCarCarlistModel : NSObject

@property (nonatomic, copy) NSString *registrationdate;

@property (nonatomic, assign) NSInteger activitytype;

@property (nonatomic, assign) NSInteger sourceid;

@property (nonatomic, assign) NSInteger isnew;

@property (nonatomic, assign) NSInteger isbailcar;

@property (nonatomic, assign) NSInteger creditid;

@property (nonatomic, assign) NSInteger dealertype;

@property (nonatomic, copy) NSString *carname;

@property (nonatomic, assign) NSInteger specid;

@property (nonatomic, copy) NSString *pname;

@property (nonatomic, copy) NSString *publishdate;

@property (nonatomic, copy) NSString *mileage;

@property (nonatomic, copy) NSString *SeriesYear;

@property (nonatomic, assign) NSInteger seriesyearid;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *BrandName;

@property (nonatomic, assign) NSInteger installment;

@property (nonatomic, copy) NSString *Environmental;

@property (nonatomic, assign) NSInteger carid;

@property (nonatomic, copy) NSString *SpecName;

@property (nonatomic, copy) NSString *saledealerprice;

@property (nonatomic, assign) NSInteger goodcarofpic;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger cid;

@property (nonatomic, assign) NSInteger Seriesid;

@property (nonatomic, assign) NSInteger flowmode;

@property (nonatomic, assign) NSInteger isnewcar;

@property (nonatomic, copy) NSString *pdate;

@property (nonatomic, assign) NSInteger haswarrantydate;

@property (nonatomic, assign) NSInteger bailmoney;

@property (nonatomic, assign) NSInteger invoice;

@property (nonatomic, assign) NSInteger haswarranty;

@property (nonatomic, copy) NSString *SeriesName;

@property (nonatomic, assign) NSInteger countrytype;

@property (nonatomic, assign) NSInteger fromtype;

@property (nonatomic, assign) NSInteger Brandid;

@property (nonatomic, assign) NSInteger extrepair;

@property (nonatomic, assign) NSInteger isoutsite;

@property (nonatomic, assign) NSInteger pid;

@property (nonatomic, copy) NSString *cname;

@end

