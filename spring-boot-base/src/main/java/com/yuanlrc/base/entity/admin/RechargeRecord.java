package com.yuanlrc.base.entity.admin;

import com.yuanlrc.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 充值记录实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_recharge_record")
@EntityListeners(AuditingEntityListener.class)
public class RechargeRecord extends BaseEntity{

	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//充值学生

	@Column(name = "money")
	private BigDecimal money;//充值金额

	@Column(name = "status",length = 2)
	private int status;//充值状态

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
