
//
//  OldDetailCell.m
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "OldDetailCell.h"

@implementation OldDetailCell
- (UIImageView *)imageview {
    if(_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageview];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.width.mas_equalTo(75);
            
        }];
    }
    return _imageview;
}

- (UILabel *)SeriesidLb {
    if(_SeriesidLb == nil) {
        _SeriesidLb = [[UILabel alloc] init];
        _SeriesidLb.font = [UIFont systemFontOfSize:12];
        _SeriesidLb.textColor = [UIColor blackColor];
        _SeriesidLb.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_SeriesidLb];
        [_SeriesidLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageview.mas_right).mas_equalTo(4);
            make.top.mas_equalTo(8);
            make.right.mas_equalTo(-140);
           
            
        }];
    }
    return _SeriesidLb;
}

- (UILabel *)SpacenameLb {
    if(_SpacenameLb == nil) {
        _SpacenameLb = [[UILabel alloc] init];
        _SpacenameLb.font = [UIFont systemFontOfSize:10];
        _SpacenameLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_SpacenameLb];
        [_SpacenameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.SeriesidLb.mas_leftMargin);
            make.top.mas_equalTo(self.SeriesidLb.mas_bottom).mas_equalTo(4);
            make.right.mas_equalTo(-140);
         
        }];
    }
    return _SpacenameLb;
}

- (UILabel *)registraiondate {
    if(_registraiondate == nil) {
        _registraiondate = [[UILabel alloc] init];
        _registraiondate.font = [UIFont systemFontOfSize:8];
        _registraiondate.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_registraiondate];
        [_registraiondate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.SeriesidLb.mas_leftMargin);
            make.top.mas_equalTo(self.SpacenameLb.mas_bottom).mas_equalTo(4);
            make.right.mas_equalTo(-140);
          
        }];
    }
    return _registraiondate;
}

- (UILabel *)priceLb {
    if(_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.textColor = [UIColor redColor];
        _priceLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.SeriesidLb.mas_leftMargin);
            make.top.mas_equalTo(self.registraiondate.mas_bottom).mas_equalTo(4);
            make.right.mas_equalTo(-140);
            
        }];
    }
    return _priceLb;
}

- (UILabel *)pdataLb {
    if(_pdataLb == nil) {
        _pdataLb = [[UILabel alloc] init];
        _pdataLb.textColor = [UIColor lightGrayColor];
        _pdataLb.font = [UIFont systemFontOfSize:8];
        _pdataLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_pdataLb];
        [_pdataLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.SeriesidLb.mas_topMargin);
            make.right.mas_equalTo(-6);
            make.width.mas_equalTo(80);
        }];
    }
    return _pdataLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 1);
    }
    return self;
}


@end
