package cn.sky1998.mango.work.course.controller;

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
import cn.sky1998.mango.framework.web.core.BaseController;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.work.course.domain.workCourse;
import cn.sky1998.mango.work.course.service.IworkCourseService;

/**
 * 课程管理Controller
 * 
 * @author tcy
 * @date 2022-07-05
 */
@RestController
@RequestMapping("/work/course")
public class workCourseController extends BaseController
{
    @Autowired
    private IworkCourseService workCourseService;

    /**
     * 查询课程管理列表
     */
        @GetMapping("/list")
    public AjaxResult list(workCourse workCourse)
    {
        startPage();
        List<workCourse> list = workCourseService.selectworkCourseList(workCourse);
        return AjaxResult.success(list);
    }

                                                
    /**
     * 获取课程管理详细信息
     */
        @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(workCourseService.selectworkCourseById(id));
    }

    /**
     * 新增课程管理
     */
            @PostMapping
    public AjaxResult add(@RequestBody workCourse workCourse)
    {
        return toAjax(workCourseService.insertworkCourse(workCourse));
    }

    /**
     * 修改课程管理
     */
            @PostMapping("/update")
    public AjaxResult update(@RequestBody workCourse workCourse)
    {
        return toAjax(workCourseService.updateworkCourse(workCourse));
    }

    /**
     * 删除课程管理
     */
        	@GetMapping("/remove/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(workCourseService.deleteworkCourseByIds(ids));
    }
}
