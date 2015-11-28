//
//  HaoCheViewController.m
//  BaseProject
//
//  Created by mis on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HaoCheViewController.h"
#import "iCarousel.h"
@interface HaoCheViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic,strong) iCarousel* ic;
/** 存储图片名称 */
@property (nonatomic,strong) NSArray* imageNames;


@end

@implementation HaoCheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
//    //自动滚动
//        [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
//            [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
//        } repeats:YES];
}
-(NSArray *)imageNames{
    if (!_imageNames) {
        /** 得到img.bundle 文件夹中的所有的文件名  */
        NSString* path = [[NSBundle mainBundle] pathForResource:@"img2" ofType:@"bundle"];
        NSFileManager* fileManager = [NSFileManager defaultManager];
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        //就是仿写的CollectionView
        _ic.delegate = self;
        _ic.dataSource = self;
        //修改3D显示模式, type是枚举类型，数值0 ~ 11
        _ic.type = 8;
        //自动展示, 0表示不滚动 越大滚动的越快
        _ic.autoscroll = 0.2;
        //改变为竖向展示
        //        _ic.vertical = NO;
        
        
        // 改为翻页模式
        _ic.pagingEnabled = NO;
        //滚动速度
        _ic.scrollSpeed = 1;
    }
    return _ic;
}

#pragma  mark - iCarousel
//添加循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;//默认循环滚动模式是否
    }
    // 修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    // 取消后背的显示
    if (option == iCarouselOptionShowBackfaces) {
        return NO;
    }
    return value;
}

//问：有多少个Cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageNames.count;
}
//问：每个Cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW*8/9, kWindowH*2/5)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    //imageNames数组中存的是图片名，以为图片是jpg形式，只能用路径来读取。
    NSString *path=[[NSBundle mainBundle] pathForResource:@"img2" ofType:@"bundle"];
    path=[path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld张", index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
