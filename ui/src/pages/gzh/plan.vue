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
          width="60">
      </el-table-column>
      <el-table-column
          prop="name"
          label="活动名称"
          width="120">
      </el-table-column>
      <el-table-column
          prop="periods"
          label="期数"
          width="150">
      </el-table-column>
      <el-table-column
          prop="des"
          label="活动描述"
          width="200">
      </el-table-column>
      <el-table-column
          prop="beginTime"
          label="开始时间"
          width="200">
      </el-table-column>
      <el-table-column
          prop="endTime"
          label="结束时间"
          width="200">
      </el-table-column>
      <el-table-column
          prop="num"
          label="发送次数"
          width="100">
      </el-table-column>
      <el-table-column
          prop="createTime"
          label="创建时间"
          width="200">
      </el-table-column>
      <el-table-column
          prop="tempId"
          label="模板id"
          width="200">
      </el-table-column>
      <el-table-column
          prop="para"
          label="参数"
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
          prop="end"
          label="是否推送短信"
          width="120">
        <template slot-scope="scoped">
          <el-switch
              v-model="scoped.row.end"
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
          width="150">
        <template slot-scope="scoped">
          <el-button type="primary" icon="el-icon-edit" circle @click="edit_dialog(scoped.row.id)"></el-button>
        </template>
      </el-table-column>
    </el-table>

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

        <el-form-item label="发送次数" :label-width="formLabelWidth">
          <el-input v-model="form_add.num" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="模板id" :label-width="formLabelWidth">
          <el-input v-model="form_add.tempId" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="参数" :label-width="formLabelWidth">
          <el-input v-model="form_add.para" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="开始时间" :label-width="formLabelWidth">
          <el-input v-model="form_add.beginTime" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="结束时间" :label-width="formLabelWidth">
          <el-input v-model="form_add.endTime" autocomplete="off"></el-input>
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

        <el-form-item label="发送次数" :label-width="formLabelWidth">
          <el-input v-model="form.num" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="模板id" :label-width="formLabelWidth">
          <el-input v-model="form.tempId" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="参数" :label-width="formLabelWidth">
          <el-input v-model="form.para" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="开始时间" :label-width="formLabelWidth">
          <el-input v-model="form.beginTime" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="结束时间" :label-width="formLabelWidth">
          <el-input v-model="form.endTime" autocomplete="off"></el-input>
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
      dialogFormVisible_add: false,
      dialogFormVisible_edit: false,
      form_add: {
        name: '',
        des: '',
        periods: '',
        num: '',
        beginTime:'',
        endTime:'',
        tempId:'',
        para:''

      },
      form: {
        id:'',
        name: '',
        des: '',
        periods: '',
        num: '',
        beginTime:'',
        endTime:'',
        tempId:'',
        para:''
      },
      formLabelWidth: '120px'
    }
  },
  methods: {

    getList() {
      capis.getPlan({}).then(res => {
        // console.log(res.datas)
        this.tableData = res.datas
      })
    },

    add() {
      capis.addPlan({
        name: this.form_add.name,
        des: this.form_add.des,
        periods: this.form_add.periods,
        num: this.form_add.num,
        beginTime: this.form_add.beginTime,
        endTime: this.form_add.endTime,
        tempId: this.form_add.tempId,
        para: this.form_add.para
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
      capis.editPlan(
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
        this.form.num=res.datas[0].num
        this.form.beginTime=res.datas[0].beginTime
        this.form.endTime=res.datas[0].endTime
        this.form.tempId=res.datas[0].tempId
        this.form.para=res.datas[0].para
          }
      )
    },
    edit(){
      capis.editPlan({
        id:this.form.id,
        name: this.form.name,
        des: this.form.des,
        periods: this.form.periods,
        num: this.form.num,
        beginTime: this.form.beginTime,
        endTime: this.form.endTime,
        tempId: this.form.tempId,
        para: this.form.para
      }).then(res => {
        this.dialogFormVisible_edit = false
        this.getList();
      })
    }
  },
  created() {
    this.getList();
  },


}
</script>

<style scoped>

</style>