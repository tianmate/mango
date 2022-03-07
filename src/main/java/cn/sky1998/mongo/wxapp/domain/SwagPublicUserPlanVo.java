package cn.sky1998.mongo.wxapp.domain;

/**
 * @author tcy
 * @Date 18-02-2022
 */
public class SwagPublicUserPlanVo {

    private PublicUser publicUser;

    private Plan plan;

    private Swag swag;

    public PublicUser getPublicUser() {
        return publicUser;
    }

    public void setPublicUser(PublicUser publicUser) {
        this.publicUser = publicUser;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Swag getSwag() {
        return swag;
    }

    public void setSwag(Swag swag) {
        this.swag = swag;
    }
}