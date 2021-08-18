package com.yuanlrc.base.controller.home;

import com.yuanlrc.base.bean.LoginType;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Menu;
import com.yuanlrc.base.entity.admin.Student;
import com.yuanlrc.base.entity.admin.User;
import com.yuanlrc.base.service.admin.MenuService;
import com.yuanlrc.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 前台首页控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/home/index")
@Controller
public class HomeIndexController {


	@Autowired
	private MenuService menuService;

	@GetMapping("/index")
	public String index(Model model){
		return "home/index/index";
	}

	@CrossOrigin
	@ResponseBody
	@GetMapping("/get_menu_button")
	public Result<List<Menu>> getMenuButton(@RequestParam(name = "url")String url){
		Object loginType = SessionUtil.get("LoginType");
		int loginTypes = Integer.parseInt(loginType.toString());
		List<Menu> menuButton=new ArrayList<>();
		if(loginTypes== LoginType.ADMIN.getCode()){
			User loginedUser = SessionUtil.getLoginedUser();
			menuButton = loginedUser.getRole().getAuthorities();
		}else{
			Student student = SessionUtil.getStudent();
			menuButton = student.getRole().getAuthorities();
		}
		List<Menu> menus = menuButton.stream().filter(menu -> menu.getUrl().contains(url)).filter(menu->!menu.getUrl().contains("list")).collect(Collectors.toList());
		/*List<Menu> byUrlContainsAndButton = menuService.findByMenuList(url);*/
		return Result.success(menus);
	}

}
