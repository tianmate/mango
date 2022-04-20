package cn.sky1998.mongo.work.mapper;

import java.util.List;
import cn.sky1998.mongo.work.domain.test;

/**
 * testMapper接口
 * 
 * @author test
 * @date 2022-04-20
 */
public interface testMapper 
{
    /**
     * 查询test
     * 
     * @param id testID
     * @return test
     */
    public test selecttestById(String id);

    /**
     * 查询test列表
     * 
     * @param test test
     * @return test集合
     */
    public List<test> selecttestList(test test);

    /**
     * 新增test
     * 
     * @param test test
     * @return 结果
     */
    public int inserttest(test test);

    /**
     * 修改test
     * 
     * @param test test
     * @return 结果
     */
    public int updatetest(test test);

    /**
     * 删除test
     * 
     * @param id testID
     * @return 结果
     */
    public int deletetestById(String id);

    /**
     * 批量删除test
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletetestByIds(String[] ids);
}
