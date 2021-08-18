package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.admin.RunErrands;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 跑腿代购数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface RunErrandsDao extends JpaRepository<RunErrands, Long>{
	
	/**
	 * 按照跑腿代购标题查找跑腿代购信息
	 * @param title
	 * @return
	 */
	public RunErrands findByTitle(String title);

	/**
	 * 根据跑腿代购id查询
	 * @param id
	 * @return
	 */
	@Query("select r from RunErrands r where id = :id")
	public RunErrands find(@Param("id") Long id);


}
