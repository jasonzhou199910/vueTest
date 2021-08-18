<template>
  <div class="sidebar">
    <el-menu
      class="sidebar-el-menu"
      :default-active="onRoutes"
      :collapse="collapse"
      background-color="#324157"
      text-color="#bfcbd9"
      active-text-color="#20a0ff"
      unique-opened
      router
    >
      <template v-for="item in items">
        <template v-if="item.subs">
          <el-submenu :index="item.index" :key="item.index">
            <template slot="title">
              <i :class="item.icon"></i>
              <span slot="title">{{ item.title }}</span>
            </template>
            <template v-for="subItem in item.subs">
              <el-submenu
                v-if="subItem.subs"
                :index="subItem.index"
                :key="subItem.index"
              >
                <template slot="title">{{ subItem.title }}</template>
                <el-menu-item
                  v-for="(threeItem,i) in subItem.subs"
                  :key="i"
                  :index="threeItem.index"
                >{{ threeItem.title }}
                </el-menu-item>
              </el-submenu>
              <el-menu-item
                v-else
                :index="subItem.index"
                :key="subItem.index"
              >{{ subItem.title }}
              </el-menu-item>
            </template>
          </el-submenu>
        </template>
        <template v-else>
          <el-menu-item :index="item.index" :key="item.index">
            <i :class="item.icon"></i>
            <span slot="title">{{ item.title }}</span>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>
<script>
  import bus from '../common/bus';
  export default {
    data() {
      return {
        collapse: false,
        items: [

        ]
      };
    },
    computed: {
      onRoutes() {
        return this.$route.path.replace('/', '');
      }
    },
    created() {
      const  _this=this;
      // 通过 Event Bus 进行组件间通信，来折叠侧边栏
    bus.$on('collapse', msg => {
        this.collapse = msg;
      bus.$emit('collapse-content', msg);
      });
      const loginType=_this.$store.getters.getLoginType;
      var user=null;
      if(loginType==1){
        user=_this.$store.getters.getUserInfo;
      }else if (loginType==2) {
        user=_this.$store.getters.getStudentInfo;
      }
      if(user !=null){
        _this.$axios.get(_this.$base_url+"system/vue_menu?id="+user.id).then(result=>{
          const res=result.data.data;
          if(res.topMenus.length<=0){
            _this.$message.warning("会话失效或未登录,请重新登录!");
            return ;
          }
          const topMenu=res.topMenus;
          const secondMenu=res.secondMenus;
          const arry=new Array();
          const indexOption={};
          indexOption.icon ='el-icon-watermelon';
          indexOption.index = 'dashboard';
          indexOption.title =  '系统首页';
          arry.push(indexOption);
          for (var i=0;i<topMenu.length;i++) {
            const option = {};
            option.icon = topMenu[i].icon;
            option.index = topMenu[i].url;
            option.title = topMenu[i].name;
            const subs = new Array();
            for (var j = 0; j < secondMenu.length; j++) {
              if (secondMenu[j].parent.id == topMenu[i].id) {
                //说明有二级分类
                var subsOption = {};
                const menu=secondMenu[j].url.split("/");
                subsOption.index =menu[2];
                subsOption.title = secondMenu[j].name;
                subsOption.icon = secondMenu[j].icon;
                subs.push(subsOption);
              }
            }
            option.subs=subs;
            arry.push(option);
          }
          _this.items=arry;
        });
      }else{
        _this.$router.push("/");
      }
    }
  };
</script>

<style scoped>
  .sidebar {
    display: block;
    position: absolute;
    left: 0;
    top: 70px;
    bottom: 0;
    overflow-y: scroll;
  }

  .sidebar::-webkit-scrollbar {
    width: 0;
  }

  .sidebar-el-menu:not(.el-menu--collapse) {
    width: 250px;
  }

  .sidebar > ul {
    height: 100%;
  }
</style>
