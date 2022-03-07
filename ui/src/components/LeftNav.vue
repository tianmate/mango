<!-- 侧边栏 -->
<template>
    <div class="side-bar-wrap">
        <div class="logo-box" v-show="imgShow" @click="$router.replace({ path: '/dashboard' })">
            <img class="logo-img" src="../assets/img/spring-logo.svg" alt="">
        </div>
        <div class="logo-box" v-show="!imgShow" @click="$router.replace({ path: '/dashboard' })">
            <img class="logo-img" src="/favicon.svg" alt="">
        </div>
        <el-menu class="el-menu-vertical-demo"
                 :default-active="$route.path"
                 :collapse="collapsed"
                 background-color="#334157"
                 collapse-transition text-color="#fff"
                 active-text-color="#ffd04b"
                 router>
            <template v-for="menu in menus">
                <el-submenu :key="menu.id"
                            v-if="menu.child"
                            v-show="menu.visible"
                            :index="menu.name">
                    <template slot="title">
                        <i :class="menu.icon" style="font-size: 24px;margin-right: 0;padding: 5px;"></i>
                        <span>{{ menu.name }}</span>
                    </template>
                    <el-menu-item-group>
                        <el-menu-item v-for="menuItem in menu.child"
                                      :index="menuItem.path"
                                      :key="menuItem.id">
                            <i :class="menuItem.icon" style="font-size: 24px;margin-right: 0;padding: 5px;"></i>
                            <span>{{ menuItem.name }}</span>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-menu-item :key="menu.id" :index="menu.path" v-show="!menu.hidden">
                    <i :class="menu.icon" style="font-size: 24px;margin-right: 0;padding: 5px;"></i>
                    <span slot="title" class="menu-text">{{ menu.name }}</span>
                </el-menu-item>
            </template>
        </el-menu>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                collapsed: false,
                menus: [],
                imgShow: true
            };
        },
        created() {
            // 监听头部发出的 toggle 事件
            // this.$EventBus.$on('toggle', value => {
            //     const _this = this;
            //     this.collapsed = value;
            //     setTimeout(() => {
            //         _this.imgShow = !_this.imgShow;
            //     }, 350);
            // });
          //获取当前角色的菜单列表
          capis.getMenuByUser({
            id: Cookies.get('userInfo')
          }).then(res=>{
            this.menus=res.datas
          })
        },
    };
</script>
<style>
    .el-menu-vertical-demo:not(.el-menu--collapse) {
        width: 240px;
        min-height: 100%;
    }

    .el-menu-vertical-demo:not(.el-menu--collapse) {
        border: none;
        text-align: left;
    }

    .logo-box {
        height: 40px;
        line-height: 40px;
        background-color: #334157;
        color: #9d9d9d;
        font-size: 20px;
        text-align: center;
        padding: 20px 0px;
    }

    .logo-img {
        height: 40px;
    }

</style>
