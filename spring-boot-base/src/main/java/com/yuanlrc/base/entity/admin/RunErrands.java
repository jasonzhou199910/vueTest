package com.yuanlrc.base.entity.admin;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.bean.OrderStatus;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 后台跑腿代购管理实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_run_errands")
@EntityListeners(AuditingEntityListener.class)
public class RunErrands extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ValidateEntity(required = true,errorRequiredMsg = "请填写任务标题")
	@Column(name = "title",length = 11,nullable = false)
	private String title;//任务标题

	@ValidateEntity(required = true,errorRequiredMsg = "请填写任务类型")
	@Column(name ="type",length = 11)
	private String type;//任务类型

	@ValidateEntity(required = true,errorRequiredMsg = "请填写任务要求",requiredLeng = true,minLength = 20,maxLength = 1000,errorMinLengthMsg = "任务要求最少为20个字",errorMaxLengthMsg = "任务要求最多为1000个字")
	@Column(name = "require_ment",length = 255)
	private String requireMent;//任务要求


	@ValidateEntity(required=true,errorRequiredMsg = "请填写佣金")
	@Column(name = "commission")
	private BigDecimal commission;//佣金

	@ValidateEntity(required = true,errorRequiredMsg = "请填写联系人")
	@Column(name = "persion",length=10,nullable = false)
	private String person;//联系人

	@ValidateEntity(required = true,errorRequiredMsg = "请填写联系电话")
	@Column(name = "mobile",length = 16,nullable = false)
	private String mobile;//联系电话

	@Column(name = "status",length = 5,nullable = false)
	private int status= OrderStatus.RELEASE.getCode();//状态

	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@ValidateEntity(required = true,errorRequiredMsg = "请填写预计到达时间")
	@Column(name = "arrival_time")
	private Date arrivalTime;//预计到达时间

	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//发布人

	@Transient
	private String arrivateDate;


	public String getArrivateDate() {
		return arrivateDate;
	}

	public void setArrivateDate(String arrivateDate) {
		this.arrivateDate = arrivateDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRequireMent() {
		return requireMent;
	}

	public void setRequireMent(String requireMent) {
		this.requireMent = requireMent;
	}

	public BigDecimal getCommission() {
		return commission;
	}

	public void setCommission(BigDecimal commission) {
		this.commission = commission;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "RunErrands{" +
				"title='" + title + '\'' +
				", type='" + type + '\'' +
				", requireMent='" + requireMent + '\'' +
				", commission=" + commission +
				", person='" + person + '\'' +
				", mobile='" + mobile + '\'' +
				", status=" + status +
				", arrivalTime=" + arrivalTime +
				", student=" + student +
				'}';
	}
}
