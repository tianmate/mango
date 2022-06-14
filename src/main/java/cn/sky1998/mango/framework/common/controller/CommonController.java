package cn.sky1998.mango.framework.common.controller;

import cn.sky1998.mango.common.utils.FileUtils;
import cn.sky1998.mango.framework.config.MangoConfig;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 公共处理接口
 * @author tcy@1753163342@qq.com
 * @Date 18-12-2021
 */
@RestController
@RequestMapping("/common")
public class CommonController {

    @Autowired
    private FileUtils fileUtils;

    @Autowired
    private MangoConfig mangoConfig;

    /**
     * 文件上传到腾讯云oss并解析文件成 树 数据结构
     * @param file
     * @return
     * @throws IOException
     */
    @PostMapping("/file/upload")
    @ResponseBody
    public AjaxResult upload(MultipartFile file) {

        if (file.isEmpty()) {
            return AjaxResult.error("上传失败，请选择文件");
        }

        String s = fileUtils.uplodLocal(file);

        return AjaxResult.success(s);
    }

    /**
     * 返回系统配置信息
     */
    @GetMapping("/config/info")
    @ResponseBody
    public AjaxResult getConfigInfo(){

        Boolean captchaEnable = mangoConfig.getCaptchaEnable();
        String systemName=mangoConfig.getName();

        Map map=new HashMap(2);
        map.put("captchaEnable",captchaEnable);
        map.put("systemName",systemName);

        return AjaxResult.success(map);
    }
}