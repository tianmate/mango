package cn.sky1998.mongo.framework.quartz;

import cn.sky1998.mongo.system.util.SMSUtilsTencent;
import cn.sky1998.mongo.wxapp.domain.NightJoin;
import cn.sky1998.mongo.wxapp.domain.NightJoinPlanUserVo;
import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.mapper.NightJoinMapper;
import cn.sky1998.mongo.wxapp.mapper.PlanMapper;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author tcy
 * @Date 08-02-2022
 */
@Component
public class SendMsgJob extends QuartzJobBean {

    private static Logger log = LoggerFactory.getLogger(SendMsgJob.class);


    @Autowired
    private SMSUtilsTencent smsUtils;

    @Autowired
    private PlanMapper planMapper;

    @Autowired
    private NightJoinMapper nightJoinMapper;

    @Override
    @Transactional
    protected void executeInternal(JobExecutionContext context) {

        List<NightJoinPlanUserVo> listByPlanId;
      //  try {
            // get parameters
            context.getJobDetail().getJobDataMap().forEach(
                    (k, v) -> log.info("param, key:{}, value:{}", k, v)
            );
            // your logics
            log.info("SendMsg Job执行时间: " + new Date());

            //查询活动进行期数 和次数
            Plan plan=new Plan();
            plan.setName("晚安计划");
            plan.setEnable(0);
            Plan planRecent = planMapper.getPlan(plan);


            if (planRecent!=null){
                if (planRecent.getEnd()==0){
                //查询晚安计划报名表
                NightJoin nightJoin=new NightJoin();
                nightJoin.setPlanId(planRecent.getId());
                nightJoin.setSendEnable(0);
                listByPlanId = nightJoinMapper.getListByPlanId(nightJoin);

                //}catch (Exception e){
                //    throw new CustomException("业务异常");
                //}

               // String[] arr =  {"公众号[程序员田同学]"};

               // String tempId="1300158";
                    String[] arr = planRecent.getPara().split(",");
                    String tempId=planRecent.getTempId();
                    //模板id存多个每天取不同的
                    String[] split = tempId.split(",");
                    for (NightJoinPlanUserVo nightJoinPlanUserVo : listByPlanId) {

                    if(nightJoinPlanUserVo.getNightJoin().getSendNum()<planRecent.getNum()){

                      //  System.out.println(split[nightJoinPlanUserVo.getNightJoin().getSendNum()]);
                        smsUtils.sendMsgTencent(nightJoinPlanUserVo.getPublicUser().getTel(),arr,tempId,"程序员田同学");

                        //更新到短信表
                        nightJoinPlanUserVo.getNightJoin().setSendNum(nightJoinPlanUserVo.getNightJoin().getSendNum()+1);
                        nightJoinPlanUserVo.setNightJoin(nightJoinPlanUserVo.getNightJoin());

                        nightJoinMapper.updateByPrimaryKeySelective(nightJoinPlanUserVo.getNightJoin());
                    }else {
                        nightJoinPlanUserVo.getNightJoin().setSendEnable(1);
                        nightJoinPlanUserVo.setNightJoin(nightJoinPlanUserVo.getNightJoin());
                        nightJoinMapper.updateByPrimaryKeySelective(nightJoinPlanUserVo.getNightJoin());
                    }


                }
            }
            }

    }
}