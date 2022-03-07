<template>

  <div class="root">

    <div class="login-box">

      <div class="title">
        <h2>芒果-运营后台管理端</h2>
      </div>

      <div class="form-item">
        <el-input
            class="login-item"
            placeholder="请输入账号"
            prefix-icon="el-icon-user"
            v-model="username"
            clearable>
        </el-input>
        <el-input
            class="login-item"
            placeholder="请输入密码"
            prefix-icon="el-icon-lock"
            v-model="password" show-password></el-input>


        <el-button class="btn-login" v-on:click="login()" type="primary">登录</el-button>

      </div>
    </div>

    <div class="footer">
      <span>Copyright © 程序员田同学</span>
    </div>

  </div>

</template>

<script>

export default {

  name: "login",

  data() {
    return {
      username: '',
      password: '',
      info: null
    }

  },

  methods: {
    login: function () {
      console.log(this)
      console.log(this.$store.getters.getCityFn);

      const that = this;
      capis.login({
        username: that.username,
        password: that.password
      }).then(res => {
        if (res.code === 200) {
          that.$message.success("登录成功");
          that.$router.push({path: "/pages/user"});
          //保存到cookie
          Cookies.set('accessToken', res.datas.token);
          Cookies.set('userInfo', res.datas.userInfo.id);
          //保存到vuex中
          this.$store.commit(res.datas.userInfo)
        } else {
          that.$message.error("账号或者密码不正确！");
        }
      });
    }
  }

}
</script>

<style scoped>

/*登录盒子*/
.login-box{
  height: 350px;
  width: 300px;
  /*margin: 100px auto;*/
  border: rgb(0, 81, 166) 3px solid;
  border-radius: 10px;

  position: absolute;
  left: 50%;
  top: 30%;
  transform: translate(-50%, -50%);


}
/*标题*/
.title{
  /*width: 100%;*/
  /*height: 50px;*/
  position: relative;

  margin: 50px 50px;
}

/*登录框*/
.login-item{
  width: 80%;
  margin: 20px 10px;
}

/*登录按钮*/
.btn-login{
  width: 80%;
  margin: 10px 10px;
  border-radius: 5px;
}


/**
版权信息
 */
.footer{
  position: absolute;
  left: 44%;
  top: 90%;
}
</style>