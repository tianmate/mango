package cn.sky1998.mango.system.controller;

import java.util.List;

import cn.sky1998.mango.system.domain.sysLog;
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
import cn.sky1998.mango.system.domain.sysLog;
import cn.sky1998.mango.system.service.IsysLogService;
import cn.sky1998.mango.framework.web.core.page.TableDataInfo;

/**
 * 日志管理Controller
 * 
 * @author tcy
 * @date 2022-06-27
 */
@RestController
@RequestMapping("/system/sysLog")
public class sysLogController extends BaseController
{
    @Autowired
    private IsysLogService sysLogService;

    /**
     * 查询日志管理列表
     */
        @GetMapping("/list")
    public TableDataInfo list(sysLog sysLog)
    {
        startPage();
        List<sysLog> list = sysLogService.selectsysLogList(sysLog);
        return getDataTable(list);
    }

                                    
    /**
     * 获取日志管理详细信息
     */
        @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") java.math.BigInteger id)
    {
        return AjaxResult.success(sysLogService.selectsysLogById(id));
    }

    /**
     * 新增日志管理
     */
            @PostMapping
    public AjaxResult add(@RequestBody sysLog sysLog)
    {
        return toAjax(sysLogService.insertsysLog(sysLog));
    }

    /**
     * 修改日志管理
     */
            @PostMapping("/update")
    public AjaxResult update(@RequestBody sysLog sysLog)
    {
        return toAjax(sysLogService.updatesysLog(sysLog));
    }

    /**
     * 删除日志管理
     */
        	@GetMapping("/remove/{ids}")
    public AjaxResult remove(@PathVariable java.math.BigInteger[] ids)
    {
        return toAjax(sysLogService.deletesysLogByIds(ids));
    }
}
