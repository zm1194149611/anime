package com.ming.frame.utils;

import java.math.BigDecimal;

public class MissBusinessConst 
{
	public static final Long SYSTEM_NOTICE = 2234l; //系统通知
	
	public static final Long CUSTOMER_SERVICE = 2235l; //平台客服
	
	public static final String CNCHOR_TYPE = "1"; //主播账户
	
	public static final String USER_TYPE = "2"; //普通用户
	
	
	public static final Integer USER_STATUS_OFFLINE = 0; //离线用户
	public static final int USER_STATUS_ONLINE = 1; //在线用户
	public static final int USER_STATUS_BUSY = 2; //忙碌用户
	
	public static final int YX_MESSAGE_TEXT = 0;      //文本消息
	public static final int YX_MESSAGE_PIC = 1;       //图片消息
	public static final int YX_MESSAGE_VOICE = 2;     //语音消息
	public static final int YX_MESSAGE_DEFINE = 3;     //自定义消息，前端拉起假视频
	public static final int YX_MESSAGE_CUSTOME = 100;//文本消息
	
	public static final String YP_APIKEY = "56977af8abfdda32ff7001e330de6eb3";//云片短信APIKEY
	
	
	public static final String FUNC_CONF_MESSAGE = "msgCharge"; //文字消息
	
	public static final String FUNC_CONF_VOICE = "voiceCharge"; //语音
	
	public static final String FUNC_CONF_VEDIO = "vedioCharge"; //视频时间
	
	public static final String FUNC_CONF_GIFT = "giftCharge";  //礼物
	
    public static final String FUNC_CONF_MESSAGE_CODE = "0"; //文字消息
	
	public static final String FUNC_CONF_VOICE_CODE = "1"; //语音通话
	
	public static final String FUNC_CONF_VEDIO_CODE = "2"; //视频通话
	
	public static final String FUNC_CONF_GIFT_CODE = "3";  //礼物
	
	public static final String ISREFRESHVIPCHARGE = "isRefreshVipCharge"; //刷新VIP套餐缓存
	public static final String FUNC_CONF_RECHARGERATE = "reChargeRate"; //聊币&人民币配置标准
	
	public static final String FUNC_CONF_DEVIDERATE = "devideRate"; //主播平台收益分成比例
	
	public static final String FUNC_CONF_AGENTRATE = "agentRate"; //主播经纪人抽成比例
	
	public static final String FUNC_CONF_AGENT_SETTLE_PART = "agentSettlePart"; //主播经纪人抽成部分    1：主播实际赚取的聊币数  2：主播分成后的聊币数
	
	public static final Integer FUNC_CONF_PROVEINCE = 1; //省份
	public static final Integer FUNC_CONF_CITY = 2; //城市
	
	public static final String FUNC_CONF_REFRESH = "refreshChargeRate";   //是否刷新计费缓存
	
	public static final Integer VIP = 1;
	
	public static final Integer NOT_VIP = 0;
	
	public static final String  CHATCOIN_RECHARGE = "聊币充值";
	public static final String  VIP_RECHARGE = "VIP充值";
	
	public static final Integer FUNC_CONF_TYPE_VIP = 2;
	public static final Integer FUNC_CONF_TYPE_CHATCOIN = 3;
	public static final Integer FUNC_CONF_TYPE_VIP_IOS = 17;
	public static final Integer FUNC_CONF_TYPE_CHATCOIN_IOS = 18;
	
	public static final String FUNC_CONF_REFRESH_APK = "refresh_apk";
	
	public static final String FUNC_CONF_REFRESH_VERSION = "apk_version";
	
	public static final String FUNC_CONF_REFRESH_OLD_VERSION = "apk_old_version";
	
	public static final String CHECK_ANDROID_VERSION = "1";
	
	public static final String hotAnchorCnt = "hotAnchorCnt"; //活跃登录次数
	
