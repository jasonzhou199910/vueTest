package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.OrderStatus;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.admin.RunErrands;
import com.yuanlrc.base.entity.admin.Student;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.RunErrandsService;
import com.yuanlrc.base.service.admin.StoreService;
import com.yuanlrc.base.service.admin.StudentService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.aspectj.apache.bcel.classfile.Code;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

/**
 * 后台跑腿代购管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/runErrands")
@Controller
public class RunErrandsController {


	@Autowired
	private OperaterLogService operaterLogService;


	@Autowired
	private StoreService storeService;

	@Autowired
	private RunErrandsService runErrandsService;

	@Autowired
	private StudentService studentService;


	@Value("${ylrc.runerrand.bond}")
	private BigDecimal bond;

	/**
	 * 跑腿代购列表页面
	 * @param runErrands
	 * @param pageBean
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<PageBean<RunErrands>> list(@RequestBody RunErrands runErrands, PageBean<RunErrands> pageBean){
		pageBean.setCurrentPage(runErrands.getCurrentPage());
		pageBean.setPageSize(runErrands.getPageSize());
		PageBean<RunErrands> list = runErrandsService.findList(runErrands, pageBean);
		return Result.success(list);
	}

	/**
	 * 跑腿代购添加表单提交处理
	 * @param runErrands
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Student> add(@RequestBody  RunErrands runErrands){
		//先去判断学生是否已交押金
		Student student = SessionUtil.getStudent();
		int depositStatus = student.getDepositStatus();
		if(depositStatus==Student.ADMIN_STUDENT_DEPOSIT_STATUS_OFF){
			return Result.error(CodeMsg.ADMIN_STUDENT_DEPOSITSTATUS_ERROR);
		}
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(runErrands);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		runErrands.setStatus(OrderStatus.RELEASE.getCode());
		runErrands.setStudent(student);
		//扣除发布人的余额
		BigDecimal balance = student.getBalance();
		//任务佣金
		BigDecimal commission = runErrands.getCommission();
		BigDecimal subtract = balance.subtract(commission);
		if(subtract.compareTo(BigDecimal.ZERO)==-1){
			return Result.error(CodeMsg.ADMIN_RUNERRANDS_BOND_ERROR);
		}
		//到这说明一切符合条件，进行数据库新增
		if(runErrandsService.save(runErrands) == null){
			return Result.error(CodeMsg.ADMIN_RUNERRANDS_ADD_ERROR);
		}
		student.setBalance(subtract);
		if(studentService.updateBalance(student.getId(), subtract)<=0){
			return Result.error(CodeMsg.ADMIN_STUDENT_BALANCE_UPDATE_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,student);
		operaterLogService.add("添加跑腿代购，跑腿代购标题：" + runErrands.getTitle());
		return Result.success(student);
	}

	/**
	 * 跑腿代购编辑
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public Result<RunErrands> edit(@RequestParam(name="id",required=true)Long id){
		RunErrands runErrands = runErrandsService.find(id);
		return Result.success(runErrands);
	}
	/**
	 * 编辑跑腿代购信息表单提交处理
	 * @param runErrands
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestBody RunErrands runErrands){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(runErrands);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(runErrands.getId() == null || runErrands.getId().longValue() <= 0){
			return Result.error(CodeMsg.ADMIN_RUNERRANDS_NOT_EXIST_ERROR);
		}
		//到这说明一切符合条件，进行数据库保存
		RunErrands runErrands1 = runErrandsService.find(runErrands.getId());
		//这个查询出来的 表示所有的字段

		//讲提交的跑腿代购信息指定字段复制到已存在的store对象中,该方法会覆盖新字段内容
		BeanUtils.copyProperties(runErrands, runErrands1, "id","createTime","updateTime","student");
		if(runErrandsService.save(runErrands1) == null){
			return Result.error(CodeMsg.ADMIN_RUNERRANDS_EDIT_ERROR);
		}
		operaterLogService.add("编辑跑腿代购，跑腿代购标题：" + runErrands.getTitle());
		return Result.success(true);
	}
	
	/**
	 * 删除跑腿代购
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			runErrandsService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_RUNERRANDS_DELETE_ERROR);
		}
		operaterLogService.add("删除跑腿代购，跑腿代购ID：" + id);
		return Result.success(true);
	}


	/**
	 * 交付押金 默认押金是300
	 * @return
	 */
	@ResponseBody
	@CrossOrigin
	@PostMapping("/deposit_payment")
	public Result<Student>  depositPayment(){
		Student student = SessionUtil.getStudent();
		//学生的余额
		BigDecimal balance = student.getBalance();
		//bond押金
		BigDecimal currentBalance = balance.subtract(bond);
		if(currentBalance.compareTo(BigDecimal.ZERO)==-1){
			return Result.error(CodeMsg.ADMIN_STUDENT_BOND_ERROR);
		}
		//扣除余额  更新余额 更新押金状态
		student.setBalance(currentBalance);
		student.setDepositStatus(Student.ADMIN_STUDENT_DEPOSIT_STATUS_ON);
		if(studentService.updateBalanceAndStatus(student)<=0){
			return Result.error(CodeMsg.ADMIN_STUDENT_DEPOSITSTATUS_BUY_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,student);
		return Result.success(student);
	}
}
