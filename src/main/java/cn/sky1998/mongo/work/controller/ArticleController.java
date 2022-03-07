package cn.sky1998.mongo.work.controller;

import cn.sky1998.mongo.framework.web.controller.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文章解析树，关键词提取，名词识别
 *  @author tcy
 *  @Date 07-12-2021
 */
@RestController
@RequestMapping("/work/article")
public class ArticleController extends BaseController {

    /**
     * 上传文件（。doc）解析成自定义文章树
     * @return
     */
    @PostMapping("/parserArticleByDoc")
    public AjaxResult parserArticleByDoc(){
        return null;
    }

    /**
     * 上传文本解析成自定义文章树
     * @return
     */
    @PostMapping("/parserArticleByText")
    public AjaxResult parserArticleByText(){
        return null;
    }

    /**
     * 文章辅助系统，传入一篇文章，查询出他所有的关键词显著的显示出来
     * @return
     */
    @PostMapping("/assistArticle")
    public AjaxResult assistArticle(){
    return null;
    }
}
