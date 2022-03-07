<template>
  <div class="header-wrap">
    <button class="button-img">
      <img
        class="show-img"
        :src="collapsed ? imgShow : imgHidden"
        @click="toggle(collapsed)"
        alt=""
      />
    </button>
    <el-button style="height: 70%;" type="primary" size="mini" @click="quit">退出</el-button>
  </div>
</template>

<script>
// import { removeToken } from "../utils/token";

export default {
  data() {
    return {
      collapsed: false,
      imgShow: require("../assets/img/show.png"),
      imgHidden: require("../assets/img/sq.png"),
    };
  },
  methods: {
    // 切换显示
    // toggle(showType) {
    //   this.collapsed = !showType;
    //   this.$EventBus.$emit("toggle", this.collapsed);
    // },
    // 退出
    async quit() {
      this.$message.success("退出成功！")
      this.$router.push({ path: "/" });
     },
  },
};
</script>
<style scoped>
.header-wrap {
  display: flex;
  justify-content: space-between;
  background-color: #334157;
  align-items: center;
  padding-right: 20px;
}

.button-img {
  display: inline-block;
  width: 60px;
  height: 60px;
  background-color: transparent;
  border: none;
  cursor: pointer;
}

.show-img {
  width: 26px;
  height: 26px;
}

.show-img:active {
  border: none;
}
</style>
