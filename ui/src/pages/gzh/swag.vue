<template>
  <div class="root">
    <!--    顶部搜索-->
    <el-form :inline="true" :model="formInline" class="demo-form-inline">
      <el-form-item >
        <el-select v-model="formInline.region" placeholder="搜索类型">
          <el-option label="openid" value="openid"></el-option>
<!--          <el-option label="发送者" value="nickName"></el-option>-->
          <el-option label="toOpenid" value="nickName"></el-option>
<!--          <el-option label="接收者" value="nickName"></el-option>-->
          <el-option label="活动id" value="planId"></el-option>

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

    <el-table
        :data="tableData"
        border
        style="width: 100%">
      <el-table-column
          prop="swag.id"
          label="id"
          width="100">
      </el-table-column>
      <el-table-column
          prop="swag.openid"
          label="openid"
          width="120">
      </el-table-column>
      <el-table-column
          prop="publicUser.nickName"
          label="发送者"
          width="120">
      </el-table-column>
      <el-table-column
          prop="swag.toOpenid"
          label="ToOpenid"
          width="120">
      </el-table-column>
      <el-table-column
          prop="publicUser.nickName"
          label="接受者"
          width="120">
      </el-table-column>
      <el-table-column
          prop="swag.msg1"
          label="消息1"
          width="200">
      </el-table-column>
      <el-table-column
          prop="swag.msg2"
          label="消息2"
          width="200">
      </el-table-column>

      <el-table-column
          prop="plan.periods"
          label="活动期数"
          width="200">
      </el-table-column>

      <el-table-column
          prop="swag.createTime"
          label="创建时间"
          width="200">
      </el-table-column>

<!--      <el-table-column-->
<!--          prop="enable"-->
<!--          label="是否启用"-->
<!--          width="120">-->
<!--        <template slot-scope="scoped">-->
<!--          <el-switch-->
<!--              v-model="scoped.row.enable"-->
<!--              :active-value="0"-->
<!--              :inactive-value="1"-->
<!--              active-color="#13ce66"-->
<!--              inactive-color="#ff4949"-->
<!--              @change="changeInformationStatus($event, scoped.row, scoped.column)">-->
<!--          </el-switch>-->
<!--        </template>-->
<!--      </el-table-column>-->

<!--      <el-table-column-->
<!--          prop="end"-->
<!--          label="是否完成"-->
<!--          width="120">-->
<!--        <template slot-scope="scoped">-->
<!--          <el-switch-->
<!--              v-model="scoped.row.enable"-->
<!--              :active-value="0"-->
<!--              :inactive-value="1"-->
<!--              active-color="#13ce66"-->
<!--              inactive-color="#ff4949"-->
<!--              @change="changeInformationStatus($event, scoped.row, scoped.column)">-->
<!--          </el-switch>-->
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
    <el-dialog title="增加活动计划" :visible.sync="dialogFormVisible_add">
      <el-form :model="form_add">

        <el-form-item label="名字" :label-width="formLabelWidth">
          <el-input v-model="form_add.name" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="描述" :label-width="formLabelWidth">
          <el-input v-model="form_add.des" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="期数" :label-width="formLabelWidth">
          <el-input v-model="form_add.periods" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible_add = false">取 消</el-button>
        <el-button type="primary" @click="add()">确 定</el-button>
      </div>
    </el-dialog>

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
      dialogFormVisible_add: false,
      dialogFormVisible_edit: false,
      form_add: {
        name: '',
        des: '',
        periods: ''

      },
      //搜索值
      search_value:'',
      //搜索
      formInline: {
        user: '',
        region: ''
      },
      form: {
        id:'',
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

      capis.getSwag(
          parms
      ).then(res=>{
        this.tableData = res.datas
      })

    },
    getList(pageNum,pageSize) {
      capis.getSwag({
        pageNum:pageNum,
        pageSize:pageSize
      }).then(res => {
         console.log(res.datas)
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
      capis.getPlan({
        id: id
      }).then(res => {
        console.log(res.datas[0])
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