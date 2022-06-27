package cn.sky1998.mango.system.service.impl;

import java.util.List;
import cn.sky1998.mango.common.utils.DateUtils;
import cn.sky1998.mango.system.domain.sysLog;
import cn.sky1998.mango.system.service.IsysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sky1998.mango.system.mapper.sysLogMapper;
import cn.sky1998.mango.system.domain.sysLog;
import cn.sky1998.mango.system.service.IsysLogService;

/**
 * 日志管理Service业务层处理
 * 
 * @author tcy
 * @date 2022-06-27
 */
@Service
public class sysLogServiceImpl implements IsysLogService
{
    @Autowired
    private sysLogMapper sysLogMapper;

    /**
     * 查询日志管理
     * 
     * @param id 日志管理ID
     * @return 日志管理
     */
    @Override
    public sysLog selectsysLogById(java.math.BigInteger id)
    {
        return sysLogMapper.selectsysLogById(id);
    }

    /**
     * 查询日志管理列表
     * 
     * @param sysLog 日志管理
     * @return 日志管理
     */
    @Override
    public List<sysLog> selectsysLogList(sysLog sysLog)
    {
        return sysLogMapper.selectsysLogList(sysLog);
    }

    /**
     * 新增日志管理
     * 
     * @param sysLog 日志管理
     * @return 结果
     */
    @Override
    public int insertsysLog(sysLog sysLog)
    {
        sysLog.setCreateTime(DateUtils.getNowDate());
        return sysLogMapper.insertsysLog(sysLog);
    }

    /**
     * 修改日志管理
     * 
     * @param sysLog 日志管理
     * @return 结果
     */
    @Override
    public int updatesysLog(sysLog sysLog)
    {
        return sysLogMapper.updatesysLog(sysLog);
    }

    /**
     * 批量删除日志管理
     * 
     * @param ids 需要删除的日志管理ID
     * @return 结果
     */
    @Override
    public int deletesysLogByIds(java.math.BigInteger[] ids)
    {
        return sysLogMapper.deletesysLogByIds(ids);
    }

    /**
     * 删除日志管理信息
     * 
     * @param id 日志管理ID
     * @return 结果
     */
    @Override
    public int deletesysLogById(java.math.BigInteger id)
    {
        return sysLogMapper.deletesysLogById(id);
    }
}
