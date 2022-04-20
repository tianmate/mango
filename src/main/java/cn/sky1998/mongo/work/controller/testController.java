package cn.sky1998.mongo.work.controller;

import java.util.List;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.sky1998.mongo.framework.web.core.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.work.domain.test;
import cn.sky1998.mongo.work.service.ItestService;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;

/**
 * testController
 * 
 * @author test
 * @date 2022-04-20
 */
@RestController
@RequestMapping("/work/test")
public class testController extends BaseController
{
    @Autowired
    private ItestService testService;

    /**
     * 查询test列表
     */
    //@PreAuthorize("@ss.hasPermi('work:test:list')")
    @GetMapping("/list")
    public TableDataInfo list(test test)
    {
        startPage();
        List<test> list = testService.selecttestList(test);
        return getDataTable(list);
    }

    /**
     * 导出test列表
     */
                                    
    /**
     * 获取test详细信息
     */
        @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(testService.selecttestById(id));
    }

    /**
     * 新增test
     */
            @PostMapping
    public AjaxResult add(@RequestBody test test)
    {
        return toAjax(testService.inserttest(test));
    }

    /**
     * 修改test
     */
            @PutMapping
    public AjaxResult edit(@RequestBody test test)
    {
        return toAjax(testService.updatetest(test));
    }

    /**
     * 删除test
     */
        	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(testService.deletetestByIds(ids));
    }
}
