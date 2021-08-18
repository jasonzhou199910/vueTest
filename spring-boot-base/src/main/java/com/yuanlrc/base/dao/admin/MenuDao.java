package com.yuanlrc.base.dao.admin;
/**
 * 后台菜单数据库操作层
 */
import com.yuanlrc.base.entity.admin.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao extends JpaRepository<Menu, Long> {
	@Query("select m from Menu m where m.id = :id")
	Menu find(@Param("id")Long id);


	@Query(value = "select * from ylrc_menu where url like %?1% and is_bitton=1",nativeQuery = true)
	List<Menu> findByMenuList(@Param("url")String url);
}
