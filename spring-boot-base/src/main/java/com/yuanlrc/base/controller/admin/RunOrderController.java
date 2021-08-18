package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.OrderStatus;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.admin.*;
import com.yuanlrc.base.service.admin.*;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.UUID;

/**
 * 后台订单管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/runOrder")
@Controller
public class RunOrderController {


	@Autowired
	private OperaterLogService operaterLogService;


	@Autowired
	private StoreService storeService;

	@Autowired
	private RunOrderService runOrderService;

	@Autowired
	private RunErrandsService runErrandsService;

	@Autowired
	private StudentService studentService;

	/**
	 * 订单列表页面
	 * @param runOrder
	 * @param pageBean
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<PageBean<RunOrder>> list(@RequestBody RunOrder runOrder, PageBean<RunOrder> pageBean){
		Student student = SessionUtil.getStudent();
		runOrder.setStudent(student);
		PageBean<RunOrder> list = runOrderService.findOrderList(runOrder, pageBean);
		return Result.success(list);
	}

	/**
	 * 订单添加表单提交处理
	 * @param runOrder
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(@RequestBody  RunOrder runOrder){
		//用统一验证实体方法验证是否合法
		//获取跑腿信息
		RunErrands runErrands = runErrandsService.find(runOrder.getId());
		Student student = SessionUtil.getStudent();
		Long id = runErrands.getStudent().getId();
		if(student.getId().longValue()==id.longValue()){
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_STUDENT_ERROR);
		}
		String orderNo =StringUtil.gneerateSn("o","");
		runOrder.setStudent(student);
		runOrder.setOrderNo(orderNo);
		runOrder.setRunErrands(runErrands);
		runOrder.setId(null);
		runOrder.setStatus(OrderStatus.INCOMPLETE.getCode());
		//到这说明一切符合条件，进行数据库新增
		if(runOrderService.save(runOrder) == null){
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_ADD_ERROR);
		}
		//修改跑腿的状态
		runErrands.setStatus(OrderStatus.RECEIVED.getCode());
		runErrandsService.save(runErrands);
		operaterLogService.add("添加订单，订单编号：" + runOrder.getOrderNo());
		return Result.success(true);
	}

	/**
	 * 订单编辑
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public Result<RunOrder> edit(@RequestParam(name="id",required=true)Long id){
		RunOrder runOrder = runOrderService.find(id);
		return Result.success(runOrder);
	}

	/**
	 * 删除订单
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			runOrderService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_DELETE_ERROR);
		}
		operaterLogService.add("删除订单，订单ID：" + id);
		return Result.success(true);
	}

	/**
	 * 完成操作
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@PostMapping("/end")
	@ResponseBody
	public Result<Student> endStatus(@RequestParam(name="id",required=true)Long id){
		Student student = SessionUtil.getStudent();
		RunOrder runOrder = runOrderService.find(id);
		runOrder.setStatus(OrderStatus.COMPLETED.getCode());
		if(runOrder.getStatus()==OrderStatus.COMPLETED.getCode()){
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_END_ERROR);
		}
		//更新接单记录状态
		if(runOrderService.save(runOrder)==null){
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_STATUS_ERRO);
		}
		//更新跑腿订单状态
		RunErrands runErrands = runOrder.getRunErrands();
		//佣金
		BigDecimal commission = runErrands.getCommission();
		//学生的当前余额
		BigDecimal currentBalance = student.getBalance().add(commission);
		student.setBalance(currentBalance);
		if(studentService.updateBalance(student.getId(), currentBalance)<=0){
			return Result.error(CodeMsg.ADMIN_STUDENT_BALANCE_UPDATE_ERROR);
		}
		runErrands.setStatus(OrderStatus.COMPLETED.getCode());
		if(runErrandsService.save(runErrands)==null){
			return Result.error(CodeMsg.ADMIN_RUN_ORDER_STATUS_ERRO);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,student);
		return Result.success(student);
	}
}
