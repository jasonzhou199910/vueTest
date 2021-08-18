package com.yuanlrc.base.controller.admin;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.LoginType;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.admin.*;
import com.yuanlrc.base.listener.SessionListener;
import com.yuanlrc.base.service.admin.*;
import com.yuanlrc.base.util.MenuUtil;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.apache.bcel.classfile.Code;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * 系统控制器
 *
 * @author Administrator
 */
@CrossOrigin
@RequestMapping("/system")
@Controller
public class SystemController {


	@Autowired
	private OperaterLogService operaterLogService;

	@Autowired
	private UserService userService;

	@Autowired
	private DatabaseBakService databaseBakService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private OrderAuthService orderAuthService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private RechargeRecordService rechargeRecordService;

	private Logger log = LoggerFactory.getLogger(SystemController.class);

	/**
	 * 登录页面
	 *
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "admin/system/login";
	}

	/**
	 * 管理员登录
	 * @param user
	 * @param request
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/login")
	public Result<User> login(@Validated @RequestBody User user, HttpServletRequest request) {
		Map<String, String> ret = new HashMap<String, String>();
		if (user == null) {
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(user);
		if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
			return Result.error(validate);
		}
		//表示验证码正确，开始查询数据库，检验密码是否正确
		User byUsername = userService.findByUsername(user.getUsername());
		if (byUsername == null) {
			return Result.error(CodeMsg.ADMIN_USERNAME_NO_EXIST);
		}
		//表示用户存在 进一步对比密码是否正确
		if (!byUsername.getPassword().equals(user.getPassword())) {
			return Result.error(CodeMsg.ADMIN_PASSWORD_ERROR);
		}
		//表示密码正确，将登录信息放入session中 并判断状态是否可用
		if (byUsername.getStatus() != byUsername.ADMIN_USER_STATUS_ENABLE) {
			return Result.error(CodeMsg.ADMIN_USER_ROLE_UNABLE);
		}
		//检查用户是否有角色 状态是否被冻结
		if (byUsername.getRole() == null || byUsername.getRole().getStatus() != Role.ADMIN_ROLE_STATUS_ENABLE) {
			return Result.error(CodeMsg.ADMIN_USER_UNABLE);
		}
		//检查用户有哪些权限
		if (byUsername.getRole().getAuthorities() == null || byUsername.getRole().getAuthorities().size() == 0) {
			return Result.error(CodeMsg.ADMIN_USER_ROLE_AUTHORITES_EMPTY);
		}
		//检查一切符合 可以登录
		request.getSession().setAttribute("LoginType", LoginType.ADMIN.getCode());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, byUsername);
		//销毁session中的验证码
		request.getSession().setAttribute("admin_login", null);

		//将登录日志写入日志库
		OperaterLog operaterLog = new OperaterLog();
		operaterLog.setOperator(user.getUsername());
		operaterLog.setContent("用户[" + user.getUsername() + "]与[" + StringUtil.getFormatterDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "]登录系统");
		operaterLogService.save(operaterLog);
		log.info("用户成功登录,user=" + byUsername);
		return Result.success(byUsername);
	}

	/**
	 * 学生登录
	 * @param
	 * @param request
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/student_login")
	public Result<Student> studentLogin(@Validated @RequestBody Student student, HttpServletRequest request) {
		if (student == null) {
			return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
		}
		if(StringUtils.isEmpty(student.getStudentNumber())){
			return Result.error(CodeMsg.ADMIN_STUDENT_LOGIN_NUMBER_ERROR);
		}
		if(StringUtils.isEmpty(student.getPassword())){
			return Result.error(CodeMsg.ADMIN_STUDENT_LOGIN_PASSWORD_ERROR);
		}
		//表示验证码正确，开始查询数据库，检验密码是否正确
		Student byStudentNumber = studentService.findByStudentNumber(student.getStudentNumber());
		if (byStudentNumber == null) {
			return Result.error(CodeMsg.ADMIN_STUDENT_NO_EXIST);
		}
		//表示学生存在 进一步对比密码是否正确
		if (!byStudentNumber.getPassword().equals(student.getPassword())) {
			return Result.error(CodeMsg.ADMIN_PASSWORD_ERROR);
		}
		//表示密码正确，将登录信息放入session中 并判断状态是否可用
		if (byStudentNumber.getStatus() != Student.ADMIN_USER_STATUS_ENABLE) {
			return Result.error(CodeMsg.ADMIN_STUDENT_UNABLE);
		}
		//检查学生是否有角色 状态是否被冻结
		if (byStudentNumber.getRole() == null || byStudentNumber.getRole().getStatus() != Role.ADMIN_ROLE_STATUS_ENABLE) {
			return Result.error(CodeMsg.ADMIN_USER_ROLE_UNABLE);
		}
		//检查用户有哪些权限
		if (byStudentNumber.getRole().getAuthorities() == null || byStudentNumber.getRole().getAuthorities().size() == 0) {
			return Result.error(CodeMsg.ADMIN_STUDENT_ROLE_AUTHORITES_EMPTY);
		}
		//检查一切符合 可以登录
		request.getSession().setAttribute("LoginType",LoginType.STUDENT.getCode());
		request.getSession().setAttribute(SessionConstant.SESSION_STUDENT_LOGIN_KEY, byStudentNumber);
		//销毁session中的验证码
		//将登录日志写入日志库
		OperaterLog operaterLog = new OperaterLog();
		operaterLog.setOperator(byStudentNumber.getName());
		operaterLog.setContent("学生[" + byStudentNumber.getName() + "]与[" + StringUtil.getFormatterDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "]登录系统");
		operaterLogService.save(operaterLog);
		log.info("学生成功登录,user=" + byStudentNumber.getStudentNumber());
		return Result.success(byStudentNumber);
	}


	/**
	 * 登录成功后的系统主页
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(Model model) {
		model.addAttribute("operatorLogs", operaterLogService.findLastestLog(10));
		model.addAttribute("userTotal", userService.total());
		model.addAttribute("operatorLogTotal", operaterLogService.total());
		model.addAttribute("databaseBackupTotal", databaseBakService.total());
		model.addAttribute("onlineUserTotal", SessionListener.onlineUserCount);
		return "admin/system/index";
	}

	/**
	 * Vue 首页
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/vue_index")
	public Result<List<Long>> index(){
		long userTotal = userService.total();
		long operatorTotal = operaterLogService.total();
		long sessionUserTotal = SessionListener.onlineUserCount;
		List<Long> ret = new ArrayList<>();
		ret.add(userTotal);
		ret.add(operatorTotal);
		ret.add(sessionUserTotal);
		Long byRoleId = roleService.findByRoleId(1l);
		ret.add(byRoleId);
		long total = studentService.total();
		ret.add(total);
		OrderAuth one = orderAuthService.findOne();
		if(one!=null){
			ret.add(1l);
		}else{
			ret.add(0l);
		}
		return Result.success(ret);
	}

	/**
	 * 最近系统的操作日志
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/vue_operator")
	public Result<List<OperaterLog>>findOperator(){
		List<OperaterLog> lastestLog = operaterLogService.findLastestLog(10);
		return  Result.success(lastestLog);
	}

	/**
	 * 注销登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout() {
		User loginedUser = SessionUtil.getLoginedUser();
		if (loginedUser != null) {
			SessionUtil.set(SessionConstant.SESSION_USER_LOGIN_KEY, null);
		}
		return "redirect:login";
	}

	/**
	 * 无权限提示页面
	 *
	 * @return
	 */
	@RequestMapping(value = "/no_right")
	public String noRight() {
		return "admin/system/no_right";
	}

