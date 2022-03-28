package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.framework.web.core.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.dto.MenuTree;
import cn.sky1998.mongo.system.security.utils.SecurityUtils;
import cn.sky1998.mongo.system.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @PostMapping("/getDetail")
    public AjaxResult getDetail(@RequestBody Menu query){

        return AjaxResult.success(menuResourceService.getDatail(query));
    }

    @PostMapping("/getMenuByUser")
    public AjaxResult getMenuByUser(@RequestBody Account account){
        return  AjaxResult.success(menuResourceService.getMenuByUser(account));
    }

    @PostMapping("/tree")
    public AjaxResult tree(){
        return  AjaxResult.success(menuResourceService.tree());
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    //@GetMapping("getRouters")
    //public AjaxResult getRouters()
    //{
    //    List<MenuTree> tree = menuResourceService.tree();
    //    return AjaxResult.success(menuResourceService.buildMenus(tree));
    //}
}