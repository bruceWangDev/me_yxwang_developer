//
//  ViewController.m
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/21.
//  Copyright © 2018 brucewang. All rights reserved.
//  版权 copyright

#import "ViewController.h"
#import "Contact.h"
#import "ContactGroup.h"
#import "ContactCell.h"

#define cellIdientifier @"ContactCell"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

/**
 表格视图
 */
@property (nonatomic, weak) UITableView * tableV;

/**
 联系人数组
 */
@property (nonatomic, strong) NSMutableArray * contactGroupArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initData];
    
    [self creatUI];
    
}

#pragma mark - 初始化数据
- (void)initData {
    
    _contactGroupArray = [[NSMutableArray alloc] init];
    
    Contact * s_c1 = [[Contact alloc] initWithFirstName:@"波特" andLastName:@"哈利" andPhoneNumber:@"13811111111"];
    Contact * s_c2 = [[Contact alloc] initWithFirstName:@"格兰杰" andLastName:@"赫敏" andPhoneNumber:@"13822222222"];
    Contact * s_c3 = [[Contact alloc] initWithFirstName:@"韦斯莱" andLastName:@"罗恩" andPhoneNumber:@"13833333333"];
    ContactGroup * group1 = [[ContactGroup alloc] initWithGroupName:@"黄金三人组" andGroupDetail:@"no description" andContactArray:[NSMutableArray arrayWithObjects:s_c1, s_c2, s_c3, nil]];
    
    Contact * t_c1 = [[Contact alloc] initWithFirstName:@"邓布利多" andLastName:@"阿不思" andPhoneNumber:@"13911111111"];
    Contact * t_c2 = [[Contact alloc] initWithFirstName:@"斯内普" andLastName:@"西弗勒斯" andPhoneNumber:@"13922222222"];
    Contact * t_c3 = [[Contact alloc] initWithFirstName:@"麦格" andLastName:@"米勒娃" andPhoneNumber:@"13933333333"];
    Contact * t_c4 = [[Contact alloc] initWithFirstName:@"海格" andLastName:@"鲁伯" andPhoneNumber:@"13944444444"];
    ContactGroup * group2 = [[ContactGroup alloc] initWithGroupName:@"霍格沃兹魔法教授" andGroupDetail:@"no description" andContactArray:[NSMutableArray arrayWithObjects:t_c1, t_c2, t_c3, t_c4, nil]];
    
    Contact * h_c1 = [[Contact alloc] initWithFirstName:@"格兰芬多" andLastName:@"戈德里克" andPhoneNumber:@"18811111111"];
    Contact * h_c2 = [[Contact alloc] initWithFirstName:@"斯莱特林" andLastName:@"萨拉查" andPhoneNumber:@"18822222222"];
    Contact * h_c3 = [[Contact alloc] initWithFirstName:@"拉文克劳" andLastName:@"罗伊纳" andPhoneNumber:@"18833333333"];
    Contact * h_c4 = [[Contact alloc] initWithFirstName:@"赫奇帕奇" andLastName:@"赫尔加" andPhoneNumber:@"18844444444"];
    Contact * h_c5 = [[Contact alloc] initWithFirstName:@"迪佩特" andLastName:@"阿芒多" andPhoneNumber:@"18855555555"];
    ContactGroup * group3 = [[ContactGroup alloc] initWithGroupName:@"霍格沃兹魔法教授" andGroupDetail:@"no description" andContactArray:[NSMutableArray arrayWithObjects:h_c1, h_c2, h_c3, h_c4, h_c5, nil]];
    
    [_contactGroupArray addObject:group1];
    [_contactGroupArray addObject:group2];
    [_contactGroupArray addObject:group3];
    
}

#pragma mark - 创建 UI
- (void)creatUI {
    
    [self creatTableV];
    
    [self registerCell];
    
}

#pragma mark - 创建 tableV
- (void)creatTableV {
    
    CGFloat screen_w = [UIScreen mainScreen].bounds.size.width;
    CGFloat screen_h = [UIScreen mainScreen].bounds.size.height;
    
    
    UITableView * tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_w, screen_h) style:UITableViewStyleGrouped];
    tableV.dataSource = self;
    tableV.delegate = self;
    
    // autolayout + estimatedRowHeight estimate n.估计
    tableV.estimatedRowHeight = 60.0f;
    // automatic adj.自动的 dimension adj.规格的 n.尺寸
    tableV.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:tableV];
    _tableV = tableV; // 你TMD 我真的佩服我自己的粗心大意阿
}

