package cn.sky1998.mongo.gen.manager;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.common.utils.text.Convert;
import cn.sky1998.mongo.gen.domain.GenTable;
import cn.sky1998.mongo.gen.mapper.GenTableMapper;
import cn.sky1998.mongo.gen.service.IGenTableService;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.mapper.MenuMapper;
import cn.sky1998.mongo.system.mapper.RoleMapper;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author tcy@1753163342@qq.com
 */
@Component
public class GenManager {

    @Autowired
    private IGenTableService genTableService;

    @Autowired
    private GenTableMapper genTableMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Transactional(rollbackFor = Exception.class)
    public int generate(Long tableId,Boolean IfCreateDb) {

        //第一步：检查是否存在历史数据并删除
        GenTable genTable = genTableMapper.selectGenTableById(tableId);
        if (Objects.isNull(genTable)){
            throw new CustomException("表不存在");
        }
        String tableName = genTable.getTableName();
        GenTable req=new GenTable();
        req.setTableName(tableName);
        List<GenTable> genTables = genTableService.selectGenTableList(req);
        if (!CollectionUtils.isEmpty(genTables)) {
            Long[] array = new Long[genTables.size()];
            genTables.stream().map(GenTable::getTableId).collect(Collectors.toList()).toArray(array);
       //     genTableService.deleteGenTableByIds(array);
        }
        //第二步：导入表结构
        String[] tableNames = Convert.toStrArray(tableName);
        // 查询MYsql系统表信息
      //  List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
      //  genTableService.importGenTable(tableList);

        if (IfCreateDb){
            //增加角色
             addMenuByGen(genTable);

            //创建数据库
            createTable(genTable);
        }


        //第三步：生成代码并压缩文件
        byte[] data = genTableService.downloadCode(tableNames);
        //代码存放到 src/main/java/cn/sky1998/mongo/work/base目录下
        genCode("mongo.zip", data);

        return 1;
    }

    /**
     * 生成zip文件
     *
     * @param fileName 目标压缩文件名
     * @param data     字节数组
     */
    public void genCode(String fileName, byte[] data) {

        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(new File(fileName));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            IOUtils.write(data, fileOutputStream);
        } catch (IOException e) {
        }finally {
            try {
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根据表信息创建数据库表
     * @param genTable
     * @return
     */
   private int createTable(GenTable genTable){
        try {

      return genTableMapper.createTable(genTable);

       }catch (BadSqlGrammarException e){
           throw new CustomException("创建表失败，请确定表是否存在，或者确实信息！");
       }
    }

    /**
     * 将创建的菜单插入到菜单及菜单-角色关联表
     * @param genTable
     */
    private void addMenuByGen(GenTable genTable){
        Menu menu=new Menu();
        menu.setMenuName(genTable.getFunctionName());
        menu.setParentId(7L);
        menu.setIcon("el-icon-notebook-2");
        menu.setMenuType("C");
        String path="/pages/";
        menu.setPath(path.concat(genTable.getClassName()));

        String component="work/";
        menu.setComponent(component.concat(genTable.getBusinessName()+"/index"));
        //插入到菜单表
        menuMapper.insertSelective(menu);
        //插入到菜单-角色关联表(系统管理员角色，创建菜单id)
        roleMapper.addRoleMenu(1l,menu.getMenuId());
    }
}
