package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.RunOrderDao;
import com.yuanlrc.base.dao.admin.StoreDao;
import com.yuanlrc.base.entity.admin.RunOrder;
import com.yuanlrc.base.entity.admin.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * 订单管理service
 * @author Administrator
 *
 */
@Service
public class RunOrderService {

	@Autowired
	private RunOrderDao runOrderDao;
	
	/**
	 * 根据订单id查询
	 * @param id
	 * @return
	 */
	public RunOrder find(Long id){
		return runOrderDao.find(id);
	}
	
	/**
	 * 按照订单编号查找订单
	 * @param orderNo
	 * @return
	 */
	public RunOrder findByOrderNo(String orderNo){
		return runOrderDao.findByOrderNo(orderNo);
	}
	
	/**
	 * 订单添加/编辑操作
	 * @param runOrder
	 * @return
	 */
	public RunOrder save(RunOrder runOrder){
		return runOrderDao.save(runOrder);
	}
	
	/**
	 * 分页查询订单列表
	 * @param runOrder
	 * @param pageBean
	 * @return
	 */
	public PageBean<RunOrder> findList(RunOrder runOrder,PageBean<RunOrder> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("orderNo", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status");
		Example<RunOrder> example = Example.of(runOrder, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<RunOrder> findAll = runOrderDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}

	/**
	 * 分页查询订单列表
	 * @param runOrder
	 * @param pageBean
	 * @return
	 */
	public PageBean<RunOrder> findOrderList(RunOrder runOrder,PageBean<RunOrder> pageBean){
		Specification<RunOrder> specification = new Specification<RunOrder>() {
			@Override
			public Predicate toPredicate(Root<RunOrder> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
				Predicate predicate = criteriaBuilder.like(root.get("orderNo"), runOrder.getOrderNo() == null ? "%%" : "%"+ runOrder.getOrderNo()+"%");
				Predicate equal = criteriaBuilder.equal(root.get("student").get("id"), runOrder.getStudent().getId());
				predicate = criteriaBuilder.and(predicate, equal);
				return predicate;
			}
		};
		Sort sort = Sort.by(Sort.Direction.DESC, "createTime");
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(),sort);
		Page<RunOrder> findAll = runOrderDao.findAll(specification, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	/**
	 * 按照订单id删除
	 * @param id
	 */
	public void delete(Long id){
		runOrderDao.deleteById(id);
	}
	
	/**
	 * 返回订单总数
	 * @return
	 */
	public long total(){
		return runOrderDao.count();
	}
}
