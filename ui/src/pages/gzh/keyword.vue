<template>
  <div class="root">
    <el-button type="primary" class="add-btn" @click="dialogFormVisible_add = true">增加关键字</el-button>
    <el-table
        :data="tableData"
        border
        style="width: 100%">
      <el-table-column
          prop="id"
          label="id"
          width="100">
      </el-table-column>
      <el-table-column
          prop="word"
          label="关键字"
          width="120">
      </el-table-column>
      <el-table-column
          prop="reply"
          label="回复"
          width="500">
      </el-table-column>
      <el-table-column
          prop="remark"
          label="备注"
          width="200">
      </el-table-column>
      <el-table-column
          prop="enable"
          label="是否启用"
          width="120">
        <template slot-scope="scoped">
          <el-switch
              v-model="scoped.row.enable"
              :active-value="0"
              :inactive-value="1"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="changeInformationStatus($event, scoped.row, scoped.column)">
          </el-switch>
        </template>
      </el-table-column>

      <el-table-column
          label="操作"
          width="200">
        <template slot-scope="scoped">
          <el-button type="primary" icon="el-icon-edit" circle @click="edit_dialog(scoped.row.id)"></el-button>
        </template>
      </el-table-column>
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

    <el-dialog title="增加关键字" :visible.sync="dialogFormVisible_add">
      <el-form :model="form_add">

        <el-form-item label="关键字" :label-width="formLabelWidth">
          <el-input v-model="form_add.word" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="回复" :label-width="formLabelWidth">
<!--          <el-input v-model="form_add.reply" autocomplete="off"></el-input>-->
          <el-input
              type="textarea"
              :rows="10"
              placeholder="请输入回复"
              v-model="form_add.reply">
          </el-input>
        </el-form-item>

        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form_add.remark" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible_add = false">取 消</el-button>
        <el-button type="primary" @click="add()">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑关键字" :visible.sync="dialogFormVisible_edit">
      <el-form :model="form">

        <el-form-item label="关键字" :label-width="formLabelWidth">
          <el-input v-model="form.word" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="回复" :label-width="formLabelWidth">
<!--          <el-input v-model="form.reply" autocomplete="off"></el-input>-->
          <el-input
              type="textarea"
              :rows="10"
              placeholder="请输入回复"
              v-model="form.reply">
          </el-input>
        </el-form-item>


        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
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
        word: '',
        reply: '',
        remark: ''

      },
      form: {
        word: '',
        reply: '',
        remark: ''
      },
      formLabelWidth: '120px'
    }
  },
  methods: {

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

    getList(pageNum,pageSize) {
      capis.getKeyword({
        pageNum:pageNum,
        pageSize:pageSize
      }).then(res => {
        console.log(res.datas)
        this.tableData = res.datas
        this.totalCount=res.total
      })
    },

    add() {
      capis.addKeyword({
        word: this.form_add.word,
        reply: this.form_add.reply,
        remark: this.form_add.remark
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
      capis.editKeyword(
          parms
      )

    },

    edit_dialog(id) {
      this.dialogFormVisible_edit = true
      capis.getKeyword({
        id: id
      }).then(res => {
            this.form.id=res.datas[0].id
            this.form.word=res.datas[0].word
            this.form.reply=res.datas[0].reply
            this.form.remark=res.datas[0].remark
          }
      )
    },
    edit(){
      capis.editKeyword({
        id:this.form.id,
        word: this.form.word,
        reply: this.form.reply,
        remark: this.form.remark
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
.tabListPage{
  margin-top: 20px;
}
</style>