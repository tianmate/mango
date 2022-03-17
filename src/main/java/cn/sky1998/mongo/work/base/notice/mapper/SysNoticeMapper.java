package cn.sky1998.mongo.work.base.notice.mapper;

import java.util.List;
import cn.sky1998.mongo.work.base.notice.domain.SysNotice;

/**
 * 通知公告Mapper接口
 * 
 * @author tcy
 * @date 2022-03-16
 */
public interface SysNoticeMapper 
{
    /**
     * 查询通知公告
     * 
     * @param noticeId 通知公告ID
     * @return 通知公告
     */
    public SysNotice selectSysNoticeById(Integer noticeId);

    /**
     * 查询通知公告列表
     * 
     * @param sysNotice 通知公告
     * @return 通知公告集合
     */
    public List<SysNotice> selectSysNoticeList(SysNotice sysNotice);

    /**
     * 新增通知公告
     * 
     * @param sysNotice 通知公告
     * @return 结果
     */
    public int insertSysNotice(SysNotice sysNotice);

    /**
     * 修改通知公告
     * 
     * @param sysNotice 通知公告
     * @return 结果
     */
    public int updateSysNotice(SysNotice sysNotice);

    /**
     * 删除通知公告
     * 
     * @param noticeId 通知公告ID
     * @return 结果
     */
    public int deleteSysNoticeById(Integer noticeId);

    /**
     * 批量删除通知公告
     * 
     * @param noticeIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysNoticeByIds(Integer[] noticeIds);
}
