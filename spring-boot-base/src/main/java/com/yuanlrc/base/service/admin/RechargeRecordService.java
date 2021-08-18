package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.RechargeRecordDao;
import com.yuanlrc.base.dao.admin.StudentDao;
import com.yuanlrc.base.entity.admin.RechargeRecord;
import com.yuanlrc.base.entity.admin.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

/**
 * 充值记录管理service
 * @author Administrator
 *
 */
@Service
public class RechargeRecordService {

	@Autowired
	private RechargeRecordDao rechargeRecordDao;
	
	/**
	 * 根据充值记录id查询
	 * @param id
	 * @return
	 */
	public RechargeRecord find(Long id){
		return rechargeRecordDao.find(id);
	}

	
	/**
	 * 充值记录添加/编辑操作
	 * @param rechargeRecord
	 * @return
	 */
	public RechargeRecord save(RechargeRecord rechargeRecord){
		return rechargeRecordDao.save(rechargeRecord);
	}
	
	/**
	 * 分页查询充值记录列表
	 * @param rechargeRecord
	 * @param pageBean
	 * @return
	 */
	public PageBean<RechargeRecord> findList(RechargeRecord rechargeRecord,PageBean<RechargeRecord> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("student.name", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status");
		Example<RechargeRecord> example = Example.of(rechargeRecord, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<RechargeRecord> findAll = rechargeRecordDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}

	
	/**
	 * 按照充值记录id删除
	 * @param id
	 */
	public void delete(Long id){
		rechargeRecordDao.deleteById(id);
	}
	
	/**
	 * 返回充值记录总数
	 * @return
	 */
	public long total(){
		return rechargeRecordDao.count();
	}


}
