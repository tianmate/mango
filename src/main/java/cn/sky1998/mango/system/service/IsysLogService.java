package cn.sky1998.mango.system.service;

import java.util.List;
import cn.sky1998.mango.system.domain.sysLog;

/**
 * 日志管理Service接口
 * 
 * @author tcy
 * @date 2022-06-27
 */
public interface IsysLogService 
{
    /**
     * 查询日志管理
     * 
     * @param id 日志管理ID
     * @return 日志管理
     */
    public sysLog selectsysLogById(java.math.BigInteger id);

    /**
     * 查询日志管理列表
     * 
     * @param sysLog 日志管理
     * @return 日志管理集合
     */
    public List<sysLog> selectsysLogList(sysLog sysLog);

    /**
     * 新增日志管理
     * 
     * @param sysLog 日志管理
     * @return 结果
     */
    public int insertsysLog(sysLog sysLog);

    /**
     * 修改日志管理
     * 
     * @param sysLog 日志管理
     * @return 结果
     */
    public int updatesysLog(sysLog sysLog);

    /**
     * 批量删除日志管理
     * 
     * @param ids 需要删除的日志管理ID
     * @return 结果
     */
    public int deletesysLogByIds(java.math.BigInteger[] ids);

    /**
     * 删除日志管理信息
     * 
     * @param id 日志管理ID
     * @return 结果
     */
    public int deletesysLogById(java.math.BigInteger id);
}
