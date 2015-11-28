//
//  LeftViewController.m
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "MyCarGroupModel.h"
#import "MyCarModel.h"
#import "MyCarCell.h"
#import "Factory.h"
#import "MyCarsView.h"
#import "OldCarViewModel.h"
#import "OrdCarDetailViewController.h"
#import "XiangCheHeMeiNvViewController.h"
#import "HaoCheViewController.h"
//颜色
#define WKFColor(a,b,c,d) [UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:(d)]
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate,MyCarsViewDelegate>
@property (nonatomic, assign) BOOL isDraging;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIViewController* mainVC;
//存放数据的数组
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,weak)UITableView *tableView;

//自定义右侧view
@property (nonatomic,weak)MyCarsView *myView;

/** 引进VM层 */
@property (nonatomic,strong) OldCarViewModel* oldVM;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.navigationItem.title = @"二手车行情";
    [[UINavigationBar appearance] setTranslucent:NO];
    // 1.添加子控件
    [self addChildView];
    
    // 2.监听：使用KVO机制，监听mainView的frame属性的变化
    [self.mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    [self setupTableView];
    
    //创建右侧索引的view
    [self setupRightIndexView];
}
// 改变mainView的frame属性时自动调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", NSStringFromCGRect(_mainView.frame));
    
    if (self.mainView.frame.origin.x < 0) { // 往左移动
        // 显示右边
        self.rightView.hidden = NO;
        // 隐藏左边
        self.leftView.hidden = YES;
    }else if (_mainView.frame.origin.x > 0){ // 往右移动
        // 显示左边
        self.rightView.hidden = YES;
        // 隐藏右边
        self.leftView.hidden = NO;
        
    }
}

