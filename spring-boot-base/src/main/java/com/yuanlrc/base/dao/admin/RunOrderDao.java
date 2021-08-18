package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.admin.RunOrder;
import com.yuanlrc.base.entity.admin.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 订单数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface RunOrderDao extends JpaRepository<RunOrder, Long>, JpaSpecificationExecutor<RunOrder> {
	
	/**
	 * 按照订单编号查找订单信息
	 * @param orderNo
	 * @return
	 */
	public RunOrder findByOrderNo(String orderNo);

	/**
	 * 根据订单id查询
	 * @param id
	 * @return
	 */
	@Query("select o from RunOrder o where id = :id")
	public RunOrder find(@Param("id") Long id);
	
}
