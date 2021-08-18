<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" class="mgb20" style="height:252px;">
          <div class="user-info">
            <img :src="user.headPic" class="user-avator" alt/>
            <div class="user-info-cont">
              <div class="user-info-name">{{user.username}}</div>
              <div>{{user.role}}</div>
            </div>
          </div>
          <div class="user-info-list" :v-model="user.mobile">
           用户手机号:
            <span >{{user.mobile}}</span>
          </div>
          <div class="user-info-list"  :v-model="user.email">
           用户邮箱号:
            <span>{{user.email}}</span>
          </div>
        </el-card>
        <el-card shadow="hover" style="height:252px;">
          <div slot="header" class="clearfix">
            <span>语言详情</span>
          </div>
          超级管理员
          <el-progress :percentage="adminRoleTotal" color="#42b983"></el-progress>
          学生人数
          <el-progress :percentage="userRoleTotal" color="#f1e05a"></el-progress>
          测试人员
          <el-progress :percentage="0"></el-progress>
          实施人员
          <el-progress :percentage="0" color="#f56c6c"></el-progress>
        </el-card>
      </el-col>
      <el-col :span="16">
        <el-row :gutter="20" class="mgb20">
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{padding: '0px'}">
              <div class="grid-content grid-con-1">
                <i class="el-icon-lx-people grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num" :v-model="userTotal">
                    {{userTotal}}
                  </div>
                  <div>用户总数</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{padding: '0px'}">
              <div class="grid-content grid-con-2">
                <i class="el-icon-lx-notice grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num" :v-model="operatorTotal">{{operatorTotal}}</div>
                  <div>操作日志</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{padding: '0px'}">
              <div class="grid-content grid-con-3">
                <i class="el-icon-lx-goods grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num" :v-model="sessionUserTotal">
                    {{sessionUserTotal}}
                  </div>
                  <div>当前在线总数</div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <el-card shadow="hover" style="height:403px;">
          <div slot="header" class="clearfix">
            <span>系统最近操作日志</span>
          </div>
          <el-table :show-header="false" :data="todoList" style="width:100%;">
            <el-table-column  label="操作人">
              <template slot-scope="scope">
                <div
                  class="todo-item"
                >{{scope.row.operator}}
                </div>
              </template>
            </el-table-column>
            <el-table-column label="操作内容">
              <template slot-scope="scope">
                <div
                  class="todo-item"
                >{{scope.row.content}}
                </div>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- <div class="warning">
      <p>猿来入此官网:<a href="http://www.yuanlrc.com">www.yuanlrc.com</a></p>
      <el-button type="text" @click="open">点击我去广告</el-button>
     </div> -->
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card shadow="hover">
          <schart ref="bar" class="schart" canvasId="bar" :options="options"></schart>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover">
          <schart ref="line" class="schart" canvasId="line" :options="options2"></schart>
        </el-card>
      </el-col>
    </el-row>
  </div> 
</template>

