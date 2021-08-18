<template>
  <div>{{id}}</div>
</template>

<script>
  export default {
    props: ['id'],
    name: "Profile",
    beforeRouteEnter:(to,from,next)=>{
    console.log("进入路由之前");
    next(vm =>{
      vm.getData();//进入路由之前执行getData;np
    });
    },
    beforeRouteLeave:(to,from,next)=>{
      console.log("进入路由之后");
      next();
    },
    methods:{
      getData:function () {
      this.axios({
        method: 'get',
        url: 'http://localhost:8080/static/mock/data.json'
      }).then(function (response) {
        console.log(response);
      })
      }
    }
  }
</script>

<style scoped>

</style>
