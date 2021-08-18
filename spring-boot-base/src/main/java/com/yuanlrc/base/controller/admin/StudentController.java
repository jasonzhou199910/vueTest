package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Role;
import com.yuanlrc.base.entity.admin.Student;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.RoleService;
import com.yuanlrc.base.service.admin.StudentService;
import com.yuanlrc.base.service.admin.UserService;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 后台学生管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/student")
@Controller
public class StudentController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private OperaterLogService operaterLogService;

	@Autowired
	private StudentService studentService;


	/**
	 * 学生列表页面
	 * @param student
	 * @param pageBean
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<PageBean<Student>> list(@RequestBody Student student, PageBean<Student> pageBean){
		pageBean.setCurrentPage(student.getCurrentPage());
		pageBean.setPageSize(student.getPageSize());
		PageBean<Student> list = studentService.findList(student, pageBean);
		return Result.success(list);
	}

	/**
	 * 学生添加表单提交处理
	 * @param student
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(@RequestBody  Student student){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(student);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		Role role = roleService.find(5l);
		student.setRole(role);
		if(student.getRole() == null || student.getRole().getId() == null){
			return Result.error(CodeMsg.ADMIN_USER_ROLE_EMPTY);
		}
		if(student.getPassword()==null){
			return Result.error(CodeMsg.ADMIN_STUDENT_PASSWORD_LENGT_ERROR);
		}
		//判断学生学号是否存在
		if(studentService.findByStudentNumber(student.getStudentNumber())!=null){
			return Result.error(CodeMsg.ADMIN_STUDENT_STUDENT_NUMBER_EXIST_ERROR);
		}
		//判断学生身份证号是否重复
		if(studentService.findByCard(student.getCard())!=null){
			return Result.error(CodeMsg.ADMIN_STUDENT_STUDENT_CATR_EXIST_ERROR);
		}
		student.setDepositStatus(Student.ADMIN_STUDENT_DEPOSIT_STATUS_OFF);
		//到这说明一切符合条件，进行数据库新增
		if(studentService.save(student) == null){
			return Result.error(CodeMsg.ADMIN_USE_ADD_ERROR);
		}
		operaterLogService.add("添加学生，学生名：" + student.getName());
		return Result.success(true);
	}

	/**
	 * 学生编辑
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public Result<Student> edit(@RequestParam(name="id",required=true)Long id){
		Student student = studentService.find(id);
		return Result.success(student);
	}
	/**
	 * 编辑学生信息表单提交处理
	 * @param student
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestBody Student student){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(student);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(student.getId() == null || student.getId().longValue() <= 0){
			return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
		}
		//到这说明一切符合条件，进行数据库保存
		Student findById = studentService.find(student.getId());
		//讲提交的学生信息指定字段复制到已存在的user对象中,该方法会覆盖新字段内容
		BeanUtils.copyProperties(student, findById, "id","createTime","updateTime","role","studentNumber","password","name","depositStatus");
		if(studentService.save(findById) == null){
			return Result.error(CodeMsg.ADMIN_STUDENT_EDIT_ERROR);
		}
		operaterLogService.add("编辑学生，学生名：" + student.getName());
		return Result.success(true);
	}
	
	/**
	 * 删除学生
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			studentService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_STUDENT_DELETE_ERROE);
		}
		operaterLogService.add("删除学生，学生ID：" + id);
		return Result.success(true);
	}

	/**
	 * 检查学生是否开通跑腿服务 就是 押金状态
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/check_deposit_status/{stuId}")
	public Result<Student> checkDepositStatus(@PathVariable("stuId")Long id){
		Student student = studentService.find(id);
		return Result.success(student);
	}
}
