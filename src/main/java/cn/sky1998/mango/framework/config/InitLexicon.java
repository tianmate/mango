package cn.sky1998.mango.framework.config;

import cn.sky1998.mango.framework.utils.RedisUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.*;

/**
 * 加载词库
 * @author tcy@1753163342@qq.com
 * @Date 20-12-2021
 */
@ConditionalOnProperty(prefix = "mango",name = "lexiconLoad",havingValue = "true")
@Component
public class InitLexicon implements CommandLineRunner {

    private final Logger log = LoggerFactory.getLogger(InitLexicon.class);


    /**
     * 词库加载到redis
     * @param args
     * @throws Exception
     */
    @Override
    public void run(String... args) throws Exception {
        log.info(">>>>>>>>>>开始加载词库...");
        int suffix = 0;
        Long needtime=System.currentTimeMillis();
        //加载词
        List<Map<String,String>> words=loadWords("/words/word.txt");
        //清空redis
        RedisUtils.empty();
        for (Map<String, String> word : words) {
            Set<Map.Entry<String, String>> entries = word.entrySet();
            for (Map.Entry<String, String> entry : entries) {
                //是否有key有则加后缀
                if (!RedisUtils.hasKey(entry.getKey())){
                    RedisUtils.setValue(entry.getKey(),entry.getValue());
                }else {
                    RedisUtils.setValue(entry.getKey()+suffix,entry.getValue());
                    suffix++;
                }

            }
        }
        log.info("<<<<<<<<<加载词库成功..."+"耗费时间"+(System.currentTimeMillis()-needtime));
    }

    /**
     * 从文件中读取到redis
     * @param s
     * @return
     */
    private List<Map<String, String>> loadWords(String s) throws IOException {
        List<Map<String, String>> maps=new ArrayList<>();
        InputStream stream = InitLexicon.class.getResourceAsStream("/words/word.txt");
      //  FileReader reader=new FileReader(s);
        BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(stream));
        String line="";
        while ((line=bufferedReader.readLine())!=null){
            String[] lines = line.split(" ");
            //两个词分别作为key-value放入
            if (lines.length==2){
            Map<String,String> map1=new HashMap<>();
            Map<String,String> map2=new HashMap<>();
            map1.put(lines[0],lines[1]);
            map2.put(lines[1],lines[0]);

            maps.add(map1);
            maps.add(map2);
            }
        }
        return maps;
    }
}