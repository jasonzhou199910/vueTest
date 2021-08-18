package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Store;
import com.yuanlrc.base.entity.admin.User;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.StoreService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 后台店铺管理控制器
 * @author Administrator
 *
 */
@CrossOrigin
@RequestMapping("/admin/store")
@Controller
public class StoreController {


	@Autowired
	private OperaterLogService operaterLogService;


	@Autowired
	private StoreService storeService;


	/**
	 * 店铺列表页面
	 * @param store
	 * @param pageBean
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@PostMapping("/list")
	public Result<PageBean<Store>> list(@RequestBody Store store, PageBean<Store> pageBean){
		pageBean.setCurrentPage(store.getCurrentPage());
		pageBean.setPageSize(store.getPageSize());
		PageBean<Store> list = storeService.findList(store, pageBean);
		return Result.success(list);
	}

	/**
	 * 店铺添加表单提交处理
	 * @param store
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(@RequestBody  Store store){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(store);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(store.getStoreStatus()<=0){
			return Result.error(CodeMsg.ADMIN_STORE_STATUS_ERROR);
		}
		User loginedUser = SessionUtil.getLoginedUser();
		store.setUser(loginedUser);
		//到这说明一切符合条件，进行数据库新增
		if(storeService.save(store) == null){
			return Result.error(CodeMsg.ADMIN_STORE_ADD_ERROR);
		}
		operaterLogService.add("添加店铺，店铺名：" + store.getName());
		return Result.success(true);
	}

	/**
	 * 店铺编辑
	 * @param
	 * @return
	 */
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public Result<Store> edit(@RequestParam(name="id",required=true)Long id){
		Store store = storeService.find(id);
		return Result.success(store);
	}
	/**
	 * 编辑店铺信息表单提交处理
	 * @param store
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestBody Store store){
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(store);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(store.getId() == null || store.getId().longValue() <= 0){
			return Result.error(CodeMsg.ADMIN_STORE_NOT_EXIST_ERROR);
		}
		//到这说明一切符合条件，进行数据库保存
		Store store1 = storeService.find(store.getId());
		//讲提交的店铺信息指定字段复制到已存在的store对象中,该方法会覆盖新字段内容
		BeanUtils.copyProperties(store, store1, "id","createTime","updateTime","user");
		if(storeService.save(store1) == null){
			return Result.error(CodeMsg.ADMIN_STORE_EDIT_ERROR);
		}
		operaterLogService.add("编辑店铺，店铺名：" + store.getName());
		return Result.success(true);
	}
	
	/**
	 * 删除店铺
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			storeService.delete(id);
		} catch (Exception e) {
			return Result.error(CodeMsg.ADMIN_STORE_DELETE_ERROR);
		}
		operaterLogService.add("删除店铺，店铺ID：" + id);
		return Result.success(true);
	}
}
