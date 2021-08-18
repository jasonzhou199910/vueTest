package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Menu;
import com.yuanlrc.base.entity.admin.Role;
import com.yuanlrc.base.service.admin.MenuService;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.RoleService;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台角色管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/role")
@Controller
public class RoleController {

	
	private Logger log = LoggerFactory.getLogger(RoleController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	
	@Autowired
	private RoleService roleService;


	/**
	 * 角色列表展示页面
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<PageBean<Role>> list(@RequestBody  Role role, PageBean<Role> pageBean){
		pageBean.setCurrentPage(role.getCurrentPage());
		pageBean.setPageSize(role.getPageSize());
		PageBean<Role> byName = roleService.findByName(role, pageBean);
		return Result.success(byName);
	}

	
	/**
	 * 角色添加表单提交处理
	 * @param role
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(@RequestBody Role role){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(role);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(roleService.save(role) == null){
			return Result.error(CodeMsg.ADMIN_ROLE_ADD_ERROR);
		}
		log.info("添加角色【"+role+"】");
		operaterLogService.add("添加角色【"+role.getName()+"】");
		return Result.success(true);
	}


	/**
	 * 编辑赋值
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@GetMapping("/edit")
	public Role edit(@RequestParam(name = "id",required = true)Long id){
		Role role = roleService.find(id);
		return role;
	}
	
	/**
	 * 角色修改表单提交处理
	 * @param
	 * @param role
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestBody Role role){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(role);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		Role existRole = roleService.find(role.getId());
		if(existRole == null){
			return Result.error(CodeMsg.ADMIN_ROLE_NO_EXIST);
		}
		existRole.setName(role.getName());
		existRole.setRemark(role.getRemark());
		existRole.setStatus(role.getStatus());
		existRole.setAuthorities(role.getAuthorities());
		if(roleService.save(existRole) == null){
			return Result.error(CodeMsg.ADMIN_ROLE_EDIT_ERROR);
		}
		log.info("编辑角色【"+role+"】");
		operaterLogService.add("编辑角色【"+role.getName()+"】");
		return Result.success(true);
	}
	
	/**
	 * 删除角色
	 * @param
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			 roleService.deleleRoleAuthori(id);
			 roleService.delete(id);
		} catch (Exception e) {
			// TODO: handle exception
			return Result.error(CodeMsg.ADMIN_ROLE_DELETE_ERROR);
		}
		log.info("删除角色ID【"+id+"】");
		operaterLogService.add("删除角色ID【"+id+"】");
		return Result.success(true);
	}

	@CrossOrigin
	@ResponseBody
	@GetMapping("/findAll")
	public Result<List<Role>>findAllRole(){
		return Result.success(roleService.findAll());
	}

	/**
	 * 编辑角色
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@GetMapping("/edit_role/{id}")
	public Result<Map<String,List<Menu>>> editRole(@PathVariable("id")long id){
		Map<String, List<Menu>> queryMap = new HashMap<>();
		Role role = roleService.find(id);
		List<Menu> authorities = role.getAuthorities();
		List<Menu> all = menuService.findAll();
		queryMap.put("currentMenu",authorities);
		queryMap.put("allMenu",all);
		return Result.success(queryMap);
	}
}