/* 1.添加三个子视图 */
- (void)addChildView
{
    // left 展示香车和美女
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    //    leftView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:leftView];
    leftView.backgroundColor = [UIColor whiteColor];
    UIImageView* imageview = [[UIImageView alloc]initWithFrame:CGRectZero];
    imageview.contentMode = 1;
    [leftView addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    imageview.image = [UIImage imageNamed:@"0936a5745faafcbf!600x600"];
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectZero];
    [leftView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:20];
    title.text = @"香车和美人";
    
    /** 点击得到更多的美女和香车图 以动画形式展示 */
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftView addSubview:btn];
    //    btn.backgroundColor = [UIColor grayColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(32);
        
    }];
    [btn bk_addEventHandler:^(id sender) {
        [self.navigationController pushViewController:[XiangCheHeMeiNvViewController new] animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    self.leftView = leftView;
    
    
    // right
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:rightView];
    rightView.backgroundColor = [UIColor whiteColor];
    UIImageView* imageview1 = [[UIImageView alloc]initWithFrame:CGRectZero];
    [rightView addSubview:imageview1];
    [imageview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(49);
        make.left.right.bottom.mas_equalTo(0);
    }];
    imageview1.contentMode = UIViewContentModeScaleToFill;
    imageview1.image = [UIImage imageNamed:@"13747418301000"];
    
    UILabel* title1 = [[UILabel alloc]initWithFrame:CGRectZero];
    [rightView addSubview:title1];
    [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
    title1.textAlignment = NSTextAlignmentCenter;
    title1.font = [UIFont systemFontOfSize:20];
    title1.text = @"霸气的车";
    /** 点击得到更多的霸气的车 */
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightView addSubview:btn1];
    //    btn.backgroundColor = [UIColor grayColor];
    btn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn1 setTitle:@"更多" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(25);
        
    }];
    [btn1 bk_addEventHandler:^(id sender) {
        [self.navigationController pushViewController:[HaoCheViewController new] animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.rightView = rightView;
    
    // mainView
    self.mainView.hidden = NO;
}
-(UIView *)mainView{
    if (!_mainView) {
        UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
        mainView.backgroundColor = WKFColor(255, 255, 255, 1);
        //把要形成查找的表示图加载到mainView中
        
        [mainView addSubview:self.tableView];
        
        [self.view addSubview:mainView];
        _mainView = mainView;
    }
    return _mainView;
}
//创建tableView
-(void)setupTableView{
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.showsVerticalScrollIndicator=NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableView.frame=CGRectMake(0, 30, self.view.                                                                                                                                                                            frame.size.width, self.view.frame.size.height-95);
    self.tableView=tableView;
    [self.mainView addSubview:_tableView];
    
    
    //一个label
    UILabel *label = [[UILabel alloc]init];
    label.frame =CGRectMake(0, 0, self.view.frame.size.width, 30);
    label.text = @"可按住移动";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = WKFColor(100, 81, 81, 1);
    label.numberOfLines=0;
    label.font = [UIFont systemFontOfSize:18];
    [self.mainView addSubview:label];
    
}
//创建右侧索引的view
-(void)setupRightIndexView{
    
    //数据的数组
    NSMutableArray *array = [NSMutableArray array];
    for (MyCarGroupModel *model in self.dataArray) {
        
        [array addObject:model.title];
    }
    
    //创建自定义的view
    MyCarsView *myView = [[MyCarsView alloc]init];
    myView.delegate=self;
    CGFloat w=50;
    CGFloat h=20*self.dataArray.count;
    CGFloat y=(self.tableView.frame.size.height-h)/2+CGRectGetMinY(self.tableView.frame);
    CGFloat x=self.view.frame.size.width-w;
    myView.frame=CGRectMake(x, y, w, h);
    myView.dataArray = array;
    _myView = myView;
    [self.mainView addSubview:myView];
    
    
}


/* 2.有移动触点时判断偏移量 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    // 获取当前点
    CGPoint currentPoint = [touch locationInView:self.view];
    // 获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self.view];
    // x轴偏移量：当手指移动一点的时候，x偏移多少
    CGFloat offsetX = currentPoint.x - prePoint.x;
    // 设置当前主视图的frame
    self.mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
    self.isDraging = YES;
}


#define MAXY 60
// 当手指偏移一点，根据X轴的偏移量算出当前主视图的frame
- (CGRect)getCurrentFrameWithOffsetX:(CGFloat)offsetX
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // 获取y轴偏移量，手指每移动一点，y轴偏移多少
    CGFloat offsetY = offsetX * MAXY / screenW;
    CGFloat scale = (screenH - 2 * offsetY) / screenH;
    if (self.mainView.frame.origin.x < 0) { // 往左边滑动
        scale = (screenH + offsetY*0.05) / screenH;
    }
    
    // 获取之前的frame
    CGRect frame = _mainView.frame;
    frame.origin.x += offsetX;
    frame.size.height = frame.size.height *scale;
    frame.size.width = frame.size.width *scale;
    frame.origin.y = (screenH - frame.size.height) * 0.5;
    
    return frame;
}

#define RTarget 250
#define LTarget -220
/*
 _mainView.frame.origin.x > screenW * 0.5 定位到右边
 CGRectGetMaxX(_mainView.frame) < screenW * 0.5 定位到左边 -220
 */
// 定位
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // 复位动画
    if (self.isDraging == NO && self.mainView.frame.origin.x != 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.mainView.frame = self.view.bounds;
        }];
    }
    
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat target = 0;
    if (self.mainView.frame.origin.x > screenW * 0.5) { // 定位到右边
        target = RTarget;
    }else if (CGRectGetMaxX(self.mainView.frame) < screenW * 0.5) { // 定位到左边
        target = LTarget;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if (target) { // 在需要定位左边或者右边
            
            // 获取x轴偏移量
            CGFloat offsetX = target - self.mainView.frame.origin.x;
            
            // 设置当前主视图的frame
            self.mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
            
        }else{ // 还原
            self.mainView.frame = self.view.bounds;
        }
    }];
    
    self.isDraging = NO;
    
}

#pragma mark - MyCarsViewDelegate代理方法
-(void)touchEndPoint:(CGPoint)point andWithSelectedTag:(int)tag{
    
    //滑动tableView 根据tag
    if (tag<0) {
        tag=0;
    }else if (tag>self.dataArray.count-1){
        tag=(int)self.dataArray.count-1;
    }
    
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:tag];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}


