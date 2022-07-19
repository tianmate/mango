package cn.sky1998.mango.gen.controller;

import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.framework.web.core.BaseController;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.common.utils.text.Convert;
import cn.sky1998.mango.gen.domain.GenTable;
import cn.sky1998.mango.gen.domain.GenTableColumn;
import cn.sky1998.mango.gen.manager.GenManager;
import cn.sky1998.mango.gen.service.IGenTableColumnService;
import cn.sky1998.mango.gen.service.IGenTableService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * tcy@1753163342@qq.com@1753163342@qq.com
 * @Date 14-03-2022
 */
@RestController
@RequestMapping("/gen/table")
public class GenController extends BaseController {

    @Autowired
    private GenManager genManager;

    @Autowired
    private IGenTableService genTableService;

    @Autowired
    private IGenTableColumnService genTableColumnService;

    /**
     * 新增生成表信息
     * @param genTable
     * @return
     */
    @PostMapping("/add")
    public AjaxResult add(@Validated @RequestBody GenTable genTable){

      return  AjaxResult.success(genTableService.add(genTable));
    }
    /**
     * 根据表id生成表和代码
     * @param tableId
     */
    @GetMapping("/createDbAndCode/{tableId}")
    public AjaxResult createDbAndCode(@PathVariable Long tableId){
      return AjaxResult.success(genManager.generate(tableId,true));
    }


    /**
     * 根据表id 生成代码
     * @param tableId
     */
    @GetMapping("/createCode/{tableId}")
    public AjaxResult createCode(@PathVariable Long tableId){
       return AjaxResult.success(genManager.generate(tableId,false));
    }

    /**
     * 查询代码生成列表
     */
 //   @PreAuthorize("@ss.hasPermi('tool:gen:list')")
    @GetMapping("/list")
    public AjaxResult genList(GenTable genTable)
    {
        startPage();
        List<GenTable> list = genTableService.selectGenTableList(genTable);
        return AjaxResult.success(list);
    }

    /**
     * 获取代码生成业务详情
     */
 //   @PreAuthorize("@ss.hasPermi('tool:gen:query')")
    @GetMapping(value = "/{tableId}")
    public AjaxResult getInfo(@PathVariable Long tableId)
    {
        GenTable table = genTableService.selectGenTableById(tableId);
        List<GenTable> tables = genTableService.selectGenTableAll();
        List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(tableId);
        for (GenTableColumn column : list) {
            if (column.getColumnType().contains(",")){
                Integer[] integers = StringUtils.extractDigitalsToPoint(column.getColumnType());
                column.setFieldNum(integers[0]);
                column.setPointNum(integers[1]);
            }else if (column.getColumnType().contains("(")){
                Integer s = StringUtils.extractDigital(column.getColumnType());
                column.setFieldNum(s);
            }
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("info", table);
        map.put("rows", list);
        map.put("tables", tables);
        return AjaxResult.success(map);
    }

    /**
     * 查询物理数据库列表且不在get_table中的
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:list')")
    @GetMapping("/db/list")
    public AjaxResult dataList(GenTable genTable)
    {
        startPage();
        List<GenTable> list = genTableService.selectDbTableList(genTable);
        return AjaxResult.success(list);
    }

    /**
     * 查询数据表字段列表
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:list')")
    @GetMapping(value = "/column/{talbleId}")
    public AjaxResult columnList(Long tableId)
    {
       // TableDataInfo dataInfo = new TableDataInfo();
        List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(tableId);
        //dataInfo.setDatas(list);
        //dataInfo.setTotal(list.size());
        return AjaxResult.success(list);
    }

    /**
     * 导入表结构（保存）
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:import')")
    @PostMapping("/importTable")
    public AjaxResult importTableSave(String tables)
    {
        String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息 字段长度查出来
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
        genTableService.importGenTable(tableList);
        return AjaxResult.success();
    }

    /**
     * 修改保存代码生成业务
     */
   // @PreAuthorize("@ss.hasPermi('tool:gen:edit')")
    @PutMapping
    public AjaxResult editSave(@Validated @RequestBody GenTable genTable)
    {
        genTableService.validateEdit(genTable);
        genTableService.updateGenTable(genTable);
        return AjaxResult.success();
    }

    /**
     * 删除代码生成
     */
   // @PreAuthorize("@ss.hasPermi('tool:gen:remove')")
    @DeleteMapping("/{tableIds}")
    public AjaxResult remove(@PathVariable Long[] tableIds)
    {
        genTableService.deleteGenTableByIds(tableIds);
        return AjaxResult.success();
    }

    /**
     * 预览代码
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:preview')")
    @GetMapping("/preview/{tableId}")
    public AjaxResult preview(@PathVariable("tableId") Long tableId) throws IOException
    {
        Map<String, String> dataMap = genTableService.previewCode(tableId);
        return AjaxResult.success(dataMap);
    }

    /**
     * 生成代码（下载方式）
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:code')")
    @GetMapping("/download/{tableName}")
    public void download(HttpServletResponse response, @PathVariable("tableName") String tableName) throws IOException
    {
        byte[] data = genTableService.downloadCode(tableName);
        genCode(response, data);
    }

    /**
     * 生成代码（自定义路径）
     */
   // @PreAuthorize("@ss.hasPermi('tool:gen:code')")
    @GetMapping("/genCode/{tableName}")
    public AjaxResult genCode(@PathVariable("tableName") String tableName)
    {
        genTableService.generatorCode(tableName);
        return AjaxResult.success();
    }

    /**
     * 从物理表同步
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:edit')")
    @GetMapping("/synchDbFrom/{tableName}")
    public AjaxResult synchDbFrom(@PathVariable("tableName") String tableName)
    {
        genTableService.synchDbFrom(tableName);
        return AjaxResult.success();
    }

    /**
     * 同步到物理表
     */
    //  @PreAuthorize("@ss.hasPermi('tool:gen:edit')")
    @GetMapping("/synchDbTo/{tableName}")
    public AjaxResult synchDbTo(@PathVariable("tableName") String tableName)
    {
        genTableService.synchDbTo(tableName);
        return AjaxResult.success();
    }


    /**
     * 导入数据库、从
     */
    /**
     * 批量生成代码
     */
  //  @PreAuthorize("@ss.hasPermi('tool:gen:code')")
    @GetMapping("/batchGenCode")
    public void batchGenCode(HttpServletResponse response, String tables) throws IOException
    {
        String[] tableNames = Convert.toStrArray(tables);
        byte[] data = genTableService.downloadCode(tableNames);
        genCode(response, data);
    }

    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException
    {
        response.reset();
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Expose-Headers", "Content-Disposition");
        response.setHeader("Content-Disposition", "attachment; filename=\"tcy.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IOUtils.write(data, response.getOutputStream());
    }
}