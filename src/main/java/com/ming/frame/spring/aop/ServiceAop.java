package com.ming.frame.spring.aop;
//package com.missyou.spring.aop;
//
//import java.util.Date;
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//import com.missyou.utils.ObjectUtil;
//import com.missyou.exception.LoginException;
//import com.missyou.spring.session.SessionHelper;
//import cn.dh.itgroup.frame.mybatis.entity.BaseEntity;
//
///**
// * @author 
// * @time 2017年11月06日
// * @desc 逻辑层切面
// * @company cn.dh.itgroup
// * @project core
// */
//@Aspect
//@Component
//public class ServiceAop {
//
//	private final String ADD_POINT = "execution (* com.missyou.base.service.AbstractBaseServiceImpl.add(..))";
//
//	private final String UPDATE_POINT = "execution (* com.missyou.base.service.AbstractBaseServiceImpl.update(..))";
//
//	@Value("${auth.filter:true}")
//	private Boolean authFilter;
//
//	/**
//	 * @author 
//	 * @time 2017年11月6日
//	 * @desc 添加创建时间字段统一
//	 * @company cn.dh.itgroup
//	 * @project core
//	 */
//	@Before(ADD_POINT)
//	public void add(JoinPoint point) throws LoginException {
//		// 获取参数数组 拦截如add(BaseEntity entity)的方法
//		Object[] args = point.getArgs();
//		if (args[0] instanceof BaseEntity) {
//			BaseEntity entity = (BaseEntity) args[0];
//			if (ObjectUtil.isNull(entity.getCreateTime())) {
//				// 设置实体的创建时间
//				entity.setCreateTime(new Date());
//				// 设置实体的创建用户
//				try {
//					entity.setCreator(SessionHelper.getSessionUser().getUser().getId());
//				} catch (Exception e) {
//					if (authFilter) {
//						throw e;
//					}
//				}
//			}
//		}
//	}
//
//	/**
//	 * @author 
//	 * @time 2017年11月6日
//	 * @desc 添加最后修改时间统一
//	 * @company cn.dh.itgroup
//	 * @project core
//	 */
//	@Before(UPDATE_POINT)
//	public void update(JoinPoint point) throws LoginException {
//		Object[] args = point.getArgs();
//		if (args[0] instanceof BaseEntity) {
//			BaseEntity entity = (BaseEntity) args[0];
//			if (ObjectUtil.isNull(entity.getLastModifyTime())) {
//				// 设置修改时间
//				entity.setLastModifyTime(new Date());
//				// 设置修改者
//				try {
//					entity.setLastModifier(SessionHelper.getSessionUser().getUser().getId());
//				} catch (Exception e) {
//					if (authFilter) {
//						throw e;
//					}
//				}
//			}
//		}
//	}
//
//}