	public static final String starAnchorLevel = "starAnchorLevel"; //推荐主播星级
	public static final String QRY_STAR_ANCHOR_ONLINE = "qryStarAnchorOnline";//查询推荐主播是否按在线状态过滤
	
	public static final String QRY_ANCHOR_ONLINE = "qry_anchor_online"; //查询主播是否按在线状态过滤
	
	public static final String QRY_USER_ONLINE = "qry_user_online"; //查询用户是否按在线状态过滤
	
	public static final String QRY_ONLINE_CNT = "qry_online_cnt";//查询在线活跃用户数量
	
	public static final String QRY_STAR_ANCHOR_CNT = "qryStarAnchorCnt";//查询推荐主播数量
	
	public static final String QRY_USER_BEGIN_TIME = "qry_user_begin_time"; //查询推荐用户起始时间
	public static final String QRY_USER_END_TIME = "qry_user_end_time"; //查询推荐用户结束时间
	
	public static final String SEND_MSG_MAX = "send_msg_max"; //查询一键打招呼返回话术最大个数
	
	public static final String SEND_MSG_MIN = "send_msg_min"; //查询一键打招呼返回话术最小个数
	
	public static final String HALF_ANCHOR_HALF_MACHINE = "half_anchor_half_machine"; //一键打招呼是否开启一半主播一半机器人
	
	public static final String IS_REPLAY = "isReplay"; //一键打招呼是否需要机器人回复
	
	public static final String IS_MACHINE = "is_Machine"; //机器人发送消息是否用假主播
	
	public static final String MACHINE_ANCHOR_CNT = "machine_anchor_cnt"; //机器人主播数量
	
	
	public static final String MATCH_RATE = "matchRate"; //一键匹配默认费率 
	
	public static final String DOWNLOAD_RSPURL = "downLoadRspUrl"; //下载链接
	
	
	public static final String FREE_VEDIO_RATE = "free_vedio_rate"; //免费赠送视频聊天费率 
	public static final String ISOPEN_VEDIO = "isOpenVedio"; //机器人消息假视频内部的小视频是否开启
	
	public static final Integer PAGE_SIZE = 18; //默认分页条数
	
	public static final String NEARBY_USER_CNT =  "nearbyUserCnt";//秒配查询数量
	
	public static final String ONLINE_INTERVAL_MINUTE =  "onlineIntervalMinute";//上线提醒间隔分钟数
	
	public static final String SPEED_MATCH = "speedMatch"; //一键匹配
	public static final String SPEED_MATCH_ANCHOR_CNT = "speedMatchAnchorCnt"; //一键匹配主播人数
	
	public static final String MONITOR_AUTO_NOTICE = "monitor_auto_notice";//视频审核是否开启自动通知，ON:开启，OFF:关闭
	
	
	/**
	 * 一键匹配和打招呼配置
	 */
	public static final String SPEED_TIMEOUT = "speedTimeOut"; //一键匹配超时时间
	
	public static final String SPEED_GREET  = "speedGreet"; //一键打招呼
	
	public static final String ANCHOR_GREET_SENDCNT  = "anchor_greet_sendcnt"; //用户一键打招呼通知主播个数
	
	public static final String ANCHOR_GREET_ANSWER_WHILTELIST  = "anchor_greet_answer_whiltelist"; //用户一键打招呼机器人主播响应白名单
	
	public static final String USER_GREET_SENDCNT  = "user_greet_sendcnt"; //主播一键打招呼通知用户个数
	
	public static final Integer STATUS_ANSWER = 1; //一键打招呼已接听
	public static final Integer STATUS_TIMEOUT = 2; //一键匹配超时
	
	public static final String LOGIN_GIVECHATCOIN_CONF = "giveChatCoin"; //每日登录送聊币
	
	public static final String IS_GIVECOIN = "isGiveCoin"; //每日登录送聊币开关
	
