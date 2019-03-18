//
//  ViewController.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "MessageFrame.h"
#import "MessageCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (weak, nonatomic) IBOutlet UITextField *inputV;

@property (nonatomic, strong) NSMutableArray * messageFrames;

@end

@implementation ViewController

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - 懒加载
- (NSMutableArray *)messageFrames {
    
    if (_messageFrames == nil) {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray  * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * messagesFrameArray = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            
            // 消息模型
            Message * msg = [Message messageWithDict:dict];
            
            // 取出上一个模型数据
            MessageFrame * lastFrame = [messagesFrameArray lastObject];
            Message * lastMsg = lastFrame.msg;
            
            // 判断两个消息时间是否一致
            msg.hideTime = [msg.time isEqualToString:lastMsg.time];
            
            // frame 模型
            MessageFrame * msgFrame = [[MessageFrame alloc] init];
            msgFrame.msg = msg;
            
            // 添加模型
            [messagesFrameArray addObject:msgFrame];
            
        }
        _messageFrames = messagesFrameArray;
    }
    return _messageFrames;
}

#pragma mark - UI
- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.tableV.allowsSelection = NO;
    
    self.tableV.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 监听键盘的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // 设置文本输入框的左边视图
    self.inputV.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.inputV.leftViewMode = UITextFieldViewModeAlways;
    self.inputV.delegate = self;
}

#pragma mark - textField delegate

/**
 点击键盘右下角的 return 按钮
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"%@",textField.text);
    
    // 除了特殊的 key 一般都是 YES
    return YES;
}

/**
 当键盘改变了 frame（位置和尺寸）的时候调用
 */
- (void)keyboardWillChangeFrame:(NSNotification *)note {
    
    NSLog(@"note is %@",note.userInfo);
    
    self.view.window.backgroundColor = self.tableV.backgroundColor;
        
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的 frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的 view 需要平移的距离
    CGFloat transFrameY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
       
        // 键盘弹出
        self.view.transform = CGAffineTransformMakeTranslation(0, transFrameY);
        
    }];
    
    // 键盘消失
//    self.view.transform = CGAffineTransformMakeTranslation(0, 0);

    /*
     {
     UIKeyboardAnimationCurveUserInfoKey = 7; 动画的执行结构(速度)
     UIKeyboardAnimationDurationUserInfoKey = "0.25"; 键盘弹出动画时间
     UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 260}}";
     
     UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 559}";
     UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 537}";
     
     UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 260}}"; 键盘刚出来的那一刻的 frame
     UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 407}, {375, 260}}";  键盘隐藏完毕后的 frame
     
     UIKeyboardIsLocalUserInfoKey = 1;
     }
     */
    
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageFrame * frame = self.messageFrames[indexPath.row];
    return frame.cellHeight;
    
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.messageFrames.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建 cell 
    MessageCell * cell = [MessageCell cellWithTableView:tableView];
    
    // 2.模型赋值
    MessageFrame * frame = self.messageFrames[indexPath.row];
    cell.msgFrame = frame;
    
    // 3.返回 cell
    return cell;
    
}

#pragma mark - scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    NSLog(@"scrollViewWillBeginDragging");
    [self.view endEditing:NO];
    
}

@end
