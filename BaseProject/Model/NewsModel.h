//
//  NewsModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsResultModel,NewsResultHeadlineinfoModel, NewsResultHeadTopnewsinfoModel;

@interface NewsModel : BaseModel

@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSNumber *returncode;
@property(nonatomic,strong) NewsResultModel *result;

@end

@interface NewsResultModel :BaseModel
@property(nonatomic,strong) NSArray *focusimg;
@property(nonatomic,strong) NewsResultHeadlineinfoModel *headlineinfo;
@property(nonatomic,strong) NSNumber *isloadmore;
@property(nonatomic,strong) NSArray *anewslist;
@property(nonatomic,strong) NSNumber *rowcount;
@property(nonatomic,strong) NewsResultHeadTopnewsinfoModel *topnewsinfo;

@end

@interface NewsResultFocusimgModel : BaseModel
@property(nonatomic,strong) NSNumber *ID;
@property(nonatomic,strong) NSString *imgurl;
@property(nonatomic,strong) NSNumber *JumpType;
@property(nonatomic,strong) NSString *jumpurl;
@property(nonatomic,strong) NSNumber *mediatype;
@property(nonatomic,strong) NSNumber *pageindex;
@property(nonatomic,strong) NSNumber *replycount;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *updatetime;

@end

@interface NewsResultHeadlineinfoModel : BaseModel
@property(nonatomic,strong) NSString *updatetime;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *time;
@property(nonatomic,strong) NSString *smallpic;
@property(nonatomic,strong) NSNumber *replycount;
@property(nonatomic,strong) NSNumber *pagecount;
@property(nonatomic,strong) NSNumber *mediatype;
@property(nonatomic,strong) NSString *lasttime;
@property(nonatomic,strong) NSNumber *jumppage;
@property(nonatomic,strong) NSString *indexdetail;
@property(nonatomic,strong) NSNumber *ID;
@end

@interface NewsResultNewslistModel : NewsResultHeadlineinfoModel
//变量的名字 不能以new开头
@property(nonatomic,strong) NSNumber *anewstype;
@property(nonatomic,strong) NSNumber *dbid;
@property(nonatomic,strong) NSString *intacttime;

@end

@interface NewsResultHeadTopnewsinfoModel : BaseModel

@end













