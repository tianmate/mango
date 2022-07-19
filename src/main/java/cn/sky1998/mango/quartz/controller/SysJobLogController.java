package cn.sky1998.mango.quartz.controller;

import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.framework.web.core.BaseController;
import cn.sky1998.mango.quartz.domain.SysJobLog;
import cn.sky1998.mango.quartz.service.ISysJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 调度日志操作处理
 * 
 * @author tcy@1753163342@qq.com
 */
@RestController
@RequestMapping("/monitor/jobLog")
public class SysJobLogController extends BaseController
{
    @Autowired
    private ISysJobLogService jobLogService;

    /**
     * 查询定时任务调度日志列表
     */
    //@PreAuthorize("@ss.hasPermi('monitor:job:list')")
    @GetMapping("/list")
    public AjaxResult list(SysJobLog sysJobLog)
    {
        startPage();
        List<SysJobLog> list = jobLogService.selectJobLogList(sysJobLog);
        return AjaxResult.success(list);
    }

    
    /**
     * 根据调度编号获取详细信息
     */
    //@PreAuthorize("@ss.hasPermi('monitor:job:query')")
    @GetMapping(value = "/{configId}")
    public AjaxResult getInfo(@PathVariable Long jobLogId)
    {
        return AjaxResult.success(jobLogService.selectJobLogById(jobLogId));
    }


    /**
     * 删除定时任务调度日志
     */
    //@PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @DeleteMapping("/{jobLogIds}")
    public AjaxResult remove(@PathVariable Long[] jobLogIds)
    {
        return toAjax(jobLogService.deleteJobLogByIds(jobLogIds));
    }

    /**
     * 清空定时任务调度日志
     */
    //@PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @DeleteMapping("/clean")
    public AjaxResult clean()
    {
        jobLogService.cleanJobLog();
        return AjaxResult.success();
    }
}
