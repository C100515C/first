//
//  ViewController.m
//  CCTest
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "sqlite3.h"
#import "CustomView.h"

#import "CustomAlertView.h"

#import "UILabel+CCTapLabel.h"
#import <objc/runtime.h>
#import "HeartView.h"
#import "NavTest.h"
#import "ShuLabel.h"

static NSString const* P_Name_Changed = @"P_Name_Changed";

@interface ViewController ()<CustomAlertViewProtol,TapLabelProtocol>
@property (weak, nonatomic) IBOutlet UILabel *testll;

- (IBAction)clickedAction:(id)sender;

@end

@implementation ViewController
@synthesize person;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //kvo
    /*
    person = [[Person alloc] init];
    person.name = @"ll";
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:(__bridge void *)(P_Name_Changed)];
    
    self.test = @"ddd";
    [self addObserver:self forKeyPath:@"test" options:NSKeyValueObservingOptionNew context:nil];
    */
    
    /*
    //归档  解档
    Person *p1 = [[Person alloc]initWith:@"jim" and:@"654789" and:@"3"];
    Person *p2 = [[Person alloc]initWith:@"tom" and:@"5464" and:@"4"];
    //归档
    NSMutableData *aD_data = [[NSMutableData alloc] init];
    NSKeyedArchiver *achiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:aD_data];
    [achiver encodeObject:p1 forKey:@"p1"];
    [achiver encodeObject:p2 forKey:@"p2"];
    [achiver finishEncoding];
    //存数据
    [aD_data writeToFile:[self filePathWith:@"texts"] atomically:YES];
    //解当
    NSMutableData *data1 = [NSMutableData dataWithContentsOfFile:[self filePathWith:@"texts"]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data1];
    Person *p3  = [unarchiver decodeObjectForKey:@"p1"];
    Person *p4 =  [unarchiver decodeObjectForKey:@"p2"];
    NSLog(@"%@==%@",p3.name,p4.name);*/
    
    //数据库
//    [self openSulite];
 /*
    CustomView *view = [[CustomView alloc] init];
    [self.view addSubview:view];
    view.frame = CGRectMake(100, 100, 80, 80);
    [view startAllAnimations:view];
    */
    
//    CustomAlertView *al = [[CustomAlertView alloc] initWithFrame:self.view.frame andTitle:@"s" andDes:@"dd" andDelegate:self];
//    
//    [self.view addSubview:al];
    
    
    self.testll.backgroundColor = [UIColor blueColor];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"这是一个 测试"];//空出图片位置 一个图片站一个位置
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(5,2)];

//    NSString *imagename = @"1.png";
//    NSFileWrapper *wrapper = [[NSFileWrapper alloc] initRegularFileWithContents:UIImagePNGRepresentation([UIImage imageNamed:imagename])];
//    wrapper.filename = imagename;
//    wrapper.preferredFilename = imagename;
    
    NSTextAttachment *attachment=[[NSTextAttachment alloc] initWithData:nil ofType:nil];
    UIImage *img=[UIImage imageNamed:@"1.png"];
    attachment.image=img;
    attachment.bounds=CGRectMake(0, -5, 80 , 80);
    NSAttributedString *text=[NSAttributedString attributedStringWithAttachment:attachment];
    
    [attStr insertAttributedString:text atIndex:4];
    
    self.testll.attributedText = attStr;
    [self.testll layoutIfNeeded];
//
//    self.testll.tapLabelDelelgate = self;
//    
//    [NSThread detachNewThreadSelector: @selector(newThreadProcess)
    
//                             toTarget: self
    
//                           withObject: nil];
    
    
    
    
//    Class myclass = [Person createClass];
//    id obj = [[myclass alloc] init];
//    NSString *str = @"asdb";
//    //    //给刚刚添加的变量赋值
//    //    //    object_setInstanceVariable(myobj, "itest", (void *)&str);在ARC下不允许使用
//    [obj setValue:str forKey:@"itest"];
//    //    //调用myclasstest方法，也就是给myobj这个接受者发送myclasstest这个消息
//    [obj myclasstest:10];
    
//    HeartView *view = [[HeartView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) andHeartCount:5];
//    [self.view addSubview:view];
    
    ShuLabel *testLabel = [[ShuLabel alloc] initWithFrame:CGRectMake(0, 200, 60, 160)];
    testLabel.text = @"Hello, DPLabel到高三感觉哦是否能够桑哦警方说那感觉哦放那感觉哦凡是公交啊烦恼是公交那风景哦给那家哦给弄几盎家噢安北京哦安静";
