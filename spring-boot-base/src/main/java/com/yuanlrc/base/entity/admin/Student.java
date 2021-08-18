package com.yuanlrc.base.entity.admin;

import com.yuanlrc.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 后台学生实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_student")
@EntityListeners(AuditingEntityListener.class)
public class Student extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final int USER_SEX_MAN = 1;//性别男
	
	private static final int USER_SEX_WOMAN = 2;//性别女
	
	private static final int USER_SEX_UNKONW = 0;//性别未知
	
	public static final int ADMIN_USER_STATUS_ENABLE = 1;//用户状态正常可用
	public static final int ADMIN_USER_STATUS_UNABLE = 0;//用户状态不可用

	public static final int ADMIN_STUDENT_DEPOSIT_STATUS_ON = 1;//押金状态 已交
	public static final int ADMIN_STUDENT_DEPOSIT_STATUS_OFF = 0;//未交


	@ManyToOne
	@JoinColumn(name="role_id")
	private Role role;//角色
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=2,maxLength=18,errorRequiredMsg="学生名称不能为空!",errorMinLengthMsg="学生名称长度需大于2!",errorMaxLengthMsg="学生名称不能大于18!")
	@Column(name="name",nullable=false,length=18,unique=true)
	private String name;//学生名字
	
	@Column(name="password",nullable=false,length=32)
	private String password;//登录密码

	@Column(name = "student_number",nullable = false,length = 40)
	private String studentNumber;//学生编号

	@Column(name = "card",length = 32,nullable = false)
	private String card;//身份证号

	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = ADMIN_USER_STATUS_ENABLE;//学生状态,默认可用
	
	@ValidateEntity(required=false)
	@Column(name="head_pic",length=128)
	private String headPic;//学生头像
	
	@ValidateEntity(required=false)
	@Column(name="sex",length=1)
	private int sex = USER_SEX_UNKONW;//学生性别
	
	@ValidateEntity(required=false)
	@Column(name="mobile",length=12)
	private String mobile;//学生手机号
	
	@ValidateEntity(required=false)
	@Column(name="email",length=32)
	private String email;//学生邮箱

	@Column(name="balance")
	private BigDecimal balance=BigDecimal.ZERO;//学生余额

	@Column(name="deposit_status")
	private int depositStatus=ADMIN_STUDENT_DEPOSIT_STATUS_OFF;//押金状态

	@Transient
	private int currentPage;

	@Transient
	private int pageSize;

	public int getDepositStatus() {
		return depositStatus;
	}

	public void setDepositStatus(int depositStatus) {
		this.depositStatus = depositStatus;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
