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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (nonatomic, strong) NSMutableArray * messageFrames;

@end

@implementation ViewController

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

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 不允许选中
    self.tableV.allowsSelection = NO;
    
    // 设置背景颜色 RGB
    self.tableV.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
    
    // 去除分割线
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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

@end
