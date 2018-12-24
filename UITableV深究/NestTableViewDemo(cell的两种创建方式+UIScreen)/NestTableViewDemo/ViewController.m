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

static NSString * cellIdientifier = @"cellID";

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
    
    // 成功安装了 Xcode 对齐插件 XAlign (在xcode 8 之上)
    
}

#pragma mark - 创建 UI
- (void)creatUI {
    
//    [self testWithScreen];
    
    [self creatTableV];
    
    [self registerCell];
    
}

#pragma mark - 创建 tableV
- (void)creatTableV {
    
    CGFloat screen_w = [UIScreen mainScreen].bounds.size.width;
    CGFloat screen_h = [UIScreen mainScreen].bounds.size.height;
    
    /*
     TableV 有两种样式 plain and group
     plain: 按照普通样式
     group: 按照分组样式
     
     plain 普通样式 分组浮动 group 分组样式 分组跟随表格一起
     
     tableV 中数据只有行的概念，并没有列的概念，因为在手机操作系统中列是不利于操作的
     tableV 中每行数据都是一个 tableViewCell
     tableViewCell 的声明文件可以发现内部有一个 UIView 的控件 --> contentView，作为其他元素的父控件
     此外，tableViewCell 还有两个 UILabel 控件 --> textLabel + detailTextLabel、一个 UIImageV 控件 --> imageView
     其显示效果类似于QQ、微信的信息列表
     
     由于 iOS 是遵循 MVC 模式设计的，很多操作都是通过代理和外界沟通的，但是对于数据源控件除了代理还有一个数据源属性，通过它和外界进行数据交互。
     tableV 有 delegate 和 dataSource， dataSource 定义了多种数据操作方法
     
     下面通过简单的创建一个联系人列表来实践一下
     1、首先，我们需要创建一个联系人模型 Cantact (为了实践分组，不妨再创建一个联系人分组模型 ContactGroup)
     
     */
    UITableView * tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_w, screen_h) style:UITableViewStyleGrouped];
    tableV.dataSource = self;
    tableV.delegate = self;
    
//    // autolayout + estimatedRowHeight estimate n.估计
//    tableV.estimatedRowHeight = 60.0f;
//    // automatic adj.自动的 dimension adj.规格的 n.尺寸
//    tableV.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:tableV];
    _tableV = tableV;
    
    /*
     dataSource + delegate 的执行过程
     我直接打印一下不就知道了嘛 ..
     */
    
}

#pragma mark - 注册 cell
- (void)registerCell {
    
//    [_tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdientifier];
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
    
//    NSLog(@"numberOfSectionsInTableView ------------------------- ");
    // 计算分组数
    return self.contactGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"numberOfRowsInSection");
    // 计算每组的行数
    ContactGroup * group = self.contactGroupArray[section];
    return group.contactArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"cellForRowAtIndexPath");
    // 返回每行的单元格
    ContactGroup * group = self.contactGroupArray[indexPath.section];
    Contact * contact = group.contactArray[indexPath.row];
    
    /*
     UITableV 内部有一个缓存池，初始化使用 initWithStyle:reuseIdentifier:方法指定一个重用的标识，就可以将这个cell放进缓存池。
     然后在使用时根据指定的标识去缓存池中获取相应的 cell 并且修改 cell 的内容
     */
    
    // 由于此方法调用十分频繁，cell 的标识声明为静态的变量有利于性能优化
//    static NSString * cellIdientifier = @"cellID"; // 为了使用以下第二种方法，改成了全局变量
    
    /*
     dequeueReusableCellWithIdentifier:              // 委托用来获取一个已经分配的单元格，而不是分配一个新的单元格
     dequeueReusableCellWithIdentifier:forIndexPath: // 如果注册了标识符，更新的 dequeue 方法将确保正确的返回单元格并且调整其大小
     
     以上两种方法的区别:
     1、第一种方法如果没有复用 cell，那么程序可能会返回 nil，所以创建完 cell 需要做判空处理
     2、第二种方法必须和 register 方法配套使用，必须使用 registerNib or registerClass 中的一种去注册 cell，可以无需做判空处理，如果没有重用的 cell，将自动使用提供的 class 类创建 cell 并返回。即用此方法创建的 cell 一定是不为 nil 的
     */
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdientifier];
    
    // 如果缓存池没有找到则重新创建并且放到缓存池当中去
    
     // 使用第二种方式，不要判空
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdientifier];
    }
    
    cell.textLabel.text = contact.getName;
    cell.detailTextLabel.text = contact.phoneNumber;
    
    NSLog(@"cell is %@",cell);
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    // 返回每组头标题名称
    ContactGroup * group = self.contactGroupArray[section];
    return group.groupName;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {

    // 返回每组脚标题名称
    ContactGroup * group = self.contactGroupArray[section];
    return group.groupDetail;
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
 上面就是了通讯录的简单实现，但是单元格高度、分组标题高度以及尾部说明高度都需要调整，此时就需要用的代理方法 delegate
 tableV 的代理方法有很多，比如：监听单元格显示周期、监听单元格选择编辑操作、设置是否高亮显示单元格、设置行高等
 
 经过实际验证得知，先走的脚视图的高度 再走的 cell 的高度，最后走的头视图的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

//    NSLog(@"heightForHeaderInSection head head head head head");
    // 设置分组头视图内容高度
    return 33.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

//    NSLog(@"heightForFooterInSection foot foot foot foot foot");
    // 设置分组脚视图内容高度
    return 66.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"heightForRowAtIndexPath");
    // 设置每行的高度
    return 60.0f;
}


// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactGroup * group = self.contactGroupArray[indexPath.section];
    Contact * contact = group.contactArray[indexPath.row];
    
    // 创建弹出窗口
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Contact Info"
                                                                    message:@"edit phonenNumber"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"Please input phoneNumber";
        textField.text = contact.phoneNumber;
    }];
    
    __weak typeof(self) weakSelf = self;
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 修改数据模型
        __strong typeof(weakSelf) strongSelf = weakSelf;
        contact.phoneNumber = alert.textFields.firstObject.text;
        [strongSelf.tableV reloadData];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 测试 Screen
- (void)testWithScreen {
    
    /*
     UIScreen document
     
     定义 基于硬件的显示相关联的属性的对象
     
     获取可用屏幕
     mainScreen     返回表示设备屏幕的屏幕对象
     screens        返回包含连接到设备的所有屏幕的数组
     mirroredScreen 屏幕由外部显示器镜像 mirrored adj.装有镜子的 v.反映；反射
     
     获取屏幕坐标空间
     coordinateSpace      屏幕当前的坐标空间 corrdinate n.坐标 space n.空间
     fixedCoordinateSpace 屏幕的固定坐标空间 fixed adj.确定的l；固执的
     
     获取边界信息
     bounds       屏幕的边界矩形，以点为单位
     nativeBounds 物理屏幕的边界矩形，以像素为单位 native adj.本国的，与生俱来的，天赋的 n.本地人，土产
     nativeScale  物理屏幕的原生比例因子 sacle n.规模；比例 vi.衡量 vt.测量
     scale        与屏幕相关的自然比例因子
     
     访问屏幕模式
     currentMode    于屏幕关联的当前屏幕模式
     preferredMode  屏幕的首选显示模式 preferred prefer的过去分词 adj.优先的，首选的 v.偏爱
     availableModes 可以于屏幕关联的显示模式 available adj.可获得的；可选择的
     
     获取显示链接
     - displayLinkWithTarget:selector: 返回当前屏幕的显示链接对象 display n.显示 link vt.连接 target n.目标 selector n.选择器；挑选者
     maximunFramesPerSecond 屏幕能够达到的每秒最大的帧数 frames 复数 n.帧，画面 per second [计量] 每秒
     
     设置显示器的亮度
     brightness 屏幕的亮度级别 brightness n.亮度；聪明
     wantsSoftwareDimming 指示屏幕是否可以调暗低于硬件的布尔值通常能够通过软件去模拟它 software n.软件
     
     捕捉屏幕快照
     - snapshotViewAfterScreenUpdates 返回基于当前屏幕内容的快照视图 snapshot n.快照；快相 vt.给...拍快照
     
     监测屏幕录制
     captured 一个布尔值，指示是否能将屏幕的内容克隆到另一个目标 capture n.捕获；战利品 vt.俘获；捕捉
     */
    
    UIScreen * screen = [UIScreen mainScreen];
    
    /*
     我也不太清楚
     xsmax 和 8 plus 模拟器 是 3
     se 模拟器 和 6s 真机 是 2
     难道是像图片 @2x @3x 一样？
     */
    // NSLog(@"screen.nativeScale is %f",screen.nativeScale);
    // NSLog(@"screen.scale is %f",screen.scale);
    
    // NSLog(@"screen.bounds is %@",screen.bounds);
    
    /*
     libMobileGestalt MobileGestalt.c:890: MGIsDeviceOneOfType is not supported on this platform.
     MGIsDeviceOneOfType 在这个平台上不支持
     
     // 0 .. 1.0, where 1.0 is maximum brightness. Only supported by main screen.
     / / 0 . .1.0，其中1.0为最大亮度。只支持主屏幕。
     */
     NSLog(@"screen.brightness is %f",screen.brightness);
    // screen.brightness = 0.5f;
    
    /*
     isCaptured 只在 iOS 11 之后才能用
     */
    // NSLog(@"screen.capture is %d",screen.captured);
}

@end
