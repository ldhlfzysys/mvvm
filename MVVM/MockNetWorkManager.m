//
//  MockNetWorkManager.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MockNetWorkManager.h"

@implementation MockNetWorkManager
+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    static MockNetWorkManager *single;
    dispatch_once(&onceToken, ^{
        single = [[MockNetWorkManager alloc]init];
    });
    return single;
}

- (instancetype)init
{
    if (self == [super init]) {
        
    }
    return self;
}

+ (NSArray *)loadData
{
    NSArray *datas = [[NSArray alloc]initWithObjects:
  @{@"name":@"杂志",@"content":@"这次事件可以说是香港深层次矛盾的交集  和总爆发。它应该迫使香港社会转危为机，正视当今和未来的严峻挑战。要想解决香港的深层次矛盾，给香港  青年人找"},
  @{@"name":@"房地产",@"content":@"【厦门大学房地产EMBA暨“地产精英500”工程3期（北京班）招生】鸟欲高飞先振  翅，人求财富先读书。作为财经教育三强之一的厦门大学，将继续整合中国一流师资、海外名校教授、相关部  委领导及房地产行业著名企业家为房地产及关联行业培养高素质人才。有意者可发信至dongfan67@126.com或通  过微博私信询问"},
  @{@"name":@"金箍棒",@"content":@"出庭为南周世奢会案作证。"},
  @{@"name":@"品牌",@"content":@"成立于1856年的标志性英国奢侈品牌"},
  @{@"name":@"记着",@"content":@"媒体评论,编辑,主持人,媒体营销,出品人,制片人,DJ,记者"},
  @{@"name":@"互联网",@"content":@"CCI是中国互联网监测研究权威机构&数据平台，独立第三方，互联网、互  动营销之测量、分析、优化服务提供者。以Panel软件、代码嵌入、海量数据挖掘、语义信息处理等多种领先技  术手段为基础，进行网站、用户、广告、品牌的实时监测、动态测量。"}, nil];
    return datas;
}

+ (NSArray *)loadMoreData
{
    NSArray *datas = [[NSArray alloc]initWithObjects:
  @{@"name":@"热门笑话",@"content":@"主人，你要相信我对你是真爱~[哈哈][哈哈]#热门笑话榜"},
  @{@"name":@"有缘人",@"content":@"感觉快乐就忙东忙西，感觉累了就放空自己，周末晚上一杯红酒配电影，舒服窝在  沙发里。意大利原瓶进口葡萄酒，首次线上销售，全网最低价，只待有缘人。9月28日-29日，全场8折包邮，下  单备注木粉，即送海马刀。购满300元另有惊喜礼品。店铺地址电脑端http://t.cn/R7qhcsZ手机端   http://t.cn/R7GFONp"},
  @{@"name":@"奥迪A4",@"content":@"近日，国外媒体率先曝光了新一代奥迪A4车型的测试谍照。据  悉，新一代奥迪A4车型将在明年开始正式发售。从已经曝光的测试谍照上我们可以发现，新一代奥迪A4车型将  采用奥迪公司最新的设计理念，造型别致且技术先进的LED头灯将与霸气的中网完美的结合，使得该车型更加动  感"},
  @{@"name":@"图库",@"content":@"以图搜图的技术的确让导购变得更酷更有趣"},
  @{@"name":@"笑话",@"content":@"每日搜寻全球各个角落的笑话、趣事，锁定笑话频道，多一点惊喜与感动  ！本博所有内容均来自网络"}, nil];
    return datas;
}

@end
