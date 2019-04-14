package com.ming.entity;

import java.util.Date;

import com.ming.frame.base.entity.BaseEntity;
/**
 * 漫画主体
 * @author zhaoming
 *
 */
public class CartoonBody extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long chapterId;
	private Long cartoonId;
	private Integer sequence;
	private String imgUrl;
	private Date createTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getChapterId() {
		return chapterId;
	}
	public void setChapterId(Long chapterId) {
		this.chapterId = chapterId;
	}
	public Long getCartoonId() {
		return cartoonId;
	}
	public void setCartoonId(Long cartoonId) {
		this.cartoonId = cartoonId;
	}
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	

}
