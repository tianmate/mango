package cn.sky1998.mongo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

@SpringBootApplication
public class MongoApplication implements ApplicationRunner {

    private Logger log= LoggerFactory.getLogger(MongoApplication.class);

    public static void main(String[] args) {
        SpringApplication application=new SpringApplication(MongoApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
       // SpringApplication.run(MongoApplication.class, args);

    }


    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("mango article go go go!");
    }
}
