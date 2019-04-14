package com.ming.service;

import java.math.BigDecimal;
import java.util.List;

import com.ming.entity.FunctionConfig;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.base.service.IBaseService;

public interface IFunctionConfigService extends IBaseService<FunctionConfig>
{
	public FunctionConfig getByFunctionConfigModel(FunctionConfig functionConfig);
	public BigDecimal getConfigChargeRate(String chargeType);
	public List<FunctionConfig> getRandomHeadImgUrl(Pager pager);

}
