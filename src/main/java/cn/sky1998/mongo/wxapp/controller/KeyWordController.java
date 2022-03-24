package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.core.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;
import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.service.KeyWordService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 关键词管理
 * @author tcy
 * @Date 15-02-2022
 */
@RestController
@RequestMapping("/wechat/keyWord")
public class KeyWordController extends BaseController {

    @Autowired
    private KeyWordService keyWordService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Keyword keyword){
        return AjaxResult.success(keyWordService.add(keyword));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Keyword keyword){
        return AjaxResult.success(keyWordService.update(keyword));
    }

    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody Keyword keyword){

        //分页插件使用
        if (keyword.getPageNum()!=null&&keyword.getPageSize()!=null){
            PageHelper.startPage(keyword.getPageNum(),keyword.getPageSize());
        }

        return getDataTable(keyWordService.getList(keyword));
    }
}