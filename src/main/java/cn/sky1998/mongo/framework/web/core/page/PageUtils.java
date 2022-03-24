package cn.sky1998.mongo.framework.web.core.page;

import cn.sky1998.mongo.common.utils.SqlUtil;
import cn.sky1998.mongo.common.utils.StringUtils;
import cn.sky1998.mongo.framework.web.core.page.PageDomain;
import cn.sky1998.mongo.framework.web.core.page.TableSupport;
import com.github.pagehelper.PageHelper;

/**
 * 分页工具类
 * 
 * @author tcy
 */
public class PageUtils extends PageHelper
{
    /**
     * 设置请求分页数据
     */
    public static void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            Boolean reasonable = pageDomain.getReasonable();
            PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
        }
    }
}
