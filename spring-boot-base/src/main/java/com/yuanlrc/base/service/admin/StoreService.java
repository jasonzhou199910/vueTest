package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.StoreDao;
import com.yuanlrc.base.entity.admin.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

/**
 * 店铺管理service
 * @author Administrator
 *
 */
@Service
public class StoreService {

	@Autowired
	private StoreDao storeDao;
	
	/**
	 * 根据店铺id查询
	 * @param id
	 * @return
	 */
	public Store find(Long id){
		return storeDao.find(id);
	}
	
	/**
	 * 按照店铺名查找店铺
	 * @param name
	 * @return
	 */
	public Store findByName(String name){
		return storeDao.findByName(name);
	}
	
	/**
	 * 店铺添加/编辑操作
	 * @param store
	 * @return
	 */
	public Store save(Store store){
		return storeDao.save(store);
	}
	
	/**
	 * 分页查询店铺列表
	 * @param store
	 * @param pageBean
	 * @return
	 */
	public PageBean<Store> findList(Store store,PageBean<Store> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","rent","deposit","storeStatus");
		Example<Store> example = Example.of(store, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<Store> findAll = storeDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	/**
	 * 按照店铺id删除
	 * @param id
	 */
	public void delete(Long id){
		storeDao.deleteById(id);
	}
	
	/**
	 * 返回店铺总数
	 * @return
	 */
	public long total(){
		return storeDao.count();
	}
}
