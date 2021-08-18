package com.yuanlrc.base.dao.admin;
/**
 * 后台角色数据库操作层
 */

import com.yuanlrc.base.entity.admin.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public interface RoleDao extends JpaRepository<Role, Long> {
	@Query("select r from Role r where r.id = :id")
	Role find(@Param("id")Long id);

	@Transactional(rollbackFor = Exception.class)
	@Modifying
	@Query(value ="delete from ylrc_role_authorities where role_id=:id",nativeQuery = true)
	void deleleRoleAuthori(@Param("id")Long id);

	@Query(value = "select sum(role_id) as roleType from ylrc_user group by role_id",nativeQuery = true)
	List<Object> findRoleType();

	@Query(value = "select count(id) as count from ylrc_user where role_id=:roleId",nativeQuery = true)
	Long findByRoleId(@Param("roleId")Long roleId);
}
