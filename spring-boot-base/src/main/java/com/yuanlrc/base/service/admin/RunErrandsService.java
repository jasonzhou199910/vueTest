package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.RunErrandsDao;
import com.yuanlrc.base.entity.admin.RunErrands;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

/**
 * 跑腿代购管理service
 * @author Administrator
 *
 */
@Service
public class RunErrandsService {

	@Autowired
	private RunErrandsDao runErrandsDao;
	
	/**
	 * 根据跑腿代购id查询
	 * @param id
	 * @return
	 */
	public RunErrands find(Long id){
		return runErrandsDao.find(id);
	}
	
	/**
	 * 按照跑腿代购名查找跑腿代购
	 * @param title
	 * @return
	 */
	public RunErrands findByTitle(String title){
		return runErrandsDao.findByTitle(title);
	}
	
	/**
	 * 跑腿代购添加/编辑操作
	 * @param runErrands
	 * @return
	 */
	public RunErrands save(RunErrands runErrands){
		return runErrandsDao.save(runErrands);
	}
	
	/**
	 * 分页查询跑腿代购列表
	 * @param runErrands
	 * @param pageBean
	 * @return
	 */
	public PageBean<RunErrands> findList(RunErrands runErrands,PageBean<RunErrands> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("title", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","commission");
		Example<RunErrands> example = Example.of(runErrands, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<RunErrands> findAll = runErrandsDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	/**
	 * 按照跑腿代购id删除
	 * @param id
	 */
	public void delete(Long id){
		runErrandsDao.deleteById(id);
	}
	
	/**
	 * 返回跑腿代购总数
	 * @return
	 */
	public long total(){
		return runErrandsDao.count();
	}
}