	/**
	 * 修改用户个人信息
	 *
	 * @return
	 */
	@RequestMapping(value = "/update_userinfo", method = RequestMethod.GET)
	public String updateUserInfo() {
		return "admin/system/update_userinfo";
	}


	/**
	 * 修改个人信息保存
	 *
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/update_userinfo", method = RequestMethod.POST)
	public String updateUserInfo(User user) {
		User loginedUser = SessionUtil.getLoginedUser();
		loginedUser.setEmail(user.getEmail());
		loginedUser.setMobile(user.getMobile());
		loginedUser.setHeadPic(user.getHeadPic());
		//首先保存到数据库
		userService.save(loginedUser);
		//更新session里的值
		SessionUtil.set(SessionConstant.SESSION_USER_LOGIN_KEY, loginedUser);
		return "redirect:update_userinfo";
	}

	/**
	 * 修改个人信息
	 * @param user
	 * @return
	 */
	@ResponseBody
	@PostMapping("/update_personal_info")
	public Result<User> updatePersonalInfo(@RequestBody User user){
		User loginedUser = SessionUtil.getLoginedUser();
		loginedUser.setEmail(user.getEmail());
		loginedUser.setMobile(user.getMobile());
		loginedUser.setHeadPic(user.getHeadPic());
		loginedUser.setSex(user.getSex());
		userService.save(loginedUser);
		SessionUtil.set(SessionConstant.SESSION_USER_LOGIN_KEY, loginedUser);
		return Result.success(loginedUser);
	}
	/**
	 * 修改学生信息
	 * @param student
	 * @return
	 */
	@ResponseBody
	@PostMapping("/update_student_info")
	public Result<Student> updateStudentInfo(@RequestBody Student student){
		Student student1 = SessionUtil.getStudent();
		student1.setEmail(student.getEmail());
		student1.setMobile(student.getMobile());
		student1.setHeadPic(student.getHeadPic());
		student1.setSex(student.getSex());
		studentService.save(student1);
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY, student1);
		return Result.success(student1);
	}

	/**
	 * 充值金额
	 * @param money
	 * @return
	 */
	@PostMapping("/rechargeMoney/{money}")
	@ResponseBody
	public Result<Student>rechargeMoney(@PathVariable(name = "money")BigDecimal money){
		//拿到session里面的个人信息
		Student student = SessionUtil.getStudent();
		if(student==null){
			return Result.error(CodeMsg.USER_SESSION_EXPIRED);
		}
		if(money.compareTo(BigDecimal.ZERO)==-1){
			return Result.error(CodeMsg.ADMIN_STUDENT_RECHARGE_RECORD_MONEY_ERROR);
		}
		RechargeRecord rechargeRecord = new RechargeRecord();
		rechargeRecord.setStudent(student);
		rechargeRecord.setMoney(money);
		rechargeRecord.setStatus(1);
		if(rechargeRecordService.save(rechargeRecord)==null){
			return Result.error(CodeMsg.ADMIN_STUDENT_RECHARGE_RECORD_ADD_ERROR);
		}
		//把student的金额更新一下
		student.setBalance(student.getBalance().add(money));
		if(studentService.save(student)==null){
			return Result.error(CodeMsg.ADMIN_STUDENT_UPDATE_BALANCE_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_STUDENT_LOGIN_KEY,student);
		return Result.success(student);
	}
	/**
	 * 修改密码
	 * @param password
	 * @param
	 * @return
	 */
	@ResponseBody
	@PostMapping("/update_password")
	public Result<Boolean> updatePassword(@RequestBody String password){
		Map map = JSON.parseObject(password,Map.class);
		Object loginType = SessionUtil.get("LoginType");
		if(loginType==null){
			return Result.error(CodeMsg.USER_SESSION_EXPIRED);
		}
		int loginTypes = Integer.parseInt(loginType.toString());
		long id = Long.valueOf(String.valueOf(map.get("id")));
		String newPassword = map.get("newPassword").toString();
		String passwords = map.get("password").toString();
		if(loginTypes==LoginType.ADMIN.getCode()){
			User user = userService.find(id);
			if(!user.getPassword().equals(passwords)){
				return Result.error(CodeMsg.ADMIN_USER_UPDATE_PWD_ERROR);
			}
			user.setPassword(newPassword);
			if(userService.save(user)==null){
				return Result.error(CodeMsg.ADMIN_USER_UPDATE_PASSWORD_SAVE_ERROR);
			}
		}else{
			Student student = studentService.find(id);
			if(!student.getPassword().equals(passwords)){
				return Result.error(CodeMsg.ADMIN_USER_UPDATE_PWD_ERROR);
			}
			student.setPassword(newPassword);
			if(studentService.save(student)==null){
				return Result.error(CodeMsg.ADMIN_USER_UPDATE_PASSWORD_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}


	/**
	 * 修改密码页面
	 *
	 * @return
	 */
	@RequestMapping(value = "/update_pwd", method = RequestMethod.GET)
	public String updatePwd() {
		return "admin/system/update_pwd";
	}

	/**
	 * 修改密码表单提交
	 *
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@RequestMapping(value = "/update_pwd", method = RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updatePwd(@RequestParam(name = "oldPwd", required = true) String oldPwd,
	                                 @RequestParam(name = "newPwd", required = true) String newPwd
	) {
		User loginedUser = SessionUtil.getLoginedUser();
		if (!loginedUser.getPassword().equals(oldPwd)) {
			return Result.error(CodeMsg.ADMIN_USER_UPDATE_PWD_ERROR);
		}
		if (StringUtils.isEmpty(newPwd)) {
			return Result.error(CodeMsg.ADMIN_USER_UPDATE_PWD_EMPTY);
		}
		loginedUser.setPassword(newPwd);
		//保存数据库
		userService.save(loginedUser);
		//更新session
		SessionUtil.set(SessionConstant.SESSION_USER_LOGIN_KEY, loginedUser);
		return Result.success(true);
	}

	@CrossOrigin
	@RequestMapping(value="/auth_order",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> authOrder(@RequestParam(name="orderSn",required=true)String orderSn,@RequestParam(name="phone",required=true)String phone){
		if(orderSn.length() < 18){
			return Result.error(CodeMsg.ORDER_SN_ERROR);
		}
		if(phone.length() < 11){
			return Result.error(CodeMsg.PHONE_ERROR);
		}
		if(!StringUtil.authOrder(orderSn, phone)){
			return Result.error(CodeMsg.ORDER_AUTH_ERROR);
		}
		OrderAuth orderAuth = new OrderAuth();
		orderAuth.setMac(StringUtil.getMac());
		orderAuth.setOrderSn(orderSn);
		orderAuth.setPhone(phone);
		orderAuthService.save(orderAuth);
		return Result.success(true);
	}
	/**
	 * 日志管理列表
	 *
	 * @param model
	 * @param operaterLog
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value = "/operator_log_list")
	public String operatorLogList(Model model, OperaterLog operaterLog, PageBean<OperaterLog> pageBean) {
		model.addAttribute("pageBean", operaterLogService.findList(operaterLog, pageBean));
		model.addAttribute("operator", operaterLog.getOperator());
		model.addAttribute("title", "日志列表");
		return "admin/system/operator_log_list";
	}

	/**
	 * Vue 日志列表
	 * @param operaterLog
	 * @param pageBean
	 * @return
	 */
	@ResponseBody
	@PostMapping("/log_list")
	@CrossOrigin
	public Result<PageBean<OperaterLog>> logList(@RequestBody OperaterLog operaterLog, PageBean<OperaterLog> pageBean) {
		pageBean.setCurrentPage(operaterLog.getCurrentPage());
		pageBean.setPageSize(operaterLog.getPageSize());
		PageBean<OperaterLog> list = operaterLogService.findList(operaterLog, pageBean);
		return Result.success(list);
	}

	/**
	 * 删除操作日志，可删除多个
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete_operator_log", method = RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestBody String ids) {
		if (!StringUtils.isEmpty(ids)) {
			String[] splitIds = ids.split(",");
			for (String id : splitIds) {
				operaterLogService.delete(Long.valueOf(id));
			}
		}
		return Result.success(true);
	}

	/**
	 * 清空整个日志
	 *
	 * @return
	 */
	@RequestMapping(value = "/delete_all_operator_log", method = RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteAll() {
		operaterLogService.deleteAll();
		return Result.success(true);
	}

	/**
	 * 获取左侧菜单菜单
	 * @return
	 */
	@ResponseBody
	@CrossOrigin
	@GetMapping("/vue_menu")
	public Result<Map<String,List<Menu>>> findMenu(@RequestParam(name = "id")Long id){
		Object loginType = SessionUtil.get("LoginType");
		Map<String, List<Menu>> ret = new HashMap<>();
		int loginTypes=0;
		if(loginType!=null){
			loginTypes=(int)loginType;
		}
		List<Menu> authorities=new ArrayList<>();
		List<Menu> topMenus=new ArrayList<>();
		List<Menu> secondMenus=new ArrayList<>();
		if(loginTypes==LoginType.ADMIN.getCode()){
			User user = userService.find(id);
			authorities = user.getRole().getAuthorities();
		}else if(loginTypes==LoginType.STUDENT.getCode()){
			Student student = studentService.find(id);
			authorities= student.getRole().getAuthorities();
		}
		topMenus = MenuUtil.getTopMenus(authorities);
		secondMenus= MenuUtil.getSecondMenus(authorities);
		ret.put("topMenus",topMenus);
		ret.put("secondMenus",secondMenus);
		return Result.success(ret);
	}
}
