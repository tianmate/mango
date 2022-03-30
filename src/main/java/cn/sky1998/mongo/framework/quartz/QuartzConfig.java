package cn.sky1998.mongo.framework.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author tcy@1753163342@qq.com
 * @Date 08-02-2022
 */
@Configuration
public class QuartzConfig {

    @Value("${mango.cron}")
    private String cron;

    //@Bean("SendMsgJob")
    //public JobDetail helloJobDetail() {
    //    return JobBuilder.newJob(SendMsgJob.class)
    //            .withIdentity("DateTimeJob")
    //            .usingJobData("msg", "Hello Quartz")
    //            .storeDurably()//即使没有Trigger关联时，也不需要删除该JobDetail
    //            .build();
    //}

    //@Bean
    //public Trigger printTimeJobTrigger() {
    //    // 每天6:05
    //    CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cron);
    //    return TriggerBuilder.newTrigger()
    //            .forJob(helloJobDetail())
    //            .withIdentity("quartzTaskService")
    //            .withSchedule(cronScheduleBuilder)
    //            .build();
    //}

}