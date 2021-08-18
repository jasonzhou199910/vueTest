package com.yuanlrc.base.entity.admin;

import com.yuanlrc.base.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 后台跑腿订单实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_run_order")
@EntityListeners(AuditingEntityListener.class)
public class RunOrder extends BaseEntity{

	private static final long serialVersionUID = 1L;

	@Column(name = "order_no",length = 128,nullable = false)
	private String orderNo;//订单编号

	@ManyToOne
	@JoinColumn(name="student_id")
	private Student student;//接单学生

	@ManyToOne
	@JoinColumn(name="runerrands_id")
	private RunErrands runErrands;//接单的跑腿记录


	@Column(name = "status",length = 5)
	private int status;//接单的状态

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public RunErrands getRunErrands() {
		return runErrands;
	}

	public void setRunErrands(RunErrands runErrands) {
		this.runErrands = runErrands;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RunOrder{" +
				"student=" + student +
				", runErrands=" + runErrands +
				", status=" + status +
				'}';
	}
}
