//
//  YLTuorialFirstViewController.m
//  YLBasicTutorial
//
//  Created by 张晓岚 on 16/11/16.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "YLTuorialFirstViewController.h"

NSString *const textFrameChangedNotification = @"textFrameChangedNotification";

@interface YLTuorialFirstViewController ()<UITextFieldDelegate> {
    
    NSTimer *m_timer;
}

@property (weak, nonatomic) IBOutlet UITextField *m_textField;


@end

@implementation YLTuorialFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    [self.m_textField removeObserver:self forKeyPath:@"frame"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:textFrameChangedNotification object:nil];
    
}

#pragma mark - NSNotification KVO delegate
// KVO NSNotifiction delegate 是同步吗？   都是同步的, KVO Notification都在同一个线程中 delegate直接调用肯定是同步

- (void)setupMTextField {
    
    self.view.multipleTouchEnabled = YES;
    self.m_textField.borderStyle = UITextBorderStyleRoundedRect;
    self.m_textField.delegate = self;
    
    // add KVO
    [self.m_textField addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeTextViewFrame) name:textFrameChangedNotification object:nil];
    
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeTextViewFrame) userInfo:nil repeats:YES];
}

- (void)didChangeTextViewFrame {
    
    //@同步测试：NSLog(@"didChangeTextViewFrame, text.frame = %@", NSStringFromCGRect(m_textField.frame));
    
    //@异步测试如下：
    dispatch_queue_t globeQueen = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globeQueen, ^{
        sleep(3.0);
        NSLog(@"didChangeTextViewFrame, text.frame = %@", NSStringFromCGRect(self.m_textField.frame));
    });
    
    
}

- (void)changeTextViewFrame {
    
    CGRect frame = self.m_textField.frame;
    frame.size.height += 0.5;
    frame.size.width += 0.5;
    self.m_textField.frame = frame;
    [[NSNotificationCenter defaultCenter] postNotificationName:textFrameChangedNotification object:nil];
    NSLog(@"frame = %@", NSStringFromCGRect(frame));
    if (frame.size.width > 400) {
        [m_timer invalidate];
        m_timer = nil;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([object isKindOfClass:[self.m_textField class]]) {
        if ([keyPath isEqualToString:@"frame"]) {
            NSLog(@"change=%@", change);
        }
    }
}


#pragma mark - 四种存储方式

- (void)saveData {
    
    NSArray *array = @[].copy;
    
    //1, NSKeyedArchiver  被存储的数据需要遵循NSCoding协议
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [path stringByAppendingPathComponent:@"saveData"];
    [NSKeyedArchiver archiveRootObject:array toFile:fileName];
    array = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    //2, NSUserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:array forKey:@"saveData"];
    [userDefaults objectForKey:@"saveData"];
    
    //3, Write
    NSString *writeFileName = [path stringByAppendingPathComponent:@"saveData.plist"];
    [[NSArray arrayWithObjects:array, nil] writeToFile:writeFileName atomically:NO];
    if ([[NSFileManager defaultManager] fileExistsAtPath:writeFileName]) {
        array = [NSMutableArray arrayWithContentsOfFile:writeFileName];
    } else {
        array = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"saveData" ofType:@"plist"]];
    }
    
    //4, SQLite
    
    // 比较本地四种存储方式的效率：  sqlite > userdefaults > keyedArchiver > write
    // a,用户习惯数据存储到userdefaults
    // b,经常查询的数据存储sqlite
    // c,归档数据存储keyedArchiver
    
    
    //keyChain存储：对于大量需要加密信息的场景，可以把秘钥存储到keyChain中，而被加密的则用以上方式存储
    
    //iOS文件目录：
    //1>.app :  ① 存放内容:该目录包含了应用程序本身的数据，包括资源文件和可执行文件等。程序启动以后，会根据需要从该目录中动态加载代码或资源到内存，这里用到了lazy loading的思想。
    //② 整个目录是只读的 为了防止被篡改，应用在安装的时候会将该目录签名。非越狱情况下，该目录中内容是无法更改的；在越狱设备上如果更改了目录内容，对应的签名就会被改变，这种情况下苹果官网描述的后果是应用程序将无法启动。
    //③是否会被iTunes同步:否   -----应用程序本身的文件.不可窜改
    
    //2>Documents:  ① 存放内容:我们可以将应用程序的数据文件保存在该目录下。不过这些数据类型仅限于不可再生的数据。可再生的数据文件应该存放在Library/Cache目录下。
    // ② 是否会被iTunes同步:是    ---不可再生
    
    //3> Libirary -> Libirary/Cache: ① 存放内容:主要是缓存文件，用户使用过程中缓存都可以保存在这个目录中。那么这个目录就用于保存那些可再生的文件，比如网络请求的数据。鉴于此,应用程序通常还需要负责删除这些文件。
    //② 是否会被iTunes同步:否。-----缓存文件
    // Libirary -> Libirary/Preference:  ① 存放内容:应用程序的偏好设置文件。我们使用NSUserDefaults写的设置数据都会保存到该目录下的一个plist文件中.
    //② 是否会被iTunes同步:是   ---偏好设置
    
    //4>tmp : ① 存放内容:各种临时文件，保存应用再次启动时不需要的文件。而且，当应用不再需要这些文件时应该主动将其删除，因为该目录下的东西随时有可能被系统清理掉，目前已知的一种可能清理的原因是系统磁盘存储空间不足的时候。
    //② 是否会被iTunes同步:否    ---各种临时文件,定期删除.
}


#pragma mark - 静态变量是什么时候分配的

- (void)howStatic {
    
    
}






@end
