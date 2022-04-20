package cn.sky1998.mongo.work.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
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
import cn.sky1998.mongo.work.domain.testTeacher;
import cn.sky1998.mongo.work.service.ItestTeacherService;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;

/**
 * teacher_fucController
 * 
 * @author tcy
 * @date 2022-04-20
 */
@RestController
@RequestMapping("/work/teacher")
public class testTeacherController extends BaseController
{
    @Autowired
    private ItestTeacherService testTeacherService;

    /**
     * 查询teacher_fuc列表
     */
        @GetMapping("/list")
    public TableDataInfo list(testTeacher testTeacher)
    {
        startPage();
        List<testTeacher> list = testTeacherService.selecttestTeacherList(testTeacher);
        return getDataTable(list);
    }

    /**
     * 导出teacher_fuc列表
     */
                                    
    /**
     * 获取teacher_fuc详细信息
     */
        @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") java.math.BigInteger id)
    {
        return AjaxResult.success(testTeacherService.selecttestTeacherById(id));
    }

    /**
     * 新增teacher_fuc
     */
            @PostMapping
    public AjaxResult add(@RequestBody testTeacher testTeacher)
    {
        return toAjax(testTeacherService.inserttestTeacher(testTeacher));
    }

    /**
     * 修改teacher_fuc
     */
            @PostMapping("/update")
    public AjaxResult update(@RequestBody testTeacher testTeacher)
    {
        return toAjax(testTeacherService.updatetestTeacher(testTeacher));
    }

    /**
     * 删除teacher_fuc
     */
        	@GetMapping("/remove/{ids}")
    public AjaxResult remove(@PathVariable java.math.BigInteger[] ids)
    {
        return toAjax(testTeacherService.deletetestTeacherByIds(ids));
    }
}
