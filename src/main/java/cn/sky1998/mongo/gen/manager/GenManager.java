package cn.sky1998.mongo.gen.manager;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.common.utils.text.Convert;
import cn.sky1998.mongo.gen.domain.GenTable;
import cn.sky1998.mongo.gen.mapper.GenTableMapper;
import cn.sky1998.mongo.gen.service.IGenTableService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.io.File;
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

    public void generate(Long tableId) {

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
        // 查询表信息
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
      //  genTableService.importGenTable(tableList);

        //创建数据库
      //  genTableMapper.createTable(genTable);
        //第三步：生成代码并压缩文件
        byte[] data = genTableService.downloadCode(tableNames);
        //代码存放到 src/main/java/cn/sky1998/mongo/work/base目录下
        genCode("tcy.zip", data);
    }

    /**
     * 生成zip文件
     *
     * @param fileName 目标压缩文件名
     * @param data     字节数组
     */
    public void genCode(String fileName, byte[] data) {
        try {
            IOUtils.write(data, new FileOutputStream(new File(fileName)));
        } catch (IOException e) {
        }
    }

}
