package com.ming.exception;

import com.ming.frame.exception.BaseException;
import com.ming.frame.exception.ECode;

public class BusiException extends BaseException {


	/**
		 * 
		 */
	private static final long serialVersionUID = -7975578636310804520L;

	public enum BusiCode implements ECode {
		YX_EXCEPTION("100000","云信接口异常"),
		YX_CODE_NOT_MATCH("100001","验证码不正确"),
		ACCOUNT_ADD_EXCEPTION("100010","新增账户异常"),
		FUNCTIONCONFIG_ADD_EXCEPTION("100017","新增配置功能异常"),
		ACCOUNT_ADD_NOWITHDRAWALSACCOUNT_EXCEPTION("100016","新增账户无支付或提现账户"),
		ACCOUNT_UPDATE_NOWITHDRAWALSACCOUNT_EXCEPTION("100019","无变更账户信息"),
		ACCOUNT_ADD_NOWITHDRAWALSACCOUNT_MUTIPLY_BANK_EXCEPTION("100018","已绑定银行卡提现账户"),
		ACCOUNT_ADD_NOWITHDRAWALSACCOUNT_MUTIPLY_WEBCHAAT_EXCEPTION("100022","已绑定银行卡提现账户"),
		ACCOUNT_ADD_NOWITHDRAWALSACCOUNT_MUTIPLY_ALIPAY_EXCEPTION("100020","已绑定支付宝提现账户"),
		ACCOUNT_EMPTY_EXCEPTION("100021","无遇见账户信息，请联系客服"),
		ACCOUNT_UPDATE_NOWITHDRAWALSACCOUNT_EXIST("100023","该提现账号已被其他用户绑定"),
		RECHARGE_ADD_EXCEPTION("100011","新增充值记录"),
		ExpendRecord_ADD_EXCEPTION("100012","新增支出记录异常"),
		WITHDRAWALSCASHRECORD_ADD_EXCEPTION("100013","新增提现记录异常"),
		EXPENDRECORD_ADD_MONEYOUT_EXCEPTION("100014","支出金额不能大于账户可提现余额"),
		WITHDRAWALSCASH_ADD_MONEYOUT_EXCEPTION("100015","提现金额不能大于可提现余额"),
		WITHDRAWALSCASH_ADD_MONEY_ERROR_EXCEPTION("100018","低于最小可提现金额"),
		WITHDRAWALSCASH_ADD_ACCOUNTID_ERROR_EXCEPTION("100017","提现账户为空或不匹配"),
		WITHDRAWALSCASH_ADD_MAX_COUNT_EXCEPTION("100030","超过每天可提现次数"),
		WITHDRAWALSCASH_ADD_MAX_CASH_EXCEPTION("100031","单笔提现金额超出额度"),
		USER_NOT_EXIST("110000","用户不存在"),
		USER_PASSWORD_NOT_MATCH("110001","用户密码不匹配"),
		USER_PHONE_NOT_BIND("110002","手机号尚未绑定"),
		USER_BLOCK("110003","账号被禁封"),
		ATTENTION_HAS_EXISTS("120000","已添加关注,不能重复添加"),
		BLACK_HAS_EXISTS("130000","已添加黑名单,不能重复添加"),
		INCOME_CONFIG_NOTEXISTS("100016","平台收益配置缺失"),
		YZ_CODE_NOT_MATCH("140001","验证码不正确"),
		YZ_CODE_NOT_GET("140002","验证码尚未获取"),
		FILE_NOT_FOUND_EXCEPTION("100023","文件不存在"),

		ANCHOR_APPLY_NEED_MORE_MEDIA("150001","请上传更多的相册或视频文件,以便通过审核"),
		
		PAY_WX_PARAM_EXCEPTION("160001","参数不正确"),
		WITHDRAWALSCASH_ADD_MONEY_INVUSER_ERROR_EXCEPTION("100024","首次提现需要有3位以上用户消费达30元以上"),
		WITHDRAWALSCASH_ADD_MONEY_INVUSER_MINCNT_ERROR_EXCEPTION("100025","首次提现需要有3位用户消费额度达到"),
		WITHDRAWALSCASH_ADD_MONEY_INVUSERCNT_ERROR_EXCEPTION("100026","首次提现需要邀请3位以上用户"),
		WITHDRAWALSCASH_ADD_MONEY_INVANCHORCNT_ERROR_EXCEPTION("100027","首次提现需要邀请提现规则中规定的主播数"),
		WITHDRAWALSCASH_GET_CASH_AGAIN_MONEYOUT_EXCEPTION("100028","再次提现时，可提现金额不能小于100元"),
		FILE_UPLOAD_EXCEPTION("100029","文件上传失败，请重新上传"),
		
		MEDIA_PHOTO_DELETE_EXCEPTION("170001","至少保留两张认证通过图片"),
		MEDIA_HEAD_IMAGE_UPLOAD_EXCEPTION("170002","已有审核中的头像，请等待审核结果"),
		;

		

		String message;
		String code;
		
		BusiCode(String code,String message){
			this.code = code;
			this.message = message;
		}
		
		@Override
		public String getMessage() {
			return message;
		}

		@Override
		public String getCode() {
			return code;
		}

	}
	
	
	public BusiException(String message) {
		super(message);
	}

	public BusiException(ECode code) {
		super(code);
		// TODO Auto-generated constructor stub
	}

	public BusiException(ECode code,String detail) {
		super(code, detail);
	}

	
}
