package cn.sky1998.mango.framework.web.core;

import cn.sky1998.mango.framework.web.core.page.PageUtils;
import cn.sky1998.mango.framework.web.core.page.TableDataInfo;
import com.github.pagehelper.PageInfo;
import cn.sky1998.mango.common.enums.HttpStatus;
import cn.sky1998.mango.framework.web.core.AjaxResult;

import java.util.List;

import static cn.sky1998.mango.system.security.utils.SecurityUtils.getLoginUser;

/**
 * 基础Controller
 */
public class BaseController {

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows) {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 响应请求分页数据
     */
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.OK.aliasValue());
        rspData.setMsg("查询成功");
        rspData.setDatas(list);
        PageInfo<?> pageInfo = new PageInfo<>(list);
        rspData.setTotal(pageInfo.getTotal());
        rspData.setCount(pageInfo.getSize());
        return rspData;
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageUtils.startPage();
    }

    /**
     * 获取登录用户名
     */
    public String getUsername()
    {
        return getLoginUser().getUsername();
    }
}
