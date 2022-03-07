package cn.sky1998.mongo.wxapp.domain;

/**
 * @author tcy
 * @Date 17-02-2022
 */
public class NightJoinPlanUserVo {

    private NightJoin nightJoin;

    private Plan plan;

    private PublicUser publicUser;

    public NightJoin getNightJoin() {
        return nightJoin;
    }

    public void setNightJoin(NightJoin nightJoin) {
        this.nightJoin = nightJoin;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public PublicUser getPublicUser() {
        return publicUser;
    }

    public void setPublicUser(PublicUser publicUser) {
        this.publicUser = publicUser;
    }
}