	/**
	 * 积分相关
	 */
	public static final String IS_GIVE_SCORE = "isGiveScore"; //每日签到送积分开关
	public static final String GIVESCORE_CNT = "giveScoreCnt"; //每日签到送积分数量
	public static final String REGISTER_SCORE_CNT="registerScoreCnt";//注册送积分数量
	
	
	public static final Integer FILE_PIC = 0; // 图片上传
	public static final Integer FILE_VEDIO = 1; //视频上传
	
	
	public static final String  PRIVATE_MSG = "私聊";
	public static final String  PRIVATE_VEDIO = "视频聊天";
	public static final String  PRIVATE_VOICE = "语音聊天";
	public static final String  PRIVATE_GIFT = "礼物";
	
	/**
	 * 支付参数
	 */
	public static final String MCH_APP_NAME = "遇见"; //应用名
	public static final String MCH_APP_ID_ANDROID = "com.missyou.missyou";  //安卓包名
	public static final String MCH_APP_ID_IOS = "com.ty.yj"; //IOS包名
	public static final Integer PAYED = 1; //1:已支付  0:未支付成功
	public static final int PAY_TYPE_ONE = 1; //赤道支付
	public static final int PAY_BASE_CONFTYPE = 31; //赤道支付参数
	public static final int PAY_TYPE_TWO = 2; //微信官方支付
	public static final int PAY_TYPE_THREE = 3; //威富通支付
	public static final Integer PAY_LOCK_STATUS = 1;  //1：处理中
	public static final Integer PAY_UNLOCK_STATUS = 0;  //0:可处理  
	public static final String PAY_TYPE = "pay_type"; //支付厂家
	public static final String WX_PAY_MECHID = "wx_pay_mechid"; //支付厂家
	public static final int PAY_WX_MECHACC = 32; //微信支付商户参数
	public static final int PAY_WX_PARAM = 33; //微信支付请求参数
	public static final int PAY_SWIFT_MECHACC = 34; //威富通商户参数
	
	
	public static final Integer  CUSTOM_MSGTYPE_SPEEDMATCHANDGREET = 8; //通用自定义消息
	public static final Integer  CUSTOM_MSGTYPE_SPEEDGREET = 10; //一键打招呼自定义消息
	public static final Integer  CUSTOM_MSGTYPE_Gift = 9; //礼物接口
	public static final Integer  SYSTEM_NOTICE_TIPS = 1; //系统通知类型:提示
	public static final Integer  SYSTEM_NOTICE_PLATFORM = 2; //系统通知类型:平台公告
	public static final Integer  SYSTEM_NOTICE_SPEED_GREET = 3; //一键打招呼
	public static final Integer  SYSTEM_NOTICE_SPEED_MATCH = 4; //一键匹配
	public static final Integer  SYSTEM_NOTICE_EVALUATE = 5;//主播评价
	public static final Integer  SYSTEM_NOTICE_SALARY = 6;//主播收入
	public static final Integer  SYSTEM_NOTICE_MAID  = 7;//分享用户充值返佣
	public static final Integer  SYSTEM_NOTICE_MACHINE  = 11;//机器人自定义假视频消息
	public static final Integer  SYSTEM_NOTICE_SELFVERIDENTIFIED  = 12;//自拍认证审核通过
	public static final Integer  SYSTEM_NOTICE_CHATCOINPAY = 13;// 聊币充值成功
	public static final Integer  SYSTEM_NOTICE_VIPPAY = 14;// VIP充值成功
	public static final Integer  SYSTEM_NOTICE_ANCHOR_ERIDENTIFIED_SUCCESS = 15;// 主播审核通过
	public static final Integer  SYSTEM_NOTICE_ANCHOR_ERIDENTIFIED_FALIED = 16;// 主播审核不通过
	public static final Integer  SYSTEM_NOTICE_WITHDRAWCASH_SUCCESS = 17;// 提现成功
	public static final Integer  SYSTEM_NOTICE_FREE_VEDIO_MTS = 18;// 免费赠送视频
	public static final Integer  SYSTEM_NOTICE_NEWUSER_LOGIN = 20;// 新用户上线通知主播
	public static final Integer  SYSTEM_NOTICE_TOP_PUSH = 21;// 主播置顶通知
	public static final Integer  SYSTEM_NOTICE_USER_VEDIO = 22;// 用户向主播发起视频通知
	