//    testLabel.verticalAlignment = 
    testLabel.backgroundColor = [UIColor whiteColor];
    testLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:testLabel];  }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NavTest *vc = [[NavTest alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:vc
//animated:YES completion:^{
//    
//}];
    
}

- (void)createClass
{
    Class MyClass = objc_allocateClassPair([UIViewController class], "myclass", 0);
    //添加一个NSString的变量，第四个参数是对其方式，第五个参数是参数类型
    if (class_addIvar(MyClass, "itest", sizeof(NSString *), 0, "@")) {
        NSLog(@"add ivar success");
    }
    class_addIvar(MyClass, "irtest", sizeof(NSNumber *), 0, "@");
    //myclasstest是已经实现的函数，"v@:"这种写法见参数类型连接
    class_addMethod(MyClass, @selector(myclasstest:), (IMP)myclasstest, "v@:");
    //注册这个类到runtime系统中就可以使用他了
    objc_registerClassPair(MyClass);
    //生成了一个实例化对象
    id myobj = [[MyClass alloc] init];
    NSString *str = @"asdb";
    //给刚刚添加的变量赋值
    //    object_setInstanceVariable(myobj, "itest", (void *)&str);在ARC下不允许使用
    [myobj setValue:str forKey:@"itest"];
//    [myobj setValue:@"ca" forKey:@"test"];
    [myobj setValue:[NSNumber numberWithInt:3] forKey:@"irtest"];
    //调用myclasstest方法，也就是给myobj这个接受者发送myclasstest这个消息
    [myobj myclasstest:10];
    
}
//这个方法实际上没有被调用,但是必须实现否则不会调用下面的方法
- (void)myclasstest:(int)a
{
    
}
//调用的是这个方法
static void myclasstest(id self, SEL _cmd, int a) //self和_cmd是必须的，在之后可以随意添加其他参数
{
    
    Ivar v = class_getInstanceVariable([self class], "itest");
    //返回名为itest的ivar的变量的值
    Ivar nn = class_getInstanceVariable([self class], "irtest");
    id o = object_getIvar(self, v);
    id n = object_getIvar(self, nn);
    //成功打印出结果
    NSLog(@"%@--%@", o,n);
//    NSLog(@"%@-", o);

    NSLog(@"int a is %d", a);
}


-(void)tapActionWith:(UILabel *)currentLabel{
    NSLog(@"%@",currentLabel.text);
}

-(void)btnClickActionWitnTag:(NSInteger)btnName andTextField:(NSString *)content{
    
    NSLog(@"%ld--%@",(long)btnName,content);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{

    if ([keyPath isEqualToString: @"name"]) {
        Person *p = (Person*)object;
        NSLog(@"name after change = %@,%@,%@",[change valueForKey:NSKeyValueChangeNewKey],p.name,(__bridge NSString*)context);
        
    }else{
        NSLog(@"test after change = %@,%@",[change valueForKey:NSKeyValueChangeNewKey],(__bridge NSString*)context);
    }
}

- (IBAction)clickedAction:(id)sender {
    NSLog(@"name before change = %@",[person valueForKey:@"name"]);
//    [person setValue:@"cc"forKey:@"name"];
    person.name = @"dddd";
    
//    NSLog(@"test before change = %@",[self valueForKey:@"test"]);
//    [self setValue:@"kkk"forKey:@"test"];
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"name" context:(__bridge void *)(P_Name_Changed)];
    [self removeObserver:self forKeyPath:@"test" context:nil];
}

//获取文件路径
-(NSString *)filePathWith:(NSString*)filename
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [docPath stringByAppendingPathComponent:filename];
    
    //  NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/texts"]; //两种方法都可以
    
    
    return path;
}
//打开数据库
-(BOOL)openSulite{
    NSString *sqlitePath = [self filePathWith:@"mysqlite"];
    sqlite3 *database;
    if (sqlite3_open([sqlitePath UTF8String], &database)==SQLITE_OK) {
        NSLog(@"sqlite open ok");
        
        [self createSqliteWith:database];
        
        return YES;
    }else{
        NSLog(@"sqlite open fail");
        return NO;
    }
    
}

