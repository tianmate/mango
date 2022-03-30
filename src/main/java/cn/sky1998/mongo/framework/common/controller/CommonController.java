package cn.sky1998.mongo.framework.common.controller;

import cn.sky1998.mongo.common.utils.FileUtils;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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
}