package cn.sky1998.mango;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

@SpringBootApplication
public class MangoApplication implements ApplicationRunner {

    private Logger log= LoggerFactory.getLogger(MangoApplication.class);

    public static void main(String[] args) {
        SpringApplication application=new SpringApplication(MangoApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
       // SpringApplication.run(MangoApplication.class, args);

    }


    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("mango go go go!");
    }
}