#pragma mark - 注册 cell
- (void)registerCell {
    
    [_tableV registerNib:[UINib nibWithNibName:@"ContactCell" bundle:nil] forCellReuseIdentifier:cellIdientifier];
}

#pragma mark - tableV dataSource
/*
 请注意以下几个重点方法的执行
 
   计算分组数
      🔽
  计算每组的行数
      🔽
   生成分组索引
      🔽
 生成单元格(依次生成所有组的所有单元格)
 
 注意: 值得指出的是 生成单元格的方法并不是一次全部调用，而只会产生当前显示在界面上的单元格，当用户滚动操作时再显示其他单元格 这点已经验证
 
 经过断点调试，我发现 numberOfSectionInTableV + numberOfRowsInSection 走了 3 次
 cellForRowAtIndexPath 验证了上面的说法，调用的次数和展示在界面上的单元格数量相同
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView ------------------------- ");
    // 计算分组数
    return self.contactGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection");
    // 计算每组的行数
    ContactGroup * group = self.contactGroupArray[section];
    return group.contactArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath");
    // 返回每行的单元格
    ContactGroup * group = self.contactGroupArray[indexPath.section];
    Contact * contact = group.contactArray[indexPath.row];
    
    ContactCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdientifier forIndexPath:indexPath];

//    if (!cell) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContactCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
    cell.contact = contact;
    
//    NSLog(@"cell is %@",cell);
    return cell;
}

/*
 大家在使用 iphone 通讯录的时候会发现右侧可以按字母检索，使用起来很方便，其实这个功能使用 tableV 很简单，只需要实现数据源协议的一个方法
 构建一个分组标题的数组即可实现。
 数组元素的内容和组标题的内容未必完全一致，tableV 是按照数组元素的索引和每组数据索引顺序来定位而不是按内容查找
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    // 返回每组标题的索引
    NSMutableArray * indexs = [[NSMutableArray alloc] init];
    for (ContactGroup * group in self.contactGroupArray) {
        [indexs addObject:group.groupName];
    }
    return indexs;
}

#pragma mark - tableV delegate
/*
 UITableV 的高度设置的方式大概是两种
 第一种: row
    (1) 针对所有的cell具有固定高度的情况
        self.tableV.rowHeight = 66.0f;
    (2) 另一种就是实现 tableV 的 delegate ，对每一个 cell 进行单独设置
 
 第二种: esimatedRowHeight
 
    我们知道，UITableV 是个 ScrollV，就像平时使用 scrollV 一样，加载时指定 ContentSize 后它才能根据自己的 bounds，contentInset，contentOffest 等
 属性决定是否可以滑动以及滚动条的长度。而 UITableV 一开始并不知道自己被填充了多少内容，于是询问 dataSource 个数 和 创建 cell，
 同时询问 delegate 这些 cell 应该显示的高度，这就造成了它在加载的时候浪费了多余的计算在屏幕外边的 cell 上
 
 种类不同的 cell ，我们依然可以使用简单的 esitmatedRowHeight 属性赋值，只要整体估算值接近就可以，比如大概有一半 cell 是 44，一半 cell 是 88，
 那就可以估算一个 66，就基本符合预期
 
 KEY POINT 关键点
  cell 内部的 constraints(约束) 一定要有一条从 cell 顶部到底部的一条可联通线
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
////    NSLog(@"heightForRowAtIndexPath");
//    // 设置每行的高度
//    return 60.0f;
//}


// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactGroup * group = self.contactGroupArray[indexPath.section];
    Contact * contact = group.contactArray[indexPath.row];
    
    // 创建弹出窗口
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Contact Info"
                                                                    message:@"edit phonenNumber"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = contact.fristName;
    }];
    
    __weak typeof(self) weakSelf = self;
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 修改数据模型
        __strong typeof(weakSelf) strongSelf = weakSelf;
        contact.fristName = alert.textFields.firstObject.text;
        [strongSelf.tableV reloadData];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
