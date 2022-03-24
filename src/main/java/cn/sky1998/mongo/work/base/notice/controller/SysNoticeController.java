package cn.sky1998.mongo.work.base.notice.controller;

import java.util.List;

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
import cn.sky1998.mongo.work.base.notice.domain.SysNotice;
import cn.sky1998.mongo.work.base.notice.service.ISysNoticeService;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;

/**
 * 通知公告Controller
 * 
 * @author tcy
 * @date 2022-03-16
 */
@RestController
@RequestMapping("/work/notice")
public class SysNoticeController extends BaseController
{
    @Autowired
    private ISysNoticeService sysNoticeService;

    /**
     * 查询通知公告列表
     */
   // @PreAuthorize("@ss.hasPermi('work:notice:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysNotice sysNotice)
    {
        startPage();
        List<SysNotice> list = sysNoticeService.selectSysNoticeList(sysNotice);
        return getDataTable(list);
    }

    /**
     * 导出通知公告列表
     */
                                    
    /**
     * 获取通知公告详细信息
     */
        @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable("noticeId") Integer noticeId)
    {
        return AjaxResult.success(sysNoticeService.selectSysNoticeById(noticeId));
    }

    /**
     * 新增通知公告
     */
            @PostMapping
    public AjaxResult add(@RequestBody SysNotice sysNotice)
    {
        return toAjax(sysNoticeService.insertSysNotice(sysNotice));
    }

    /**
     * 修改通知公告
     */
            @PutMapping
    public AjaxResult edit(@RequestBody SysNotice sysNotice)
    {
        return toAjax(sysNoticeService.updateSysNotice(sysNotice));
    }

    /**
     * 删除通知公告
     */
        	@DeleteMapping("/{noticeIds}")
    public AjaxResult remove(@PathVariable Integer[] noticeIds)
    {
        return toAjax(sysNoticeService.deleteSysNoticeByIds(noticeIds));
    }
}
