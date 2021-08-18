package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.admin.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 店铺数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface StoreDao extends JpaRepository<Store, Long>{
	
	/**
	 * 按照店铺名查找店铺信息
	 * @param name
	 * @return
	 */
	public Store findByName(String name);

	/**
	 * 根据店铺id查询
	 * @param id
	 * @return
	 */
	@Query("select s from Store s where id = :id")
	public Store find(@Param("id") Long id);
	
}
