package cn.sky1998.mango.framework.web.core.page;

import cn.sky1998.mango.common.utils.SqlUtil;
import cn.sky1998.mango.common.utils.StringUtils;
import com.github.pagehelper.PageHelper;

/**
 * 分页工具类
 * 
 * @author tcy@1753163342@qq.com
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
