<template>
  <div class="root">
    <!--    顶部搜索-->
    <el-form :inline="true" :model="formInline" class="demo-form-inline">
      <el-form-item >
        <el-select v-model="formInline.region" placeholder="搜索类型">
          <el-option label="openid" value="openid"></el-option>
          <el-option label="昵称" value="nickName"></el-option>
          <el-option label="电话" value="tel"></el-option>
<!--          <el-option label="微信号" value="wxId"></el-option>-->

        </el-select>
      </el-form-item>
    </el-form>
    <el-input
        v-model="search_value"
        class="search"
        placeholder="请输入内容"
        prefix-icon="el-icon-search">
    </el-input>

    <el-button type="primary" class="search-btn" @click="search()">搜索</el-button>
    <el-button type="primary" class="search-btn" @click="reset()">重置</el-button>
<!--    <el-button type="primary" class="add-btn" @click="dialogFormVisible_add = true">增加关键字</el-button>-->
    <el-table
        :data="tableData"
        border
        style="width: 100%">
      <el-table-column
          prop="id"
          label="id"
          width="50">
      </el-table-column>
      <el-table-column
          prop="nickName"
          label="昵称"
          width="120">
      </el-table-column>
      <el-table-column
          prop="openid"
          label="openid"
          width="260">
      </el-table-column>
      <el-table-column
          prop="wxId"
          label="微信号"
          width="200">
      </el-table-column>
      <el-table-column
          prop="tel"
          label="手机号"
          width="120">
      </el-table-column>

      <el-table-column
          prop="sex"
          label="性别"
          width="50">
        <template slot-scope="scoped">
          <span>{{ scoped.row.sex === 0 ? '男' : '女' }}</span>
        </template>
      </el-table-column>

      <el-table-column
          prop="subscribe"
          label="是否关注"
          width="100">
        <template slot-scope="scoped">
          <el-switch
              v-model="scoped.row.subscribe"
              disabled="disabled"
              :active-value="1"
              :inactive-value="0"
              active-color="#13ce66"
              inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column
          prop="subscribeTime"
          label="关注时间"
          width="200">
      </el-table-column>
      <el-table-column
          prop="subscribeScene"
          label="关注渠道"
          width="200">
        <template slot-scope="scoped">
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_QR_CODE' ? '二维码' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_SEARCH' ? '公众号搜索' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_ACCOUNT_MIGRATION' ? '迁移' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_PROFILE_CARD' ? '名片分享' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_PROFILE_LINK' ? '图文页内名称点击' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_PROFILE_ITEM' ? '图文页右上角菜单' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_PAID' ? '支付后关注' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_WECHAT_ADVERTISEMENT' ? '微信广告' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_REPRINT' ? '他人转载' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_LIVESTREAM' ? '视频号直播' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_CHANNELS' ? '视频号' : '' }}</span>
          <span>{{ scoped.row.subscribeScene === 'ADD_SCENE_OTHERS' ? '其他' : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="注册时间"
          width="200">
      </el-table-column>

<!--      <el-table-column-->
<!--          label="操作"-->
<!--          width="200">-->
<!--        <template slot-scope="scoped">-->
<!--          <el-button type="primary" icon="el-icon-edit" circle @click="edit_dialog(scoped.row.id)"></el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>
    <div class="tabListPage">
      <el-pagination @size-change="handleSizeChange"
                     @current-change="handleCurrentChange"
                     :current-page="currentPage"
                     :page-sizes="pageSizes"
                     :page-size="PageSize" layout="total, sizes, prev, pager, next, jumper"
                     :total="totalCount">
      </el-pagination>
    </div>
<!--    <el-dialog title="增加活动计划" :visible.sync="dialogFormVisible_add">-->
<!--      <el-form :model="form_add">-->

<!--        <el-form-item label="名字" :label-width="formLabelWidth">-->
<!--          <el-input v-model="form_add.name" autocomplete="off"></el-input>-->
<!--        </el-form-item>-->

<!--        <el-form-item label="描述" :label-width="formLabelWidth">-->
<!--          <el-input v-model="form_add.des" autocomplete="off"></el-input>-->
<!--        </el-form-item>-->

<!--        <el-form-item label="期数" :label-width="formLabelWidth">-->
<!--          <el-input v-model="form_add.periods" autocomplete="off"></el-input>-->
<!--        </el-form-item>-->

<!--      </el-form>-->
<!--      <div slot="footer" class="dialog-footer">-->
<!--        <el-button @click="dialogFormVisible_add = false">取 消</el-button>-->
<!--        <el-button type="primary" @click="add()">确 定</el-button>-->
<!--      </div>-->
<!--    </el-dialog>-->

    <el-dialog title="编辑活动" :visible.sync="dialogFormVisible_edit">
      <el-form :model="form">

        <el-form-item label="名字" :label-width="formLabelWidth">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="描述" :label-width="formLabelWidth">
          <el-input v-model="form.des" autocomplete="off"></el-input>
        </el-form-item>


        <el-form-item label="期数" :label-width="formLabelWidth">
          <el-input v-model="form.periods" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible_edit = false">取 消</el-button>
        <el-button type="primary" @click="edit()">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [],
      // 默认显示第几页
      currentPage:1,
      // 总条数，根据接口获取数据长度(注意：这里不能为空)
      totalCount:10,
      // 个数选择器（可修改）
      pageSizes:[5,10],
      // 默认每页显示的条数（可修改）
      PageSize:5,
      //搜索值
      search_value:'',
      dialogFormVisible_add: false,
      dialogFormVisible_edit: false,
      form_add: {
        name: '',
        des: '',
        periods: ''

      },
      //搜索
      formInline: {
        user: '',
        region: ''
      },
      form: {
        name: '',
        des: '',
        periods: ''
      },
      formLabelWidth: '120px'
    }
  },
  methods: {
    reset(){
      this.getList();
    },
    // 每页显示的条数
    handleSizeChange(val) {
      // 改变每页显示的条数
      this.PageSize=val
      // 点击每页显示的条数时，显示第一页
      this.getList(1,val)
      // 注意：在改变每页显示的条数时，要将页码显示到第一页
      this.currentPage=1
    },
    // 显示第几页
    handleCurrentChange(val) {
      // 改变默认的页数
      this.currentPage=val
      // 切换页码时，要获取每页显示的条数
      this.getList(val,this.PageSize)
    },
    search:function (){

      let parm=this.formInline.region

      let parms={[parm]:this.search_value}

      capis.getPublicUser(
          parms
      ).then(res=>{
        this.tableData = res.datas
      })

    },
    getList(pageNum,pageSize) {
      capis.getPublicUser({
        pageNum:pageNum,
        pageSize:pageSize
      }).then(res => {
        console.log(res.datas)
        for (let i = 0; i < res.datas.length; i++) {
          if (res.datas[i].subscribeScene=='ADD_SCENE_QR_CODE'){
            console.log(res.datas[i].subscribeScene)
            res.datas[i].subscribeScene==="二维码"
          }
        }
        this.tableData = res.datas
        this.totalCount=res.total
      })
    },

    add() {
      capis.addPlan({
        name: this.form_add.name,
        des: this.form_add.des,
        periods: this.form_add.periods
      }).then(res => {
        this.dialogFormVisible_add = false
        this.getList();
      })
    },
    //更新菜单
    changeInformationStatus(value, {id}, {property}) {
      let parm = property

      let parms = {
        id: id,
        [parm]: value
      }
      capis.editMenu(
          parms
      )

    },

    edit_dialog(id) {
      this.dialogFormVisible_edit = true
      capis.getKeyword({
        id: id
      }).then(res => {
            this.form.id=res.datas[0].id
            this.form.name=res.datas[0].name
            this.form.des=res.datas[0].des
            this.form.periods=res.datas[0].periods
          }
      )
    },
    edit(){
      capis.editKeyword({
        id:this.form.id,
        name: this.form.name,
        des: this.form.des,
        periods: this.form.periods
      }).then(res => {
        this.dialogFormVisible_edit = false
        this.getList();
      })
    }
  },
  created() {
    this.getList(this.currentPage,this.PageSize);
  },


}
</script>

<style scoped>
.search{
  width: 200px;
  margin-right: 5px;
}
.demo-form-inline{
  width: 100px;
  display: inline;
}
.search-btn{
  margin: 1px 30px 20px 0px;
  border-radius: 10px;
  height: 40px;
}


el-checkbox{
  display: inline;
  width: 50px;
}
</style>