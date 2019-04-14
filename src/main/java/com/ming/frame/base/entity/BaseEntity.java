package com.ming.frame.base.entity;

/**
 * @author 
 * @time 2017年11月6日
 * @desc 当前系统所有实体必须继承的父类
 * @project mybatis
 */
public class BaseEntity implements Identifiable, java.io.Serializable {

	private static final long serialVersionUID = -3505763213610474959L;
	protected Long id; // 标志
  
	protected Long[] ids; // 多个实体的id数组

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		final BaseEntity other = (BaseEntity) obj;
		if (id == null) {
			return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
 
 

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}
 

}