	/**
	 *媒体文件类型
	 */
	public static final Integer MERDIA_SELFIEVERITE_TYPE = 4; //自拍认证图片
	public static final Integer MERDIA_BACK_TYPE = 3; //详情页背景图片
	public static final Integer MERDIA_VEDIO_TYPE = 2; //视频认证动态
	public static final Integer MERDIA_VEDIO_STATUS_TYPE = 5; //视频动态
	public static final Integer MERDIA_IMG_TYPE = 1; //相册动态
	
	public static final String IOS_PACKAGE_CHANNLE = "IOS001"; //IOS固定渠道编号
	
	/**
	 * 验证码类型
	 */
	public static final Integer CODE_TYPE_REGIST = 1; //注册类型
	public static final Integer CODE_TYPE_RESETPWD = 2;  //密码找回
	public static final Integer CODE_TYPE_BINDPHONE = 3;  //绑定手机号
	
	/**
	 * redis缓存主键配置
	 */
	public static final String DAYLOGIN = "daylogin:"; //每日登录缓存主键
	public static final String BASIC_CONFIG = "basicConfig:"; //基础配置项缓存主键
	public static final String PAY_ORDER_LOCK = "payorder:"; //支付订单锁
	public static final String INV_ANCHOR_GET_CASH_LIMIT = "inv_anchor_getCashLimit"; //主播提现最低金额配置
	public static final String ANCHOR_GET_CASH_LIMIT = "anchor_getCashLimit"; //主播提现最低金额配置
	public static final String USER_GET_CASH_LIMIT = "user_getCashLimit"; //用户提现最低金额配置
	public static final String USER_GET_CASH_MAX_LIMIT = "user_getCashMaxLimit"; //用户提现最高金额配置
	public static final String INV_USER_AGAIN_GET_CASH_LIMIT = "inv_user_again_get_cash_limit"; //经纪人邀请用户再次提现最低可提现金额配置
	public static final String INVITOR_RATE = "invitor_rate"; //分享用户充值佣金比例
	public static final String INVITOR_ANCHOR_RATE = "invitor_anchor_rate"; //推荐主播佣金比例
	public static final String REFRESH_REDIS = "refresh_redis";//启动刷新缓存
	public static final String IS_NOTIFY_INTERFACE="is_notify_interface";//是否调用notifyImCharge接口
	public static final String SCORE_FOR_TEXT="score_for_text";//用积分进行私聊开关
	public static final String SCORE_FOR_VIDEO="score_for_video";//用积分进行视频开关
	public static final String SCORE_FOR_AUDIO="score_for_audio";//用积分进行语音开关
	public static final String REAL_TIME_WITHDRAWAL_SWITCH="real_time_withdrawal";//实时提现开关
	public static final String ANCHOR_WITHDRAWAL_MAX_NUM_PER_DAY="anchor_withdrawal_max_num_per_day";//主播一天最大的提现次数
	public static final String ACHOR_WITHDRAWAL_MAX_CASH="achor_withdrawal_max_cash";//主播单笔提现最大额度
	
	/**处理用户、主播在线状态相关的redis缓存主键*/
	public static final String PREX="onlineData:";
	public static final String ANCHOR_TOP=PREX+"anchorTop";//置顶主播缓存主键
	public static final String STAR_ANCHOR_ACTIVE=PREX+"starAnchorActive";//推荐_活跃主播缓存主键（状态为3）
	public static final String STAR_ANCHOR_UN_ACTIVE=PREX+"starAnchorUnActive";//推荐_不活跃主播缓存主键（状态为1）
	public static final String STAR_ANCHOR_VIDEOING=PREX+"starAnchorVideoing";//推荐_视频中主播缓存主键（状态为2）
	
