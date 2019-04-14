package com.ming.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.dao.FunctionConfigDao;
import com.ming.entity.FunctionConfig;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;
import com.ming.frame.base.service.AbstractBaseServiceImpl;
import com.ming.frame.utils.DoubleUtil;
import com.ming.frame.utils.MissBusinessConst;
import com.ming.redis.RedisClient;
import com.ming.service.IFunctionConfigService;

@Service
public class FunctionConfigService extends AbstractBaseServiceImpl<FunctionConfig> implements IFunctionConfigService{
	
	@Autowired
	private RedisClient redisClient;

	@Autowired
	private FunctionConfigDao functionConfigDao;
	
	@Override
	public IMyBatisDao<FunctionConfig> getMyBatisDao() 
	{
		return functionConfigDao;
	}

	@Override
	public FunctionConfig getByFunctionConfigModel(FunctionConfig functionConfig) 
	{
		return functionConfigDao.getByFunctionConfigModel(functionConfig);
	}
	
	/**
	 * 数据转换
	 * @param convertCode
	 * @param sourceMap
	 * @return
	 */
	public Map<String,Object> convertParam(int convertCode,Map<String,Object> sourceMap)
	{
		if(convertCode > 0) 
		{
			FunctionConfig func = new FunctionConfig();
			func.setConfigType(convertCode);
			List<FunctionConfig> convertList = functionConfigDao.find(func);
			if(!convertList.isEmpty()) 
			{
				Map<String,Object> convertMap = new HashMap<String,Object>();
				for(FunctionConfig conf : convertList) 
				{
					if(sourceMap.containsKey(conf.getConfigKey())) 
					{
						convertMap.put(conf.getConfigValue(), sourceMap.get(conf.getConfigKey()));
					}
				}
				return convertMap;
			}
		}
		return null;
	}
	
	
	public BigDecimal getConfigChargeRate(String chargeType)
	{
		//兑换比例
		String confRate = redisClient.getTemplate().opsForValue().get(MissBusinessConst.BASIC_CONFIG + chargeType);
		if(StringUtils.isEmpty(confRate)) 
		{
			
			FunctionConfig coinConfig = new FunctionConfig();
			coinConfig.setConfigKey(chargeType);
			coinConfig = getByFunctionConfigModel(coinConfig);
			confRate = coinConfig != null ? coinConfig.getConfigValue() : "";
		}
		
		BigDecimal chargeRate = new BigDecimal(0);
        if(confRate != null && StringUtils.isNotEmpty(confRate) && confRate.indexOf(":") != -1)
        {
        	double cfgVal1 = Double.valueOf(confRate.split(":")[1]);
        	double cfgVal0 = Double.valueOf(confRate.split(":")[0]);
        	if(StringUtils.equals(chargeType, MissBusinessConst.FUNC_CONF_DEVIDERATE))
        	{
        		double total = cfgVal1 + cfgVal0;
        		chargeRate = DoubleUtil.devideFormat(cfgVal1,total,"0.00");
        	}
        	else 
        	{
        		chargeRate = DoubleUtil.devideFormat(cfgVal1,cfgVal0,"0.00");
        	}
        }
		return chargeRate;
	}
	
	
	public List<FunctionConfig> getRandomHeadImgUrl(Pager pager)
	{
		return functionConfigDao.getRandomHeadImgUrl(pager);
	}

}
