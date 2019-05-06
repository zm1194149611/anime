package com.ming.entity;

import java.util.Date;

import com.ming.frame.base.entity.BaseEntity;

/**
 * 漫画章节类
 * @author zhaoming
 *
 */
public class CartoonChapter extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long cartoonId;
	private String title;
	private Integer sequence;
	private Integer needLogin;
	private Integer needCharge;
	private Date createTime;
	private Integer disable;
	private Integer pageView;
	private Date lastViewTime;
	
	private String cartoonTitle; //漫画名
	private Long preChapterId;   //上一话id
	private Long nextChapterId;   //下一话id
	
	public Long getPreChapterId() {
		return preChapterId;
	}
	public void setPreChapterId(Long preChapterId) {
		this.preChapterId = preChapterId;
	}
	public Long getNextChapterId() {
		return nextChapterId;
	}
	public void setNextChapterId(Long nextChapterId) {
		this.nextChapterId = nextChapterId;
	}
	public String getCartoonTitle() {
		return cartoonTitle;
	}
	public void setCartoonTitle(String cartoonTitle) {
		this.cartoonTitle = cartoonTitle;
	}
	public Integer getPageView() {
		return pageView;
	}
	public void setPageView(Integer pageView) {
		this.pageView = pageView;
	}
	public Date getLastViewTime() {
		return lastViewTime;
	}
	public void setLastViewTime(Date lastViewTime) {
		this.lastViewTime = lastViewTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCartoonId() {
		return cartoonId;
	}
	public void setCartoonId(Long cartoonId) {
		this.cartoonId = cartoonId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public Integer getNeedLogin() {
		return needLogin;
	}
	public void setNeedLogin(Integer needLogin) {
		this.needLogin = needLogin;
	}
	public Integer getNeedCharge() {
		return needCharge;
	}
	public void setNeedCharge(Integer needCharge) {
		this.needCharge = needCharge;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getDisable() {
		return disable;
	}
	public void setDisable(Integer disable) {
		this.disable = disable;
	}

}
