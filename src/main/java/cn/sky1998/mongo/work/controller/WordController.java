package cn.sky1998.mongo.work.controller;

import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.domain.model.SingleWordDto;
import cn.sky1998.mongo.work.service.WordService;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

/**
 * 分词，简体转繁体，繁体转简体，同义词库
 * @author tcy
 * @Date 07-12-2021
 */
@RestController
@RequestMapping("/work/words")
public class WordController {

    @Autowired
    private WordService service;


    /**
     * 中文简体字转繁体字
     * @param word
     * @return
     */

    @PostMapping("/convertToTraditionalChinese")
    public AjaxResult convertToTraditionalChinese(@RequestBody @Valid Word word) throws ExecutionException, InterruptedException {
        Future<SingleWordDto> singleWordDtoFuture = service.convertToTraditionalChinese(word);
        return AjaxResult.success(singleWordDtoFuture.get());
    }

    /**
     * 中文分词
     * @param word
     * @return
     */
    @PostMapping("/segment")
    public AjaxResult segment(@RequestBody Word word){
        return AjaxResult.success(service.segment(word));
    }


    /**
     * 繁体转简体中文
     * @return
     */
    @PostMapping("/convertToSimpleChinese")
    public AjaxResult convertToSimpleChinese(@RequestBody @Valid Word word){
        return AjaxResult.success(service.convertToSimpleChinese(word));
    }

    /**
     * 汉字转拼音
     * @param word
     * @return
     */
    @PostMapping("/convertToPinyin")
    public AjaxResult convertToPinyin(@RequestBody @Valid Word word){

        return AjaxResult.success(service.convertToPinyin(word));
    }
    /**
     * 同义词查找
     * @param word
     * @return
     */
    @PostMapping("/synonymous")
    public AjaxResult synonymous(@RequestBody @Valid Word word){
        return AjaxResult.success(service.synonymous(word));
    }
}