<script>
  import Schart from 'vue-schart';
  import $ from 'jquery'
  export default {
    name: 'dashboard',
    data() {
      return {
        user: {
          username: "",
          role: "",
          headPic: "",
          mobile:"",
          email:"",
          studentNumber:""
        },
        userTotal:"",
        operatorTotal:"",
        sessionUserTotal:"",
        adminRoleTotal:0,
        userRoleTotal:0,
        orderSN:"",
        phone:"",
        todoList: [
          {
            id: '',
            operator: '',
            content:'',
            createTime:'',
          }
        ],
        data: [
          {
            name: '2018/09/04',
            value: 1083
          },
          {
            name: '2018/09/05',
            value: 941
          },
          {
            name: '2018/09/06',
            value: 1139
          },
          {
            name: '2018/09/07',
            value: 816
          },
          {
            name: '2018/09/08',
            value: 327
          },
          {
            name: '2018/09/09',
            value: 228
          },
          {
            name: '2018/09/10',
            value: 1065
          }
        ],
        options: {
          type: 'bar',
          title: {
            text: '最近一周各品类销售图'
          },
          xRorate: 25,
          labels: ['周一', '周二', '周三', '周四', '周五'],
          datasets: [
            {
              label: '家电',
              data: [234, 278, 270, 190, 230]
            },
            {
              label: '百货',
              data: [164, 178, 190, 135, 160]
            },
            {
              label: '食品',
              data: [144, 198, 150, 235, 120]
            }
          ]
        },
        options2: {
          type: 'line',
          title: {
            text: '最近几个月各品类销售趋势图'
          },
          labels: ['6月', '7月', '8月', '9月', '10月'],
          datasets: [
            {
              label: '家电',
              data: [234, 278, 270, 190, 230]
            },
            {
              label: '百货',
              data: [164, 178, 150, 135, 160]
            },
            {
              label: '食品',
              data: [74, 118, 200, 235, 90]
            }
          ]
        }
      };
    },
    components: {
      Schart
    },
    computed: {
      role() {
        return this.name === 'admin' ? '超级管理员' : '普通用户';
      }
    },
    // created() {
    //     this.handleListener();
    //     this.changeDate();
    // },
    // activated() {
    //     this.handleListener();
    // },
    // deactivated() {
    //     window.removeEventListener('resize', this.renderChart);
    //     bus.$off('collapse', this.handleBus);
    // },
    methods: {
      changeDate() {
        const now = new Date().getTime();
        this.data.forEach((item, index) => {
          const date = new Date(now - (6 - index) * 86400000);
          item.name = `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`;
        });
      },
      handlePageChange(val) {
        const _this = this;
        this.axios({
          method: 'post',
          url: _this.$base_url + 'system/vue_operator',
        }).then((response) => {
          const result = response.data.data;
          _this.todoList.splice(0,_this.todoList.length)
          _this.todoList.shift();
          var arr = [];
          const content = result;
          for (var i = 0; i < content.length; i++) {
            var option = {};
            option.id = content[i].id;
            option.operator = content[i].operator;
            option.content=content[i].content;
            option.createTime = content[i].createTime;
            _this.todoList.push(option);
          }
        });
      },
      open(){
        const _this=this;
        this.$alert('<form action="" class="formName"><div class="form-group">'+
          ' <input type="text" id="ordersn" style="height: 30px;border-color: white;background-color: gainsboro;margin-bottom: 20px;" placeholder="请输入订单编号" class="orderSn form-control" required maxlength="18" /><br/>'+
          ' <input type="text" id="phone" style="height: 30px;border-color: white;background-color: gainsboro;" placeholder="请输入订单手机号" class="phone form-control" maxlength="11" required />'+
          '</div>'+
          ' </form>', '猿来入此验证', {
          dangerouslyUseHTMLString: true
        }).then(result=>{
         const orderSn= $("#ordersn").val();
         const phone=$("#phone").val();
          _this.$axios.post(_this.$base_url+"system/auth_order?orderSn="+orderSn+"&phone="+phone).then(result =>{
          if(result.data.code==0){
             $(".warning").hide();
          }
          }).catch(err=>{
             _this.$message(err);
             return;
          });
        });
      }
      // handleListener() {
      //     bus.$on('collapse', this.handleBus);
      //     // 调用renderChart方法对图表进行重新渲染
      //     window.addEventListener('resize', this.renderChart);
      // },
      // handleBus(msg) {
      //     setTimeout(() => {
      //         this.renderChart();
      //     }, 200);
      // },
      // renderChart() {
      //     this.$refs.bar.renderChart();
      //     this.$refs.line.renderChart();
      // }
    },
    created() {
      const _this = this;
      const loginType=_this.$store.getters.getLoginType;
      if(loginType==1){
        var user= _this.$store.getters.getUserInfo;
        if (user == null) {
          _this.$router.push("/adminLogin");
          return;
        }
        _this.user.username = user.username;
        _this.user.role = user.role.name;
        _this.user.headPic = _this.$base_url + "photo/view?filename=" + user.headPic;
        _this.user.mobile=user.mobile;
        _this.user.email=user.email;
      }else{
       const student= _this.$store.getters.getStudentInfo;
        if (student == null) {
          _this.$router.push("/");
          return;
        }
        _this.user.username = student.name;
        _this.user.role = student.role.name;
        if(student.headPic==""){
        _this.user.headPic=_this.$base_url+"photo/view?filename=20200322/1584850135123.jpg";
        }else{
          _this.user.headPic = _this.$base_url + "photo/view?filename=" + student.headPic;
        }
        _this.user.mobile=student.mobile;
        _this.user.email=student.email;
        _this.user.studentNumber=student.studentNumber;
      }
      _this.$axios.post(_this.$base_url+"system/vue_index").then(result=>{
        const res =result.data.data;
        _this.userTotal =res[0];
        _this.operatorTotal =res[1];
        _this.sessionUserTotal=res[2];
        _this.adminRoleTotal=res[3];
        _this.userRoleTotal=res[4];
        if (res[5]!=0){
          $(".warning").hide();
        } else{
          $(".warning").show();
        }
      });
      _this.handlePageChange(1);

    }
  };
</script>


<style scoped>
  .el-row {
    margin-bottom: 20px;
  }

  .grid-content {
    display: flex;
    align-items: center;
    height: 100px;
  }

  .grid-cont-right {
    flex: 1;
    text-align: center;
    font-size: 14px;
    color: #999;
  }

  .grid-num {
    font-size: 30px;
    font-weight: bold;
  }

  .grid-con-icon {
    font-size: 50px;
    width: 100px;
    height: 100px;
    text-align: center;
    line-height: 100px;
    color: #fff;
  }

  .grid-con-1 .grid-con-icon {
    background: rgb(45, 140, 240);
  }

  .grid-con-1 .grid-num {
    color: rgb(45, 140, 240);
  }

  .grid-con-2 .grid-con-icon {
    background: rgb(100, 213, 114);
  }

  .grid-con-2 .grid-num {
    color: rgb(45, 140, 240);
  }

  .grid-con-3 .grid-con-icon {
    background: rgb(242, 94, 67);
  }

  .grid-con-3 .grid-num {
    color: rgb(242, 94, 67);
  }

  .user-info {
    display: flex;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 2px solid #ccc;
    margin-bottom: 20px;
  }

  .user-avator {
    width: 120px;
    height: 120px;
    border-radius: 50%;
  }

  .user-info-cont {
    padding-left: 50px;
    flex: 1;
    font-size: 14px;
    color: #999;
  }

  .user-info-cont div:first-child {
    font-size: 30px;
    color: #222;
  }

  .user-info-list {
    font-size: 14px;
    color: #999;
    line-height: 25px;
  }

  .user-info-list span {
    margin-left: 70px;
  }

  .mgb20 {
    margin-bottom: 20px;
  }

  .todo-item {
    font-size: 14px;
  }

  .todo-item-del {
    text-decoration: line-through;
    color: #999;
  }

  .schart {
    width: 100%;
    height: 300px;
  }

  .warning{
    padding: 8px 16px;
    background-color:#ea172e;
    border-radius: 4px;
    border-left: 5px solid #fe6c6f;
    margin: 20px 0;
  }


</style>
