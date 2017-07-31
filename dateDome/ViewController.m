//
//  ViewController.m
//  dateDome
//
//  Created by yg on 2017/7/31.
//  Copyright © 2017年 TBB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,strong)UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@end

@implementation ViewController
-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:0];
        [_btn setTitle:@"获取当前时间" forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor blueColor]];
    }
    return  _btn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn addTarget:self action:@selector(getDate:) forControlEvents:UIControlEventTouchUpInside];
    _btn.frame = CGRectMake(50, 50, 200, 45);
    [self.view addSubview:_btn];
}
-(void)getDate:(UIButton *)btn{
    //创建当前日期对象,世界标准时间([NSDate date]默认获得的是0时区的时间)
    NSDate *date = [NSDate date];
    //返回多少秒后的时间
//    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSTimeInterval sce = date.timeIntervalSince1970;// 返回1970-1-1开始走过的毫秒数
    self.labelDate.text = [self stringFromDate:date];
    NSLog(@"sce %.2f",sce);
    
    // 跟其他时间进行对比
//    NSDate *date2 = [NSDate date];
//    // 返回比较早的那个时间
//    [date earlierDate:date2];
//    // 返回比较晚的那个时间
//    [date laterDate:date2];
//    [date1 timeIntervalSinceDate date2];
    NSDate *dateStr =  [self dateFromString:@"2017-08-01 02:00:00"];
    NSLog(@"dateStr:%@",dateStr);
}
//NSDate转为NSString
-(NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];// HH是24进制，hh是12进制
    return [formatter stringFromDate:date];
}
//NSString转为NSDate
-(NSDate *)dateFromString:(NSString *)string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [formatter dateFromString:string];
    return date;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
