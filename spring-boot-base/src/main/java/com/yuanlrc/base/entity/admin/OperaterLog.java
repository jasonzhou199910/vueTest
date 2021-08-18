package com.yuanlrc.base.entity.admin;
/**
 * 后台操作日志记录表
 */
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;


@Entity
@Table(name="ylrc_operater_log")
@EntityListeners(AuditingEntityListener.class)
public class OperaterLog extends BaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name="operator",nullable=false,length=18)
	private String operator;//操作者
	
	@Column(name="content",nullable=false,length=128)
	private String content;//操作内容

	@Transient
	private int currentPage;

	@Transient
	private int pageSize;
	
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operater) {
		this.operator = operater;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
