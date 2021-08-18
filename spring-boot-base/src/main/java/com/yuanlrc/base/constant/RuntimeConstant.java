package com.yuanlrc.base.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 系统运行时的常量
 * @author Administrator
 *
 */
public class RuntimeConstant {

	//后台登录拦截器无需拦截的url
	public static List<String> loginExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/system/login",
			"/system/log_list",
			"/system/student_login",
			"/system/auth_order",
			"/system/vue_menu",
			"/system/vue_index",
			"/system/vue_operator",
			"/system/update_personal_info",
			"/system/update_password",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/images/**",
			"/error",
			"/upload/upload_photo",
			"/photo/view",
			"/cpacha/generate_cpacha",
			"/admin/role/findAll",
			"/admin/menu/menu_add",
			"/admin/menu/menu_edit/**",
			"/admin/role/edit_role/**",
			"/admin/student/check_deposit_status/**",
			"/admin/runErrands/deposit_payment",
			"/system/update_student_info",
			"/admin/run_order/**"
	);
	//后台权限拦截器无需拦截的url
	public static List<String> authorityExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/system/login",
			"/system/log_list",
			"/system/vue_menu",
			"/system/student_login",
			"/system/auth_order",
			"/system/vue_operator",
			"/system/update_personal_info",
			"/system/vue_index",
			"/system/auth_order",
			"/system/update_password",
			"/system/index",
			"/system/no_right",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/images/**",
			"/error",
			"/cpacha/generate_cpacha",
			"/system/logout",
			"/system/update_userinfo",
			"/system/update_pwd",
			"/upload/upload_photo",
			"/photo/view",
			"/admin/role/findAll",
			"/admin/menu/menu_add",
			"/admin/menu/menu_edit/**",
			"/admin/role/edit_role/**",
			"/admin/student/check_deposit_status/**",
			"/system/rechargeMoney/**",
			"/admin/runErrands/deposit_payment",
			"/system/update_student_info",
			"/admin/runOrder/**"
	);

	//前台登录拦截器无需拦截的url
	public static List<String> homeLoginExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/**",
			"/home/css/**",
			"/home/fonts/**",
			"/home/js/**",
			"/home/images/**",
			"/system/**",
			"/error",
			"/photo/view",
			"/cpacha/generate_cpacha",
			"/upload/upload_photo",
			"/home/picture/**",
			"/system/rechargeMoney/**"
	);
	//前台全局拦截器无需拦截的url
	public static List<String> homeGlobalExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/**",
			"/home/css/**",
			"/home/fonts/**",
			"/home/js/**",
			"/home/images/**",
			"/system/**",
			"/error",
			"/photo/view",
			"/upload/upload_photo",
			"/cpacha/generate_cpacha",
			"/home/picture/**"
	);
}
