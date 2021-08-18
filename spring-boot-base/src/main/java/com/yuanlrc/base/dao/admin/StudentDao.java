package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.admin.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.math.BigDecimal;

/**
 * 学生数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface StudentDao extends JpaRepository<Student, Long>{
	
	/**
	 * 按照学生名查找学生信息
	 * @param name
	 * @return
	 */
	public Student findByName(String name);

	/**
	 * 根据学生id查询
	 * @param id
	 * @return
	 */
	@Query("select s from Student s where id = :id")
	public Student find(@Param("id") Long id);

	/**
	 * 根据学生编号查询
	 * @param studentNumber
	 * @return
	 */
	public Student findByStudentNumber(@Param("studentNumber")String studentNumber);


	/**
	 * 根据身份证号查询学生
	 * @param card
	 * @return
	 */
	public Student findByCard(@Param("card")String card);


	/**
	 * 更新余额
	 * @param id
	 * @param balance
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_student set balance=:balance where id=:id",nativeQuery = true)
	public int updateBalance(@Param("id")Long id, @Param("balance")BigDecimal balance);


	/**
	 * 交付押金 扣除余额 更新状态
	 * @param student
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_student set balance=:#{#student.balance},deposit_status=:#{#student.depositStatus} where id=:#{#student.id}",nativeQuery = true)
	int updateBalanceAndStatus(@Param("student") Student student);
}
