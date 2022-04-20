package cn.sky1998.mongo.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sky1998.mongo.work.mapper.testMapper;
import cn.sky1998.mongo.work.domain.test;
import cn.sky1998.mongo.work.service.ItestService;

/**
 * testService业务层处理
 * 
 * @author test
 * @date 2022-04-20
 */
@Service
public class testServiceImpl implements ItestService 
{
    @Autowired
    private testMapper testMapper;

    /**
     * 查询test
     * 
     * @param id testID
     * @return test
     */
    @Override
    public test selecttestById(String id)
    {
        return testMapper.selecttestById(id);
    }

    /**
     * 查询test列表
     * 
     * @param test test
     * @return test
     */
    @Override
    public List<test> selecttestList(test test)
    {
        return testMapper.selecttestList(test);
    }

    /**
     * 新增test
     * 
     * @param test test
     * @return 结果
     */
    @Override
    public int inserttest(test test)
    {
        return testMapper.inserttest(test);
    }

    /**
     * 修改test
     * 
     * @param test test
     * @return 结果
     */
    @Override
    public int updatetest(test test)
    {
        return testMapper.updatetest(test);
    }

    /**
     * 批量删除test
     * 
     * @param ids 需要删除的testID
     * @return 结果
     */
    @Override
    public int deletetestByIds(String[] ids)
    {
        return testMapper.deletetestByIds(ids);
    }

    /**
     * 删除test信息
     * 
     * @param id testID
     * @return 结果
     */
    @Override
    public int deletetestById(String id)
    {
        return testMapper.deletetestById(id);
    }
}