#pragma mark - UITableViewDataSource,,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MyCarGroupModel *model =self.dataArray[section];
    return model.cars.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCarCell *cell = [MyCarCell cellWithTableView:tableView];
    
    MyCarGroupModel *groupModel =self.dataArray[indexPath.section];
    MyCarModel *model =groupModel.cars[indexPath.row];
    cell.model=model;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    MyCarGroupModel *model =self.dataArray[section];
    return model.title;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OrdCarDetailViewController* vc = [[OrdCarDetailViewController alloc]init];
    MyCarGroupModel *groupModel =self.dataArray[indexPath.section];
    MyCarModel *model =groupModel.cars[indexPath.row];
    vc.name = model.name;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                vc.sign = @"823cfe20e93ab9ca15e9afcdd723dd3d";
                vc.brandid = 33;
            }
            else{
                vc.sign = @"410e4b83ec8899b374cab15d12add7b6";
                vc.brandid = 35;
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                vc.sign = @"7be95d054e1bd12d879b082d0c94ee9a";
                vc.brandid = 15;
            }
            else if (indexPath.row == 1){
                vc.sign = @"b75ed3d7a5973a2da979347158fa4c4c";
                vc.brandid = 40;
            }
            else if (indexPath.row == 2){
                vc.sign = @"31bb8d4a005175d48bc5d74bb241e6b0";
                vc.brandid = 36;
            }
            else if (indexPath.row == 3){
                vc.sign = @"454fc86b22c0d4fe6f1ab9ea640cafc6";
                vc.brandid = 14;
            }
            else if (indexPath.row == 4){
                vc.sign = @"adf1a94cfd8ffd873c5bb9ee0cfe3f52";
                vc.brandid = 13;
            }
            else{
                vc.sign = @"043b9a7d3f066bb5a8fe95fdb65deb2b";
                vc.brandid = 38;
            }
            break;
        case 2:
            vc.sign = @"cdebe1802975da0e30936511607876b9";
            vc.brandid = 79;
            break;
        case 3:
            if (indexPath.row == 0) {
                vc.sign = @"e0e69cf7ffdb8ea8bdef510162d71e0e";
                vc.brandid = 1;
            }
            else if(indexPath.row == 1){
                vc.sign = @"1ab6f83e358dbefa98911d92f9333868";
                vc.brandid = 32;
            }
            else if(indexPath.row == 2){
                vc.sign = @"292e5ddd594537e930608e41a17cf57b";
                vc.brandid = 142;
            }
            else if(indexPath.row == 3){
                vc.sign = @"0ee8971f1feafbc604a7657e0fb2398f";
                vc.brandid = 169;
            }
            
            break;
        case 4:
            if (indexPath.row == 0) {
                vc.sign = @"68c66ff3ed86d1bc1451849b56f1ebc9";
                vc.brandid =42;
            }
            else if(indexPath.row == 1){
                vc.sign = @"a121fcd6156ab21e74153ba634403ebd";
                vc.brandid = 11;
            }
            else if(indexPath.row == 2){
                vc.sign = @"ff38317b0d4f2b5561d2e7bbe6b45953";
                vc.brandid = 3;
            }
            else if(indexPath.row == 3){
                vc.sign = @"f689b57bfa2594d5d165aaabb62bf0f0";
                vc.brandid = 8;
            }
            
            break;
        case 5:
            if (indexPath.row == 0) {
                vc.sign = @"ad73e022b33d99cd39ff25cbf29e45c8";
                vc.brandid = 112;
            }
            else if(indexPath.row == 1){
                vc.sign = @"886aa8b20caaaeda2e3f8b4a6e621b4d";
                vc.brandid = 108;
            }
            break;
        case 6:
            if (indexPath.row == 0) {
                vc.sign = @"990c498a49ed8ed45f24d9c0ca7c025a";
                vc.brandid = 24;
            }
            else if(indexPath.row == 1){
                vc.sign = @"febf3b29d70f50b725caf9323f7cdcf3";
                vc.brandid = 181 ;
            }
            else if(indexPath.row == 2){
                vc.sign = @"97b80c59aae6565441575d6bbd822ffd";
                vc.brandid = 86;
            }
            else if(indexPath.row == 3){
                vc.sign = @"b5ae8600669b76d06c7e6aa5ed657fb6";
                vc.brandid = 91;
            }
            else if(indexPath.row == 4){
                vc.sign = @"da9feaa8db5ca8f86165be0bfca69d0f";
                vc.brandid = 97;
            }
            else if(indexPath.row == 5){
                vc.sign = @"0edb768ddc8979dd80cb5a8b1ef2f1fe";
                vc.brandid = 87;
            }
            
            break;
            
        case 7:
            if (indexPath.row == 0) {
                vc.sign = @"841b7d40c6e56ac517ab70cba87702e1";
                vc.brandid = 83;
            }
            else if(indexPath.row == 1){
                vc.sign = @"a6525418a3b10b475733808c8a69d323";
                vc.brandid = 46;
            }
            
            break;
        case 8:
            vc.sign = @"452679e534bae9efb79ab2e1a7ce19d0";
            vc.brandid = 47 ;
            break;
        case 9:
            if (indexPath.row == 0) {
                vc.sign = @"5ef997b613eb8e326fe9e8ec0c4c7d5d";
                vc.brandid = 48;
            }
            else if(indexPath.row == 1){
                vc.sign = @"4690ed38f4ed0c2e0ba623ddf7ac94d3";
                vc.brandid = 54;
            }
            else if(indexPath.row == 2){
                vc.sign = @"f8ae0e4fa0454101bc0c2d0b7542bed0";
                vc.brandid = 52 ;
            }
            else if(indexPath.row == 3){
                vc.sign = @"84a88f679cfffa0548c80afa930e5756";
                vc.brandid = 51;
            }
            else if(indexPath.row == 4){
                vc.sign = @"dbeb699b1ee6be6b5fcd02d8fb0556e9";
                vc.brandid = 49;
            }
            break;
        case 10:
            if (indexPath.row == 0) {
                vc.sign = @"a3f2c597bd5e4656eaef595e1406ec4d";
                vc.brandid = 57 ;
            }
            else if(indexPath.row == 1){
                vc.sign = @"bdd7b06ed29869f4ef65d33cf7e7f62f";
                vc.brandid = 58;
            }
            
            break;
        case 11:
            
            vc.sign = @"0f94e955de29505b585283a6b6eec784";
            vc.brandid = 130;
            break;
        case 12:
            if (indexPath.row == 0) {
                vc.sign = @"e28246ff91988a409aec5db3cabe4b68";
                vc.brandid = 59 ;
            }
            else if(indexPath.row == 1){
                vc.sign = @"9a276d9b41e65e8b5af1271041e22312";
                vc.brandid = 60;
            }
            
            break;
        case 13:
            if (indexPath.row == 0) {
                vc.sign = @"d2b2454a50ff83b06919f9826aa074b6";
                vc.brandid = 122;
            }
            else if(indexPath.row == 1){
                vc.sign = @"cf57bf79e91053ef39de9bb52605fae7";
                vc.brandid = 26;
            }
            else if(indexPath.row == 2){
                vc.sign = @"9ba6fa7c9c4204be38ce11da8ca27e4c";
                vc.brandid = 62;
            }
            
        case 14:
            if (indexPath.row == 0) {
                vc.sign = @"7a8c4c668ba7681c5a31188d11e1fd56";
                vc.brandid = 19;
            }
            else if(indexPath.row == 1){
                vc.sign = @"e708fb51ddd3f765c244fcef018a00a9";
                vc.brandid = 103;
            }
            
            break;
        case 15:
            if (indexPath.row == 0) {
                vc.sign = @"694c843628ff893417fb7d541e4b599b";
                vc.brandid = 68;
            }
            else if(indexPath.row == 1){
                vc.sign = @"f829d7312f8c920f4d0b59fbc2fc8c5b";
                vc.brandid = 65;
            }
            else if(indexPath.row == 2){
                vc.sign = @"aa7bd4afed1d1059e69f7cb04a3bbd00";
                vc.brandid = 67;
            }
            
            break;
        case 16:
            if (indexPath.row == 0) {
                vc.sign = @"3b16a429440619d92b0d7d7f575bd2ee";
                vc.brandid = 102;
            }
            else if(indexPath.row == 1){
                vc.sign = @"e14a440a5c0f14348ff1795b9054a81c";
                vc.brandid = 70;
            }
            
            break;
        case 17:
            if (indexPath.row == 0) {
                vc.sign = @"7bed9dbc82ff96f202c4685c89bb90d4";
                vc.brandid = 12;
            }
            else if(indexPath.row == 1){
                vc.sign = @"e5bfde64d7b1ea028aedefaeaed034b8";
                vc.brandid = 71;
            }
            else if(indexPath.row == 2){
                vc.sign = @"90a6d1a9501aac90ef6848fb8a818967";
                vc.brandid = 72;
            }
            
            break;
        case 18:
            if (indexPath.row == 0) {
                vc.sign = @"a6f5bb0aa01f8cdf9606bd5582689228";
                vc.brandid = 73;
            }
            else if(indexPath.row == 1){
                vc.sign = @"4138b024b2b664c27567a72ede26dcd2";
                vc.brandid = 144;
            }
            
            break;
        case 19:
            if (indexPath.row == 0) {
                vc.sign = @"5a84647c4768c3c8704a2e5d5e6bdb8e";
                vc.brandid = 22;
            }
            else if(indexPath.row == 1){
                vc.sign = @"f26b711549075283a392d5bf8973d6df";
                vc.brandid = 94;
            }
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

//懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray ==nil) {
        
        _dataArray = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
        for (NSDictionary *dict1 in array) {
            
            MyCarGroupModel *model = [MyCarGroupModel MyCarGroupModelWithDict:dict1];
            [_dataArray addObject:model];
            
        }
        
    }
    return _dataArray;
    
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
