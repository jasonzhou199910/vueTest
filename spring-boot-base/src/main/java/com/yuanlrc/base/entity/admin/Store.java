package com.yuanlrc.base.entity.admin;

import com.yuanlrc.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 后台店铺管理实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_store")
@EntityListeners(AuditingEntityListener.class)
public class Store extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@ValidateEntity(required = true,errorRequiredMsg = "店铺名称不能为空")
	@Column(name = "name",length = 16,nullable = false)
	private String name;//店铺名称

	@Column(name = "photo",length = 64)
	private String photo;//图片

	@ValidateEntity(required = true,errorRequiredMsg = "联系人不能为空")
	@Column(name = "person",length = 11,nullable = false)
	private String person;//联系人

	@ValidateEntity(required = true,errorRequiredMsg = "联系电话不能为空")
	@Column(name = "mobile",length = 16,nullable = false)
	private String mobile;//联系人电话

	@ValidateEntity(required=true,errorRequiredMsg = "店铺地址不能为空")
	@Column(name = "address",length = 32,nullable = false)
	private String address;//店铺地址

	@ValidateEntity(required = true,errorRequiredMsg = "店铺面积不能为空")
	@Column(name = "area",length = 11,nullable = false)
	private String area;//面积

	@ValidateEntity(required = true,errorRequiredMsg = "店铺类型不能为空")
	@Column(name = "store_type",length = 16,nullable = false)
	private String storeType;//店铺类型

	@ValidateEntity(required = true,errorRequiredMsg = "租金不能为空")
	@Column(name = "rent",nullable = false)
	private BigDecimal rent;//租金

	@ValidateEntity(required = true,errorRequiredMsg = "押金不能为空")
	@Column(name = "deposit",nullable = false)
	private BigDecimal deposit;//押金

	@ValidateEntity(required = true,errorRequiredMsg = "店铺介绍不能为空",requiredLeng = true,minLength = 20,maxLength = 1000,errorMinLengthMsg = "店铺介绍至少为20个字",errorMaxLengthMsg ="店铺介绍最多为1000字")
	@Column(name = "info")
	private String info;//店铺介绍

	@ValidateEntity(required=true,errorRequiredMsg = "租期不能为空")
	@Column(name = "lease_term",nullable = false)
	private String leaseTerm;//租期

	@Column(name = "store_status")
	private int storeStatus; //店铺状态

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//发布用户

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getStoreType() {
		return storeType;
	}

	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}

	public BigDecimal getRent() {
		return rent;
	}

	public void setRent(BigDecimal rent) {
		this.rent = rent;
	}

	public BigDecimal getDeposit() {
		return deposit;
	}

	public void setDeposit(BigDecimal deposit) {
		this.deposit = deposit;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getLeaseTerm() {
		return leaseTerm;
	}

	public void setLeaseTerm(String leaseTerm) {
		this.leaseTerm = leaseTerm;
	}

	public int getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(int storeStatus) {
		this.storeStatus = storeStatus;
	}

	@Override
	public String toString() {
		return "Store{" +
				"name='" + name + '\'' +
				", photo='" + photo + '\'' +
				", person='" + person + '\'' +
				", mobile='" + mobile + '\'' +
				", address='" + address + '\'' +
				", area='" + area + '\'' +
				", storeType='" + storeType + '\'' +
				", rent=" + rent +
				", deposit=" + deposit +
				", info='" + info + '\'' +
				", leaseTerm='" + leaseTerm + '\'' +
				", storeStatus=" + storeStatus +
				'}';
	}
}