-(void)createSqliteWith:(sqlite3 *)database{
    char *error;
    const char *createSqlite = "CREATE TABLE IF NOT EXISTS FIELDS (TAG INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    
    if (sqlite3_exec(database, createSqlite, NULL, NULL, &error)==SQLITE_OK) {
        NSLog(@"create table ok");
    }else{
        NSLog(@"error:%s",error);
        sqlite3_free(error);
    }
    
    //插入
    const char *insertSqlite = "INSERT OR REPLACE INTO FIELDS (TAG, FIELD_DATA) VALUES (?, ?);";
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, insertSqlite, -1, &stmt, nil)==SQLITE_OK) {
        
        sqlite3_bind_int(stmt, 1, 1);
        sqlite3_bind_text(stmt, 2, [@"gg" UTF8String], -1, NULL);
        NSLog(@"intsert ok");
    }else{
        NSLog(@"insert:%s",error);
        sqlite3_free(error);
    }
    
    //查询
    NSString *query = @"SELECT TAG, FIELD_DATA FROM FIELDS ORDER BY TAG";
//    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        //依次读取数据库表格FIELDS中每行的内容，并显示在对应的TextField
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //获得数据
            int tag = sqlite3_column_int(stmt, 0);
            char *rowData = (char *)sqlite3_column_text(stmt, 1);
            NSLog(@"tag = %d --- ---  content = %@", tag,[[NSString alloc] initWithUTF8String:rowData]);
        }
        sqlite3_finalize(stmt);
    }
    
    //关闭数据库：
//    sqlite3_close(database);
}

-(void)testGCD{
    
    dispatch_queue_t q1 = dispatch_queue_create("test1", DISPATCH_QUEUE_SERIAL);//串行队列
//    dispatch_queue_t q2 = dispatch_queue_create("test2", DISPATCH_QUEUE_CONCURRENT);//并行队列
//    
//    dispatch_queue_t mq = dispatch_get_main_queue();//主队列
//    dispatch_queue_t gq = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//全局队列
    
    dispatch_async(q1, ^{
        
    });// 异步操作
    
    dispatch_sync(q1, ^{
        
    });//同步操作
    
}

+(instancetype)share{
    static dispatch_once_t once ;
    static ViewController *v;

    dispatch_once(&once, ^{
        v = [[ViewController alloc] init];
    });
    
    return v;
}

//runloop
BOOL threadProcess1Finished =NO;

-(void)threadProce1{
    
    NSLog(@"Enter threadProce1.");
    
    for (int i=0; i<5;i++) {
        
        NSLog(@"InthreadProce1 count = %d.", i);
        
        sleep(1);
        
    }
    
    threadProcess1Finished =YES;
    
    NSLog(@"Exit threadProce1.");
    
}



BOOL threadProcess2Finished =NO;

-(void)threadProce2{
    
    NSLog(@"Enter threadProce2.");
    
    for (int i=0; i<5;i++) {
        
        NSLog(@"InthreadProce2 count = %d.", i);
        
        sleep(1);
        
    }
    
    threadProcess2Finished =YES;
    
    NSLog(@"Exit threadProce2.");
    
}



- (IBAction)buttonNormalThreadTestPressed:(UIButton *)sender {
    
    
    NSLog(@"EnterbuttonNormalThreadTestPressed");
    
    
    
    threadProcess1Finished =NO;
    
    NSLog(@"Start a new thread.");
    
    [NSThread detachNewThreadSelector: @selector(threadProce1)
     
                            toTarget: self
     
                          withObject: nil];
    
    
    
    // 通常等待线程处理完后再继续操作的代码如下面的形式。
    
    // 在等待线程threadProce1结束之前，调用buttonTestPressed，界面没有响应，直到threadProce1运行完，才打印buttonTestPressed里面的日志。
    
    while (!threadProcess1Finished) {
        
        [NSThread sleepForTimeInterval: 0.5];
        
    }
    
    NSLog(@"ExitbuttonNormalThreadTestPressed");
    
}



- (IBAction)buttonRunloopPressed:(id)sender {
    
    NSLog(@"Enter buttonRunloopPressed");
    
    threadProcess2Finished =NO;
    
    NSLog(@"Start a new thread.");
    
    [NSThread detachNewThreadSelector: @selector(threadProce2)
     
                            toTarget: self
     
                          withObject: nil];
    
    
    
    // 使用runloop，情况就不一样了。
    
    // 在等待线程threadProce2结束之前，调用buttonTestPressed，界面立马响应，并打印buttonTestPressed里面的日志。
    
    // 这就是runloop的神奇所在
    
    while (!threadProcess2Finished) {
        
        NSLog(@"Begin runloop");
        
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
         
                                beforeDate: [NSDate distantFuture]];
        
        NSLog(@"End runloop.");
        
    }
    
    NSLog(@"Exit buttonRunloopPressed");
    
}



- (IBAction)buttonTestPressed:(id)sender{
    
    NSLog(@"Enter buttonTestPressed");
    
    NSLog(@"Exit buttonTestPressed");
    
}

//runloop 事例

- (void)newThreadProcess