	public static final String UN_STAR_ANCHOR_ACTIVE=PREX+"unStarAnchorActive";//非推荐_活跃主播缓存主键（状态为3）
	public static final String UN_STAR_ANCHOR_UN_ACTIVE=PREX+"unStarAnchorUnActive";//非推荐_不活跃主播缓存主键（状态为1）
	public static final String UN_STAR_ANCHOR_VIDEOING=PREX+"unStarAnchorVideoing";//非推荐_视频中主播缓存主键（状态为2）
	
	public static final String USER_ACTIVE_MALE=PREX+"userActiveMale";//活跃用户_男（状态为3）
	public static final String USER_ACTIVE_FEMALE=PREX+"userActiveFemale";//活跃用户_女（状态为3）
	public static final String IS_GETDATA_FROM_REDIS="isGetDataFromRedis";//是否从redis缓存中获取数据
	
	/**处理封号用户或主播*/
	public static final String KILL_USER_COLLECTION="killUserData:killUserList";//被封号用户userId集合
	public static final String KILL_USER_DEVICE_COLLECTION="killUserData:killUserDeviceList";//被封号用户设备编码集合
	
	/**
	 * h5页面交互通用接口处理类型
	 */
	public static final int PROCESS_TYPE_ONE = 1; //
	public static final int PROCESS_TYPE_TWO = 2;
	public static final int PROCESS_TYPE_THREE = 3;
	
	public static final Integer UNSETTLED_STATUS = 0; //未结算
    public static final Integer SETTLED_STATUS = 1; //已结算
    
    public static final String CPS_REGIST_URL = "http://cps.jiedianr.cn/Api/Index/reg"; //注册CPS通知地址
    public static final String CPS_PAY_URL = "http://cps.jiedianr.cn/Api/Index/pay"; //支付CPS通知地址
    
    public static final String DEL_LOG_DATE = "del_log_date";//日志删除时间范围
    
    public static final String FREE_VEDIO_MTS = "free_vedio_mts"; //免费赠送视频聊天分钟数配置
    
    public static final Integer WITHDRAWALS_TYPE_INVUSER = 2; //推荐用户提现
    public static final Integer WITHDRAWALS_TYPE_INVANCHOR = 3; //推荐主播提现
    public static final String LOG_TYPE = "log_type"; //日志输出级别
    
