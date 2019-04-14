package com.ming.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.entity.FunctionConfig;
import com.ming.frame.base.dao.IMyBatisDao;
import com.ming.frame.base.pager.Pager;

@Repository
public interface FunctionConfigDao extends IMyBatisDao<FunctionConfig>
{
	public FunctionConfig getByFunctionConfigModel(FunctionConfig functionConfig);
	
	public List<FunctionConfig> getRandomHeadImgUrl(@Param("pager")Pager pager);
}
