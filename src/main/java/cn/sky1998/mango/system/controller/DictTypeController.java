package cn.sky1998.mango.system.controller;

import cn.sky1998.mango.framework.aspect.annotation.Dict;
import cn.sky1998.mango.framework.web.core.BaseController;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.gen.common.constant.UserConstants;
import cn.sky1998.mango.system.domain.SysDictType;
import cn.sky1998.mango.system.service.ISysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static cn.sky1998.mango.framework.web.core.AjaxResult.success;

/**
 * 数据字典信息
 * 
 * @author tcy@1753163342@qq.com
 */
@RestController
@RequestMapping("/system/dict")
public class DictTypeController extends BaseController
{
    @Autowired
    private ISysDictTypeService dictTypeService;

   // @PreAuthorize("@ss.hasPermi('system:dict:list')")
    @GetMapping("/list")
    public AjaxResult list(SysDictType dictType)
    {
        startPage();
        List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
        return AjaxResult.success(list);
    }


    /**
     * 查询字典类型详细
     */
   // @PreAuthorize("@ss.hasPermi('system:dict:query')")
    @GetMapping(value = "/getInfo/{dictId}")
    public AjaxResult getInfo(@PathVariable Long dictId)
    {
        return AjaxResult.success(dictTypeService.selectDictTypeById(dictId));
    }

    /**
     * 新增字典类型
     */
   // @PreAuthorize("@ss.hasPermi('system:dict:add')")
    @PostMapping("/add")
    public AjaxResult add(@Validated @RequestBody SysDictType dict)
    {
        if (UserConstants.NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict)))
        {
            return AjaxResult.error("新增字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }
       // dict.setCreateBy(getUsername());
        return toAjax(dictTypeService.insertDictType(dict));
    }

    /**
     * 修改字典类型
     */
  //  @PreAuthorize("@ss.hasPermi('system:dict:edit')")
    @PutMapping("/edit")
    public AjaxResult edit(@Validated @RequestBody SysDictType dict)
    {
        if (UserConstants.NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict)))
        {
            return AjaxResult.error("修改字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }
       // dict.setUpdateBy(getUsername());
        return toAjax(dictTypeService.updateDictType(dict));
    }

    /**
     * 删除字典类型
     */
   // @PreAuthorize("@ss.hasPermi('system:dict:remove')")
    @GetMapping("/remove/{dictIds}")
    public AjaxResult remove(@PathVariable Long[] dictIds)
    {
        dictTypeService.deleteDictTypeByIds(dictIds);
        return success();
    }

    /**
     * 刷新字典缓存
     */
   // @PreAuthorize("@ss.hasPermi('system:dict:remove')")
    @GetMapping("/refreshCache")
    public AjaxResult refreshCache()
    {
        dictTypeService.resetDictCache();
        return success();
    }

    /**
     * 获取字典选择框列表
     */
    @GetMapping("/optionselect")
    public AjaxResult optionselect()
    {
        List<SysDictType> dictTypes = dictTypeService.selectDictTypeAll();
        return success(dictTypes);
    }
}
