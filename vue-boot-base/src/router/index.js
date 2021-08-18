import Vue from 'vue'
import Router from 'vue-router'

import NotFount from '../views/NotFound'

Vue.use(Router);
export default new Router({
  /*两种模式 hash 和 history */
    mode: 'history',
    routes:[
    {
        path:'/goHome',
        //重定向
        redirect: '/main'
      },{
        path:"*",
        component: NotFount
      },
      {
        path: '/home',
        component: () => import('../components/common/Home.vue'),
        meta: { title: '自述文件' },
        children: [
          {
            path: '/dashboard',
            component: () => import(/* webpackChunkName: "dashboard" */ '../components/page/Dashboard.vue'),
            meta: { title: '系统首页' }
          },
          {
            path: '/menu',
            component: () => import( '../components/page/MenuTable.vue'),
            meta: { title: '菜单管理' }
          },
          {
            path: '/role',
            component: () => import(/* webpackChunkName: "tabs" */ '../components/page/RoleTable.vue'),
            meta: { title: '角色管理' }
          },
          {
            path: '/user',
            component: () => import(/* webpackChunkName: "tabs" */ '../components/page/UserTable.vue'),
            meta: { title: '用户管理' }
          },
          {
            path: '/log',
            component: () => import(/* webpackChunkName: "tabs" */ '../components/page/LogTable.vue'),
            meta: { title: '日志管理' }
          },
          {
            // markdown组件
            path: '/markdown',
            component: () => import(/* webpackChunkName: "markdown" */ '../components/page/Markdown.vue'),
            meta: { title: 'markdown编辑器' }
          },
          {
            // 图片上传组件
            path: '/upload',
            component: () => import(/* webpackChunkName: "upload" */ '../components/page/Upload.vue'),
            meta: { title: '文件上传' }
          },
          {
            // vue-schart组件
            path: '/charts',
            component: () => import(/* webpackChunkName: "chart" */ '../components/page/BaseCharts.vue'),
            meta: { title: 'schart图表' }
          },
          {
            // 拖拽列表组件
            path: '/drag',
            component: () => import(/* webpackChunkName: "drag" */ '../components/page/DragList.vue'),
            meta: { title: '拖拽列表' }
          },
          {
            // 拖拽Dialog组件
            path: '/dialog',
            component: () => import(/* webpackChunkName: "dragdialog" */ '../components/page/DragDialog.vue'),
            meta: { title: '拖拽弹框' }
          },
          {
            // 国际化组件
            path: '/i18n',
            component: () => import(/* webpackChunkName: "i18n" */ '../components/page/I18n.vue'),
            meta: { title: '国际化' }
          },
          {
            // 权限页面
            path: '/permission',
            component: () => import(/* webpackChunkName: "permission" */ '../components/page/Permission.vue'),
            meta: { title: '权限测试', permission: true }
          },
          {
            path: '/404',
            component: () => import(/* webpackChunkName: "404" */ '../components/page/404.vue'),
            meta: { title: '404' }
          },
          {
            path: '/403',
            component: () => import(/* webpackChunkName: "403" */ '../components/page/403.vue'),
            meta: { title: '403' }
          },
          {
            path: '/menuAdd',
            component: () => import(/* webpackChunkName: "form" */ '../views/menu/add.vue'),
            meta: { title: '菜单添加' }
          },
          {
            path: '/menuEdit',
            component: () => import(/* webpackChunkName: "form" */ '../views/menu/edit.vue'),
            meta: { title: '菜单编辑' }
          },
          {
            path: '/roleAdd',
            component: () => import(/* webpackChunkName: "form" */ '../views/role/add.vue'),
            meta: { title: '角色添加' }
          },
          {
            path: '/student',
            component: () => import( '../views/student/StudentTable.vue'),
            meta: { title: '学生列表' }
          },
          {
            path: '/store',
            component: () => import( '../views/store/StoreTable.vue'),
            meta: { title: '店铺列表' }
          },
          {
            path: '/runErrands',
            component: () => import( '../views/runerrands/RunErrandsTable.vue'),
            meta: { title: '跑腿代购列表' }
          },
          {
            path: '/runOrder',
            component: () => import( '../views/order/OrderTable.vue'),
            meta: { title: '接单列表' }
          },
          {
            path: '/personal',
            component: () => import( '../views/personal/Personal.vue'),
            meta: { title: '个人信息中心' }
          },
          {
            path: '/password',
            component: () => import( '../views/personal/UpdatePassword.vue'),
            meta: { title: '修改密码' }
          }
        ]
      },
      {
        path: '/',
        component: () => import('../components/page/StudentLogin.vue'),
        meta: { title: '登录' }
      },
      {
        path: '/adminLogin',
        component: () => import('../components/page/Login.vue'),
        meta: { title: '登录' }
      },
      {
        path: '*',
        redirect: '/404'
      }
    ]
});
