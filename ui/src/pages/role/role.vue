<template>
  <div>
    <el-button type="primary" class="add-btn" @click="dialogTableVisible_add = true">新增角色</el-button>
  <el-table
      :data="tableData"
      border
      style="width: 100%">
    <el-table-column
        prop="id"
        label="Id"
        width="100">
    </el-table-column>
    <el-table-column
        prop="name"
        label="角色名称"
        width="120">
    </el-table-column>
    <el-table-column
        prop="description"
        label="描述"
        width="120">
    </el-table-column>
    <el-table-column
        prop="enable"
        label="是否启用"
        width="120">
      <template slot-scope="scoped">
        <el-switch
            v-model="scoped.row.enable"
            active-color="#13ce66"
            inactive-color="#ff4949"
            :active-value="0"
            :inactive-value="1"
            @change="changeInformationStatus($event, scoped.row, scoped.column)">
        </el-switch>
      </template>
    </el-table-column>

    <el-table-column
        prop="order"
        label="顺序"
        width="120">
    </el-table-column>
    <el-table-column
        prop="del"
        label="是否删除"
        width="120">
      <template slot-scope="scoped">
        <el-switch
            v-model="scoped.row.del"
            active-color="#13ce66"
            inactive-color="#ff4949"
            :active-value="0"
            :inactive-value="1"
            @change="changeInformationStatus($event, scoped.row, scoped.column)">
        </el-switch>
      </template>
    </el-table-column>
    <el-table-column
        label="操作"
        width="200">
      <template  slot-scope="scoped">
<!--        <el-button type="danger" icon="el-icon-delete" circle></el-button>-->
        <el-button type="primary" icon="el-icon-edit" circle @click="editRoleDialog(scoped.row.id)"></el-button>
        <el-button type="primary" icon="el-icon-menu" circle @click="getRoleMenu(scoped.row.id)"></el-button>
<!--        <el-button type="text" size="small">编辑</el-button>-->
      </template>
    </el-table-column>
  </el-table>

    <el-dialog title="新增角色" :visible.sync="dialogTableVisible_add">
      <el-form :model="form_add">
        <el-form-item label="角色名称" :label-width="formLabelWidth">
          <el-input v-model="form_add.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="角色描述" :label-width="formLabelWidth">
          <el-input v-model="form_add.des" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableVisible_add = false">取 消</el-button>
        <el-button type="primary" @click="addRole()">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑角色" :visible.sync="dialogTableVisible_edit">
      <el-form :model="form">
        <el-form-item label="角色名称" :label-width="formLabelWidth">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="角色描述" :label-width="formLabelWidth">
          <el-input v-model="form.des" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="排序" :label-width="formLabelWidth">
          <el-input v-model="form.order" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableVisible_edit = false">取 消</el-button>
        <el-button type="primary" @click="editRole()">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="菜单管理" :visible.sync="dialogTableVisible_menu">
      <el-button type="primary" class="add-role-btn" @click="addMenuDialog()">增加菜单</el-button>
      <el-table :data="role_menuData">

        <el-table-column type="index" label="id" width="150"></el-table-column>
        <el-table-column property="menu.name" label="菜单名称" width="200"></el-table-column>

        <el-table-column
            prop="del"
            label="是否删除">
          <template slot-scope="scoped">
            <el-switch
                v-model="scoped.row.del"
                active-color="#13ce66"
                inactive-color="#ff4949"
                :active-value="0"
                :inactive-value="1"
                @change="removeRoleMenu($event, scoped.row.voId, scoped.column)">
            </el-switch>

          </template>
        </el-table-column>

      </el-table>
    </el-dialog>

    <el-dialog title="新增菜单" :visible.sync="dialogTableVisible_menu_add">

      <el-select v-model="value1" multiple placeholder="请选择">
        <el-option
            v-for="item in options"
            :key="item.id"
            :label="item.name"
            :value="item.id">
        </el-option>
      </el-select>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableVisible_menu_add = false">取 消</el-button>
        <el-button type="primary" @click="add_menu()">确 定</el-button>
      </div>
    </el-dialog>
  </div>


</template>

<script>
export default {
  data() {
    return {
      tableData: [],
      form: {
        id:'',
        name:'',
        des: '',
        order: '',
        remark: ''
      },
      form_add: {
        id:'',
        name:'',
        des: '',
        order: '',
        remark: ''
      },
      role_menuData:[],
      dialogTableVisible_add: false,
      dialogTableVisible_edit: false,
      formLabelWidth: '120px',
      dialogTableVisible_menu: false,
      select_add_menu_role_id:null,

      dialogTableVisible_menu_add: false,
      form_menu: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      options: [],
      value1: [],
    }
  },
  methods: {
    add_menu(){
      console.log(this.value1)
      var role={
       "id":this.select_add_menu_role_id
      }
      var menuList=[]
      var menu;
      for (let i = 0; i < this.value1.length; i++) {
        menu={
          "id":this.value1[i]
        }
        menuList.push(menu)
      }
      var menus={
        role,
        "menus":menuList
      }
      capis.addRoleMenu(
        menus
      ).then(res=>{
        if (res.code==200){
          this.$message.success("操作成功");
          this.dialogTableVisible_menu_add = false
          this.getRoleMenu()
        }
      })

    },

    addMenuDialog(){
      this.dialogTableVisible_menu_add=true
      var allMenu=[];
      var neadMenu=[];
      capis.getMenu({}).then(res=>{

        allMenu=res.datas

        capis.getRoleMenu({
          id:this.select_add_menu_role_id
        }).then(res=>{

          neadMenu=res.datas

        //  console.log(allMenu)
         // console.log(neadMenu[0].menu)
          var f=[];

            for (let j=0;j<neadMenu.length;j++){
              if (neadMenu[0].menu!=null){
                f=allMenu.filter(item=>item.id==neadMenu[j].menu.id);
              }


              allMenu.splice(f,1)
            }



          this.options=allMenu;
        })
      })




    },
    getRoleMenu: function (id) {
      this.select_add_menu_role_id=id
      this.dialogTableVisible_menu = true

      capis.getRoleMenu({
        id:id
      }).then(res=>{
        this.role_menuData=res.datas
      })
    },
    //更新角色
    changeInformationStatus(value, { id }, { property }) {
      let parm=property
      let parms={
        id:id,
        [parm]:value
      }
      capis.editRole(
          parms
      )

    },
    //删除角色菜单
    removeRoleMenu(value, voId , { property }) {
      capis.removeRoleMenu({
        voId:voId,
        del:value
      })

    },
    getList(){
      capis.getRole({

      }).then(res=>{
        this.tableData=res.datas
      })
    },
    editRoleDialog(id){
      this.dialogTableVisible_edit = true
      capis.getRole({
        id:id
      }).then(res=>{
        this.form.id=res.datas[0].id
        this.form.name=res.datas[0].name
        this.form.des=res.datas[0].description
        this.form.order=res.datas[0].order
        this.form.remark=res.datas[0].remark
      })
    },
    addRole(){
      capis.addRole({
        name:this.form_add.name,
        description:this.form_add.des
      }).then(res=>{
        this.getList();
        this.dialogTableVisible_add = false
      })
    },
    editRole(){
      capis.editRole({
        id:this.form.id,
        name:this.form.name,
        description: this.form.des,
        order: this.form.order,
        remark:this.form.remark
      }).then(res=>{
        if (res.code==200){
          this.dialogTableVisible_edit = false
          this.$message.success("操作成功");
          this.getList();
        }
      })
    },


  },
  created() {
   this.getList();
  // console.log(this.$store.state.userInfo)

  },


}
</script>

<style scoped>

</style>