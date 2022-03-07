package cn.sky1998.mongo;

import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.service.impl.WordServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author tcy
 * @Date 13-12-2021
 */
@SpringBootTest
public class WordTest {

    @Autowired
    WordServiceImpl wordService;

    @Test
    public void test1() {
        for (int i = 0; i < 10; i++) {
            Word word=new Word();
            word.setText("国家公祭日");
            wordService.convertToTraditionalChinese(word);
        }

    }
}