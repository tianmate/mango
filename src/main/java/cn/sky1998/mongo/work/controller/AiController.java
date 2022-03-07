package cn.sky1998.mongo.work.controller;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.service.AiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.concurrent.ExecutionException;

/**
 * 情感分析，中文摘要，文章伪原创，文章分类
 * @author tcy
 * @Date 07-12-2021
 */
@RestController
@RequestMapping("/work/ai")
public class AiController {

    @Autowired
    private AiService aiService;

    /**
     * 文本伪原创
     * @param word
     * @return
     */
    @PostMapping("/textReplace")
    public AjaxResult textReplace(@RequestBody @Valid Word word) throws ExecutionException, InterruptedException {
        return AjaxResult.success(aiService.textReplace(word).get());
    }

    /**
     * 文本摘要
     * @param Article
     * @return
     */
    @PostMapping("/summary")
    public AjaxResult summary(String Article){
        return AjaxResult.success();
    }

}