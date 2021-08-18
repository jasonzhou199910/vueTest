package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Menu;
import com.yuanlrc.base.service.admin.MenuService;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.util.MenuUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台菜单管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/menu")
@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	

	/*@RequestMapping(value="/list")
	public String list(Model model){
		List<Menu> findAll = menuService.findAll();
		model.addAttribute("title","菜单列表");
		model.addAttribute("topMenus",MenuUtil.getTopMenus(findAll));
		model.addAttribute("secondMenus",MenuUtil.getSecondMenus(findAll));
		model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(findAll));
		return "admin/menu/list";
	}*/
	/**
	 * 菜单列表展示页面
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<List<Menu>> list(){
		List<Menu> findAll = menuService.findAll();
		return Result.success(findAll);
	}

	@CrossOrigin
	@ResponseBody
	@PostMapping("/menu_add")
	public Result<Map<String,List<Menu>>> add(){
		List<Menu> findAll = menuService.findAll();
		Map<String,List<Menu>> ret = new HashMap<String,List<Menu>>();
		List<Menu> topMenus = MenuUtil.getTopMenus(findAll);
		List<Menu> secondMenus = MenuUtil.getSecondMenus(findAll);
		ret.put("topMenus",topMenus);
		ret.put("secondMenus",secondMenus);
		return Result.success(ret);
	}
	
	/**
	 * 菜单添加提交表单处理
	 * @param menu
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(@RequestBody Menu menu){
		if(menu == null){
			Result.error(CodeMsg.DATA_ERROR);
		}
		Menu menu1 = menuService.find(menu.getParentId());
		menu.setParent(menu1);
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(menu);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(menu.getParent() != null){
			if(menu.getParent().getId() == null){
				menu.setParent(null);
			}
		}
		//表示验证都通过，开始添加数据库
		if(menuService.save(menu) == null){
			Result.error(CodeMsg.ADMIN_MENU_ADD_ERROR);
		}
		//数据库添加操作成功,记录日志
		operaterLogService.add("添加菜单信息【" + menu + "】");
		return Result.success(true);
	}
	
	/**
	 * 菜单编辑页面
	 * @param
	 * @param
	 * @return
	 */
	/*@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String eidt(Model model,@RequestParam(name="id",required=true)Long id){
		List<Menu> findAll = menuService.findAll();
		model.addAttribute("title","菜单列表");
		model.addAttribute("topMenus",MenuUtil.getTopMenus(findAll));
		model.addAttribute("secondMenus",MenuUtil.getSecondMenus(findAll));
		model.addAttribute("menu",menuService.find(id));
		return "admin/menu/edit";
	}*/
	@CrossOrigin
	@ResponseBody
	@GetMapping("/edit")
	public Result<Map<String,List<Menu>>> edit(@RequestParam(name = "id") Long id){
		List<Menu> findAll = menuService.findAll();
		Map<String,List<Menu>> ret = new HashMap<String,List<Menu>>();
		List<Menu> topMenus = MenuUtil.getTopMenus(findAll);
		List<Menu> secondMenus = MenuUtil.getSecondMenus(findAll);
		List<Menu> current = new ArrayList<>();
		 current.add(menuService.find(id));
		ret.put("topMenus",topMenus);
		ret.put("secondMenus",secondMenus);
		ret.put("menus",current);
		return Result.success(ret);
	}
	
	/**
	 * 菜单编辑页面表单提交处理
	 * @param
	 * @param menu
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestBody Menu menu){
		if(menu == null){
			Result.error(CodeMsg.DATA_ERROR);
		}
		if(menu.getId() == null){
			Result.error(CodeMsg.ADMIN_MENU_ID_EMPTY);
		}
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(menu);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(menu.getParentId() != null){
			Menu menu1 = menuService.find(menu.getParentId());
			menu.setParent(menu1);
		}else{
			menu.setParent(null);
		}
		Menu existMenu = menuService.find(menu.getId());
		if(existMenu == null){
			Result.error(CodeMsg.ADMIN_MENU_ID_ERROR);
		}
		//表示验证都通过，开始添加数据库
		existMenu.setIcon(menu.getIcon());
		existMenu.setName(menu.getName());
		existMenu.setParent(menu.getParent());
		existMenu.setSort(menu.getSort());
		existMenu.setUrl(menu.getUrl());
		existMenu.setButton(menu.isButton());
		existMenu.setShow(menu.isShow());
		if(menuService.save(existMenu) == null){
			Result.error(CodeMsg.ADMIN_MENU_ADD_ERROR);
		}
		//数据库添加操作成功,记录日志
		operaterLogService.add("编辑菜单信息【" + existMenu + "】");
		return Result.success(true);
	}
	
	/**
	 * 删除菜单信息
	 * @param
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/menuDelete/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@PathVariable(name = "id") Long id){
		try {
			menuService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_MENU_DELETE_ERROR);
		}
		//数据库添加操作成功,记录日志
		operaterLogService.add("删除菜单信息，菜单ID【" + id + "】");
		return Result.success(true);
	}
}
