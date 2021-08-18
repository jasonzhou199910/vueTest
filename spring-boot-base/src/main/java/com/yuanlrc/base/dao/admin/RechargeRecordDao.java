package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.admin.RechargeRecord;
import com.yuanlrc.base.entity.admin.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 充值记录数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface RechargeRecordDao extends JpaRepository<RechargeRecord, Long>{

	/**
	 * 根据充值记录id查询
	 * @param id
	 * @return
	 */
	@Query("select re from RechargeRecord re where id = :id")
	public RechargeRecord find(@Param("id") Long id);

}
