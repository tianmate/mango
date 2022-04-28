package cn.sky1998.mongo.work.student.controller;

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
import cn.sky1998.mongo.work.student.domain.workStudent;
import cn.sky1998.mongo.work.student.service.IworkStudentService;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;

/**
 * 学生成绩管理Controller
 * 
 * @author tcy
 * @date 2022-04-26
 */
@RestController
@RequestMapping("/work/student")
public class workStudentController extends BaseController
{
    @Autowired
    private IworkStudentService workStudentService;

    /**
     * 查询学生成绩管理列表
     */
        @GetMapping("/list")
    public TableDataInfo list(workStudent workStudent)
    {
        startPage();
        List<workStudent> list = workStudentService.selectworkStudentList(workStudent);
        return getDataTable(list);
    }

    /**
     * 导出学生成绩管理列表
     */
                                    
    /**
     * 获取学生成绩管理详细信息
     */
        @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") java.math.BigInteger id)
    {
        return AjaxResult.success(workStudentService.selectworkStudentById(id));
    }

    /**
     * 新增学生成绩管理
     */
            @PostMapping
    public AjaxResult add(@RequestBody workStudent workStudent)
    {
        return toAjax(workStudentService.insertworkStudent(workStudent));
    }

    /**
     * 修改学生成绩管理
     */
            @PostMapping("/update")
    public AjaxResult update(@RequestBody workStudent workStudent)
    {
        return toAjax(workStudentService.updateworkStudent(workStudent));
    }

    /**
     * 删除学生成绩管理
     */
        	@GetMapping("/remove/{ids}")
    public AjaxResult remove(@PathVariable java.math.BigInteger[] ids)
    {
        return toAjax(workStudentService.deleteworkStudentByIds(ids));
    }
}
