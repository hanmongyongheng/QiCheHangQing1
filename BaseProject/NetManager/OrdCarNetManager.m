//
//  OrdCarNetManager.m
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "OrdCarNetManager.h"
//ttp://apps.api.che168.com/Phone/V53/cars/search.ashx?_sign=454fc86b22c0d4fe6f1ab9ea640cafc6&channelid=App%20Store&pagesize=24&appversion=4.9.0&orderby=2&pageindex=2&needaroundtype=0&ispic=1&brandid=14&_appid=2scapp.ios&dealertype=9&lastdate=
@implementation OrdCarNetManager
//当pageindex改变时_sign也在改变
+(id)getOrdCarSign:(NSString* )sign Brandid:(NSInteger)brandid  CompletionHandle:(void(^)(id model,NSError* error))CompletionHandle{
   NSString* path = [NSString stringWithFormat:@"http://apps.api.che168.com/Phone/V53/cars/search.ashx?_sign=%@&channelid=App%%20Store&pagesize=24&appversion=4.9.0&orderby=2&pageindex=2&needaroundtype=0&ispic=1&brandid=%@&_appid=2scapp.ios&dealertype=9&lastdate=",sign,@(brandid)];
   return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        CompletionHandle([OrdCarModel objectWithKeyValues:responseObj],error);
    }];
}


@end
