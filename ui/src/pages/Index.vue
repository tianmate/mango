<template>
  <div class="root">
<!--  整个布局-->
  <el-container class="index-container">
<!--    左侧菜单栏-->
    <el-aside class="aside">
      <side-bar></side-bar>
    </el-aside>

  <!--  内容区-->
    <el-container class="main-container">
  <!--   内容区顶部-->
      <el-header class="header">
        <top-nav></top-nav>
      </el-header>

  <!--  内容区中间部分-->
      <el-main class="main">

  <!--   数据区-->
        <transition name="fade">
          <router-view ></router-view>
        </transition>
      </el-main>

    </el-container>
  </el-container>


    </div>
</template>

<script>

import SideBar from '../components/LeftNav';
import TopNav from '../components/TopNav';

export default {
  name:"Index",
  data() {
    return {

    }

  },
  components: {
    SideBar,
    TopNav
  },


  methods: {

    },


  }

</script>

<style scoped>

.index-container {
  width: 100%;
  height: 100%;
}

.aside {
  /*width: 64px !important;*/
  height: 100%;
  background-color: #334157;
  margin: 0px;
}

.header,
.main {
  padding: 0px;
  border-left: 2px solid #333;
}
.main {
  padding: 20px;
}

</style>