{
    
    @autoreleasepool {
        
        ////获得当前thread的Runloop
        
        NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
        
        
        
        //设置Run loop observer的运行环境
        
        CFRunLoopObserverContext context = {0,(__bridge void *)(self),NULL,NULL,NULL};
        
        
        
        //创建Run loop observer对象
        
        //第一个参数用于分配observer对象的内存
        
        //第二个参数用以设置observer所要关注的事件，详见回调函数myRunLoopObserver中注释
        
        //第三个参数用于标识该observer是在第一次进入runloop时执行还是每次进入run loop处理时均执行
        
        //第四个参数用于设置该observer的优先级
        
        //第五个参数用于设置该observer的回调函数
        
        //第六个参数用于设置该observer的运行环境
        
        CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);
        
        if(observer)
            
        {
            
            //将Cocoa的NSRunLoop类型转换成CoreFoundation的CFRunLoopRef类型
            
            CFRunLoopRef cfRunLoop = [myRunLoop getCFRunLoop];
            
            
            
            //将新建的observer加入到当前thread的runloop
            
            CFRunLoopAddObserver(cfRunLoop, observer, kCFRunLoopDefaultMode);
            
        }
        
        
        
        //
        
        [NSTimer scheduledTimerWithTimeInterval: 1
         
                                        target: self
         
                                      selector:@selector(timerProcess)
         
                                      userInfo: nil
         
                                       repeats: YES];
        
        NSInteger loopCount = 2;
        
        do{
            
            //启动当前thread的loop直到所指定的时间到达，在loop运行时，runloop会处理所有来自与该run loop联系的inputsource的数据
            
            //对于本例与当前run loop联系的inputsource只有一个Timer类型的source。
            
            //该Timer每隔1秒发送触发事件给runloop，run loop检测到该事件时会调用相应的处理方法。
            
            
            
            //由于在run loop添加了observer且设置observer对所有的runloop行为都感兴趣。
            
            //当调用runUnitDate方法时，observer检测到runloop启动并进入循环，observer会调用其回调函数，第二个参数所传递的行为是kCFRunLoopEntry。
            
            //observer检测到runloop的其它行为并调用回调函数的操作与上面的描述相类似。
            
            [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
            
            //当run loop的运行时间到达时，会退出当前的runloop。observer同样会检测到runloop的退出行为并调用其回调函数，第二个参数所传递的行为是kCFRunLoopExit。
            
            loopCount--;
            
        }while (loopCount);
        
    }
    
}



void myRunLoopObserver(CFRunLoopObserverRef observer,CFRunLoopActivity activity,void *info)

{
    
    switch (activity) {
            
            //The entrance of the run loop, beforeentering the event processing loop.
            
            //This activity occurs once for each callto CFRunLoopRun and CFRunLoopRunInMode
            
        case kCFRunLoopEntry:
            
            NSLog(@"run loop entry");
            
            break;
            
            //Inside the event processing loop beforeany timers are processed
            
        case kCFRunLoopBeforeTimers:
            
            NSLog(@"run loop before timers");
            
            break;
            
            //Inside the event processing loop beforeany sources are processed
            
        case kCFRunLoopBeforeSources:
            
            NSLog(@"run loop before sources");
            
            break;
            
            //Inside the event processing loop beforethe run loop sleeps, waiting for a source or timer to fire.
            
            //This activity does not occur ifCFRunLoopRunInMode is called with a timeout of 0 seconds.
            
            //It also does not occur in a particulariteration of the event processing loop if a version 0 source fires
            
        case kCFRunLoopBeforeWaiting:
            
            NSLog(@"run loop before waiting");
            
            break;
            
            //Inside the event processing loop afterthe run loop wakes up, but before processing the event that woke it up.
            
            //This activity occurs only if the run loopdid in fact go to sleep during the current loop
            
        case kCFRunLoopAfterWaiting:
            
            NSLog(@"run loop after waiting"); 
            
            break; 
            
            //The exit of the run loop, after exitingthe event processing loop.  
            
            //This activity occurs once for each callto CFRunLoopRun and CFRunLoopRunInMode 
            
        case kCFRunLoopExit: 
            
            NSLog(@"run loop exit"); 
            
            break; 
            
            /*
             
             A combination of all the precedingstages
             
             case kCFRunLoopAllActivities:
             
             break;
             
             */ 
            
        default: 
            
            break; 
            
    } 
    
}





- (void)timerProcess{
    
    
    for (int i=0; i<5; i++) {       
        
        NSLog(@"In timerProcess count = %d.", i);
        
        sleep(1);
        
    }
    
}

@end
