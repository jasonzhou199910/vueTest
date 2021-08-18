package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.StudentDao;
import com.yuanlrc.base.entity.admin.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * 学生管理service
 * @author Administrator
 *
 */
@Service
public class StudentService {

	@Autowired
	private StudentDao studentDao;
	
	/**
	 * 根据学生id查询
	 * @param id
	 * @return
	 */
	public Student find(Long id){
		return studentDao.find(id);
	}
	
	/**
	 * 按照学生名查找学生
	 * @param name
	 * @return
	 */
	public Student findByName(String name){
		return studentDao.findByName(name);
	}
	
	/**
	 * 学生添加/编辑操作
	 * @param student
	 * @return
	 */
	public Student save(Student student){
		return studentDao.save(student);
	}
	
	/**
	 * 分页查询学生列表
	 * @param student
	 * @param pageBean
	 * @return
	 */
	public PageBean<Student> findList(Student student,PageBean<Student> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","sex","balance","depositStatus");
		Example<Student> example = Example.of(student, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<Student> findAll = studentDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	
	/**
	 * 判断学生名是否存在，添加和编辑均可判断
	 * @param name
	 * @param id
	 * @return
	 */
	public boolean isExistUsername(String name,Long id){
		Student student = studentDao.findByName(name);
		if(student != null){
			//表示学生名存在，接下来判断是否是编辑学生的本身
			if(student.getId().longValue() != id.longValue()){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 按照学生id删除
	 * @param id
	 */
	public void delete(Long id){
		studentDao.deleteById(id);
	}
	
	/**
	 * 返回学生总数
	 * @return
	 */
	public long total(){
		return studentDao.count();
	}

	/**
	 * 根据学生编号查询
	 * @param studentNumber
	 * @return
	 */
	public Student findByStudentNumber(String studentNumber){
		return studentDao.findByStudentNumber(studentNumber);
	}

	/**
	 * 根据身份证号查询学生
	 * @param card
	 * @return
	 */
	public Student findByCard(String card){
		return studentDao.findByCard(card);
	}


	/**
	 * 更新学生金额
	 * @param id
	 * @param balance
	 * @return
	 */
	public int updateBalance(Long id,BigDecimal balance){
	return studentDao.updateBalance(id,balance);
	}



	public int updateBalanceAndStatus(Student student){
		return studentDao.updateBalanceAndStatus(student);
	}
}