    /**
     * 支付宝常量
     * TEST:沙箱环境
     * PRODUCT:正式产品
     */
    public static final String METHOD_TEST = "https://openapi.alipaydev.com/gateway.do";
    public static final String APP_ID_TEST = "2016091400512010";
    public static final String APP_PRIVATE_KEY_TEST= "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCSAKi/xWoPBkYTb/lRd1+yKqFXCwXHgwBep8p+b/cRRoY+8ef+n7Lr0RJnuxObFgwWfe+jeRnMj5r+4cvYtw8xvo6rC8e/HSG/Qws3P4y1SZKXiTCyXsASzE7L9q51jHxpQfKTC40k+ieYnilBmGBYGPj1tQ+kKkV7/8bJ++Uih/QjhRRt0JKyZvH4tjpYbxiuLed0OVvDiaIphw7RaBaoX5O5olHgSMjipiIQ50j1SHA3Vwg4eAP5k6oQIelD4VEwNiBHUDuJ7clRtG9wfssH6TwMrn0CEhicQG3gjI0dNKioLx6ypfi3Mrw8e0LsT/96MJQC22Uw2swprJ9j77GRAgMBAAECggEAHCnoY2XPeap6JhG5hE+EtDeo+8Nyj/PjRF8VnqI2hKyYBNhhKirgNsETzdK2i3oLRuNwMJaRtXYWLgica+eUFMJvfus80s7pzZ0/Mp8do3LXxkd+j0nbv0SOBqZFLQO2lA9WnarixTlEHhqUVsTwAM6AZ9VPeRl2Yd8LF7dxkeFgG93kAcHVxdWvlqK7z6qCJwGbSsg9GDrKg9EsajqdiTSheEazZBWLienr3HPTPEtJLZjhitJ9NCAcUmU4AgVHW489sttkOFdUKWTq+j3R+2ND1RcM6SzS72RUVzHU+uXUAKLV3Gns/zyKArkAEBwagDZKux9cdscBgfInWZIM6QKBgQDnOFoSEIncsLQyEAsr/+h36wGVn7ma5BQxPKNxiALv2eCT4pxmg37lcUoaKi8I5KkXDgjfbscVLdnPQakoNj/RBTBgbXDOz8hEavE0BYm1MYfIaW8kyx+CrpIo6oFsCoy9howSYPSdWh1jm0WUUGM5QwOSW5daHL3JbfuY1/zQewKBgQChplFyO3ZEc5hQm8r1/0xP0Bj0Y43j77OX6hnWzwYkvqhBT1hNjxIRIz7/OgjPmB/n3Xz+oimfPdQCM+SOhlXHRNlqwj09wK0aSn34PtY4R0TqQThB0EkhutPmM3AXimXYSh6vLztPwdDqpZqNLJZVyAcpEliBDVHwNJczbRmWYwKBgQDcWLiFVJt85CylNOLgqHzqotucsl2XvVl83pPH4t0hpBm/9QolK5UnpMIAk0jFiduWK/rKqvAwP8S9HY7N0n0YfYBvtHv3qs3oXZ3FfK2SLkR++fNANg6uZBzHv0tdIeSjzO/5p8oVlkZBoTw6ri0Q6csilAR1jMRUjGpjaxnztwKBgE29jOHhEumspg3uPte7pdmkfLvbvPtn5fkjTrXt7khxoL14CUGTkt7HEp7wLBiaUo3SCTD0kAvTUkiU6FBa7pnc1KrxKz6tkRJZzOc8YQ3DyLLYFtQf9WvRS+Mjzb6kgoJYcxVRI7chwPV4GzHVxZ8PidIIzqOR4lwhDq5ew7V9AoGAM7VzEefIoVetuYNcQmJC3mWtibsR6VTIB8rtXeAyubV9L4FctkU9sHy9jCC0/yl3yZGhhSiS2M7BygLiD3rp38wmtKrd6zQ9EVJqX5p0D9Da+vrH57UI7465t4/tumOD6TlXUjZvOWXZh1iC9MYAg3wQ83ZikVLSnJ5srbxrAVU=";
    public static final String ALIPAY_PUBLIC_KEY_TEST = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2hqnXi6tL+2xUtPuGMaegvOZUWzsK1XhHoS9cDmVYsWIJ4RDxDODLx2uaWU7xH9VtjTEdiCLyDROY4Fd9HEp+JcKPLuHutgpsPqUypFLsjVk1cv/Z/NA1yqFzSORp4gvVuHPvrVavLBlb8xJHm6cr3fSxuP/oZq+3TJVoBZjE1ie/+q3/4CyW3at9f8ltl9OIe9nzO/7F9hP0AucZffUOoolN75ar6BAJuI2te2J73wn8rFgOM2SIGsWD5guRtV2aGxUlM6ttV8FJoU1bUM2OVyGn46zgrGYxDp0tFbCfJl4AbjH3qZRpZ45aOTvTN/4LU/5O47SGQ8OHdsXqbqDuwIDAQAB";
	
