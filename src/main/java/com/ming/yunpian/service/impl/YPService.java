package com.ming.yunpian.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.ming.frame.utils.MissBusinessConst;
import com.ming.frame.utils.StringUtil;
import com.ming.yunpian.service.IYPService;
import com.yunpian.sdk.YunpianClient;
import com.yunpian.sdk.model.Result;
import com.yunpian.sdk.model.SmsSingleSend;

@Service
public class YPService implements IYPService
{
	
	
	Logger logger = LoggerFactory.getLogger(YPService.class);
	
	@Override
	public void sendYzCode(String mobile, String yzCode) {
		String text = "【日月明】您的验证码是"+yzCode+"。如非本人操作，请忽略本短信";
		Result<SmsSingleSend>result = 	singleSend(text, mobile);
		if(!result.getCode().equals(0))
		{
			logger.error("短信调用接口异常:msg"+result.getMsg()+"\t "+result.getDetail());
		}
	}
	

	/**
	 * 
	 * singleSend(单条短信验证码)  
	 * (这里描述这个方法适用条件 – 可选)  
	 * @param apikey 云片调用鉴权key
	 * @param text 内容，短信模板
	 * @param mobile 发送手机号
	 * @return   
	 * @exception   
	 * @since  1.0.0
	 */
	private Result<SmsSingleSend> singleSend(String text, String mobile) 
	{
		
		YunpianClient clnt = new YunpianClient(MissBusinessConst.YP_APIKEY).init();
		Map<String, String> param = clnt.newParam(2);
	    param.put(YunpianClient.MOBILE, mobile);
	    param.put(YunpianClient.TEXT, text);
	    
	    //账户:clnt.user().* 签名:clnt.sign().* 模版:clnt.tpl().* 短信:clnt.sms().* 语音:clnt.voice().* 流量:clnt.flow().* 隐私通话:clnt.call().*
	    Result<SmsSingleSend> r = clnt.sms().single_send(param);
	    
	    //获取返回结果，返回码:r.getCode(),返回码描述:r.getMsg(),API结果:r.getData(),其他说明:r.getDetail(),调用异常:r.getThrowable()
	    r.getData();

	    //最后释放client
	    clnt.close();
		return r;
	}

	
	@Async
	@Override
	public void sendCommonNotice(String mobile, String text) {
		if(!StringUtil.isEmpty(mobile)) {
			try {
				Result<SmsSingleSend> result  = singleSend("【秒见社交平台】"+text, mobile);
				if(!result.getCode().equals(0)){
					logger.error("短信调用接口异常:msg"+result.getMsg()+"\t "+result.getDetail());
				}
			} catch (Exception e) {
				logger.error("发送主播申请热门审核通过通知短信异常："+e);
			}
		}else {
			logger.info("发送主播申请热门审核通过通知时，手机号为空");
		}
	}
	

}
