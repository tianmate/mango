package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.framework.web.controller.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.page.TableDataInfo;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.service.MenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 菜单管理
 * @author tcy
 * @Date 13-01-2022
 */
@RestController
@RequestMapping("/system/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuResourceService;


    @PostMapping("/getListByRole")
    public AjaxResult getListByRole(){
        return AjaxResult.success(menuResourceService.getListByRole());
    }

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Menu menuResource){
        return AjaxResult.success(menuResourceService.add(menuResource));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Menu menuResource){
        return AjaxResult.success(menuResourceService.update(menuResource));
    }

    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody Menu query){

        return getDataTable(menuResourceService.getList(query));
    }

    @PostMapping("/getMenuByUser")
    public AjaxResult getMenuByUser(@RequestBody Account account){
        return  AjaxResult.success(menuResourceService.getMenuByUser(account));
    }
}