    public static final String METHOD_PRODUCT = "https://openapi.alipay.com/gateway.do";
    public static final String APP_ID_PRODUCT = "2018060560290639";
    public static final String APP_PRIVATE_KEY_PRODUCT  = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCaSlYonGLYJCsTasLGhnAklDrXgfWG82l+UqEbpdNQhJ71rIQBcKm5Plt5VvdweGCG46XH9t0qU0WJzh9K0lHSL3w0ktJ088l6k5UIykYOk0QoOUo2amOdS3QHKmTsjJBSEFQbID2e/AhLEAhN38FuYoCzobIFx9Y2OMN25aSzvJ2zpFIZm2XxtuFH1xWxjmfpQ5RwyAxkTIMaKoRmk7ipn2NU47T/Agz2+F0DhSKDADdAdFCi2CUg37GGumFvhRlg+6jQCeDNvWTdVPIKQH5I5pAsz+Yvw/ZegrxtfPA/tILj7Gq25Yt6UN2palqmUCVALykTU0YBqvHMYc6y3jg5AgMBAAECggEATx+6KZ9xjViXAqEoe/jrv8aImoZaLLfdrNuhJXWX9d3dSy4KkFZ/o7EX5hU0VehV0DckiHTQHOmRasdbAtry/PA/KRL2fOWcuJDAyD47STQ6qsoeheNvbHYKbbZPBYRcaslW6IZTM5oagqwZJh6OqxY23GgazJ4b+7iGfQ3ttgI98hcS2K0vHzptMeV8M8XlEnJ/vJgaXjDnbOm+JB3FSvFk5r+ZYZvKShCTpwLn8uZDbjv/AwWQHxsCIXiWxEYbSRAp1dHrOyGmJgV8pEQZltEyMWUXkaCJdccS9AGtk/WtBBKjr93SdyXuDcazjhk6AZDrsV7BXkOg7PT80fu4AQKBgQD7ju4hVSINAo6W6aVUS1P4BPl+YNLxUpi+DJuEHi2PQuSXB15UW0tRCqnCvz2L+CxOpTW3wUshK1yxnEhydF3VyHxXh0FfYw7r+0CO4ywYCW+dnI8wRJSff4lAJox5onZmVZ4kA8zqsdJB2Pj0kft3siqyuUcw12rI/Q0jTJr3OQKBgQCdA77Ao7CvvfpRkjiQdziYThPh1PEs94U/e4YoR+G8p8vqJxy7645dXdzGtR0drVa8XuRHzEHGCQh6cmsbW9os+M2owhYAJeqFxgtRah5yhQB+z5nr2Wfwzu3XUpS2R6nigD9VW8VdMKloNhQcWSrWQQZ4ondexpEef+a4P+RJAQKBgQCjvjatBcBDXa24998BDoNaxsosBBRqtsvrsUMtbYNUZENtN4OkP0S4PMuhk2AZkvIsQwfDU5N2xMXyansR3UMTHAwr4UOhNlaJLqOoHqEeCE5Z9oWR8qIXbCnH0w/PQPv2wrZMVRj2j8b/y57Je5iHIjb+3PFFDoNYzrbVilC4qQKBgBJuVxzr2hi3F0QuAt/KbuVJ/QF8apcZsxWBnXzq+y+XDtO8pZ3Vh8+j7f+RUQqjx1OzW96ltm7Vrp4ZAkOi45h12EZgCg8YZFAxsDBtYYeV3zoDipDp406cK8Uj13sSLHn/DfAqJp/Kz4gBGRk+yk1+MpFEmPiSHITVBLNKJLUBAoGBAOfEGPvg/eQfTvVln50FL+hjIZv466RCt2YtTboHOJc3h8Z01mMIE5jWQUAMOus4kDFhlQGUL9tkpkYggfm316+UIhoZ7IPJLBiEajhzgDuJsVUM5nEpv7cRT/CWCzASjdUrr7kL6ahr9pVZUOki7dnAIAPD7nmG9yHZ1wkaXsmS";
    public static final String APP_PUBLIC_KEY_PRODUCT = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmkpWKJxi2CQrE2rCxoZwJJQ614H1hvNpflKhG6XTUISe9ayEAXCpuT5beVb3cHhghuOlx/bdKlNFic4fStJR0i98NJLSdPPJepOVCMpGDpNEKDlKNmpjnUt0Bypk7IyQUhBUGyA9nvwISxAITd/BbmKAs6GyBcfWNjjDduWks7yds6RSGZtl8bbhR9cVsY5n6UOUcMgMZEyDGiqEZpO4qZ9jVOO0/wIM9vhdA4UigwA3QHRQotglIN+xhrphb4UZYPuo0Angzb1k3VTyCkB+SOaQLM/mL8P2XoK8bXzwP7SC4+xqtuWLelDdqWpaplAlQC8pE1NGAarxzGHOst44OQIDAQAB";
    public static final String ALIPAY_PUBLIC_KEY_PRODUCT  = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjL+UMbxCtxiSpcar85UNZE+imrsDMa5P1HzOR5R3ME6ay/UjonYfs4RTZ39gVtZzpQY/k6S6Gtzl6iyyhNrgG1az+BXG1t5IvHG7ACIryqUYrFRxVH7yQ8Rp02FLtYBSrV9gbB1NmV6WwAtMLuUF+BESq2dgjuX1cWZ9tJHuyrce0cPhlh0RbU6Hm27ocnXrGI64ZQkEwOaFxOp77NgJHlJ25VJgB6jRzJFAnamHkHPWu4C/emJPeoAkH3sh5GJpSuHr+DZj0nSHwVj7+eDI5KeYDrEarOiuPk9a2N+rLmmmyhyn2BaxzNsUS8xf2rx3JmY7sA7ETxbaMM8n/pSSlQIDAQAB";
    
