package com.ming.entity;

import java.util.Date;
import java.util.List;

import com.ming.frame.base.entity.BaseEntity;

/**
 * 漫画类
 * @author zhaoming
 *
 */
public class Cartoon extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String title;
	private String imgUrl;
	private String tags;
	private String author;
	private String introduce;
	private Date createTime;
	private Integer disable;
	private Integer pageView;
	private Date lastViewTime;
	private List<String> tagList;
	
	//业务字段
	private Integer lastChapterNo;  //最新章节话数
	private String lastChapterTitle;   //最新章节标题
	public Integer getLastChapterNo() {
		return lastChapterNo;
	}
	public void setLastChapterNo(Integer lastChapterNo) {
		this.lastChapterNo = lastChapterNo;
	}
	public String getLastChapterTitle() {
		return lastChapterTitle;
	}
	public void setLastChapterTitle(String lastChapterTitle) {
		this.lastChapterTitle = lastChapterTitle;
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
	public List<String> getTagList() {
		return tagList;
	}
	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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