	/**
	 * 百度图像审核
	 */
    public static final String BAIDU_APP_ID = "11332144";//appID
    public static final String BAIDU_API_KEY = "9OshDAPjaBg7qNzOE5EMqzHz";//appKey
    public static final String BAIDU_SECRET_KEY = "UwHzDdNTRFIROeYqMe8VpaT48FriW9cO";//appSecretkey
    public static final String OPEN_BAIDU_IMAGE_MONITOR = "open_baidu_image_monitor";
    
    /**
     * 用户违规封号相关
     */
    public static String MAX_ALLOW_WG_COUNT="max_allow_wg_count";//用户一天内允许的最大违规次数
    public static String USER_BLOCK_DAYS="user_block_days";//用户默认的封号天数
    
    /**
     * 自动提现
     */
    public static String AUTO_CASH_SWITCH="auto_cash_switch";//自动提现开关
    public static String CASH_NOTICE_SWITCH="cashNoticeSwitch";//自动提现开关
    
    /**
     * 主播平台分成比例相关
     */
    public static final String DEVIDE_RATE_LEVEL1 = "devideRate1"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL2 = "devideRate2"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL3 = "devideRate3"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL4 = "devideRate4"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL5 = "devideRate5"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL6 = "devideRate6"; //主播平台收益分成比例
    public static final String DEVIDE_RATE_LEVEL7 = "devideRate7"; //主播平台收益分成比例
    
    /**
     * 访客相关
     */
    public static final String DEFAULT_VIEWER_COUNT = "defaultViewerCount"; //默认的访客数量
    /**
     * 礼物广播相关
     */
    public static final String GIFT_BROADCAST_SWITCH ="giftBroadcastSwitch";//礼物广播开关
    public static final String MIN_GIFT_BROADCAST_MONEY ="minGiftBroadcastMoney";//礼物广播最小金额
    /**
     * 主播粉丝上线打招呼
     */
    public static final String AUTO_SAYHELLO_SWITCH ="autoSayHelloSwitch";//自动打招呼开关
    
    
    public static final String ISYX_SCORE_CHARGE = "isYx_Scoll_charge"; //云信计费接口是否需要启用积分计费机制
    
    /**投诉，举报原因的key*/
    public static final String COMPLAINTS_REASON ="complaints_reason";
    
    public static final String OPEN_USER_LOGIN ="open_user_login"; //用户上线提醒开关
    
    public static final String CUSTOM_WECHAT = "custom_wechat"; //官方客服微信配置
    
    /**
     * ios相关配置
     */
    public static final String OPEN_IOS_FORMAL_VERSION = "openIosFormalVersion"; //打开ios正式版本
    
}
