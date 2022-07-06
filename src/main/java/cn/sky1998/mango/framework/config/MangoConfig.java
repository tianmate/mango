package cn.sky1998.mango.framework.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 系统配置相关
 * @author tcy@1753163342@qq.com
 * @Date 20-12-2021
 */
@Component
@ConfigurationProperties(prefix = "mango")
public class MangoConfig {

    /**
     * 项目名称
     */
    private String name;

    /**
     * 版本
     */
    private String version;

    /**
     * 上传路径
     */
    private String profile;

    /**
     * 上传路径
     */
    private static Boolean addressEnabled;

    /**
     * 验证码开关
     */
    private Boolean captchaEnable;

    @Value("${mango.wxapp.gzh.appid}")
    private String wxappGzhAppid;

    @Value("${mango.wxapp.gzh.appid}")
    private String wxappGzhSecret;

    @Value("${mango.wxapp.oss.secretId}")
    private String wxappOssSecreatId;

    @Value("${mango.wxapp.oss.secretKey}")
    private String wxappOssSecreatkey;

    @Value("${mango.wxapp.oss.region}")
    private String wxappOssRegion;

    @Value("${mango.wxapp.oss.bucketName}")
    private String wxappOssBucketName;

    @Value("${mango.wxapp.uniapp.appid}")
    private String wxappUniappAppid;

    @Value("${mango.wxapp.uniapp.secret}")
    private String wxappUniappSecret;

    //代码生成
    @Value("${gen.author}")
    private String author;
    @Value("${gen.packageName}")
    private String packageName;
    @Value("${gen.moduleName}")
    private String moduleName;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getWxappGzhAppid() {
        return wxappGzhAppid;
    }

    public void setWxappGzhAppid(String wxappGzhAppid) {
        this.wxappGzhAppid = wxappGzhAppid;
    }

    public String getWxappGzhSecret() {
        return wxappGzhSecret;
    }

    public void setWxappGzhSecret(String wxappGzhSecret) {
        this.wxappGzhSecret = wxappGzhSecret;
    }

    public String getWxappOssSecreatId() {
        return wxappOssSecreatId;
    }

    public void setWxappOssSecreatId(String wxappOssSecreatId) {
        this.wxappOssSecreatId = wxappOssSecreatId;
    }

    public String getWxappOssSecreatkey() {
        return wxappOssSecreatkey;
    }

    public void setWxappOssSecreatkey(String wxappOssSecreatkey) {
        this.wxappOssSecreatkey = wxappOssSecreatkey;
    }

    public String getWxappOssRegion() {
        return wxappOssRegion;
    }

    public void setWxappOssRegion(String wxappOssRegion) {
        this.wxappOssRegion = wxappOssRegion;
    }

    public String getWxappOssBucketName() {
        return wxappOssBucketName;
    }

    public void setWxappOssBucketName(String wxappOssBucketName) {
        this.wxappOssBucketName = wxappOssBucketName;
    }

    public String getWxappUniappAppid() {
        return wxappUniappAppid;
    }

    public void setWxappUniappAppid(String wxappUniappAppid) {
        this.wxappUniappAppid = wxappUniappAppid;
    }

    public String getWxappUniappSecret() {
        return wxappUniappSecret;
    }

    public void setWxappUniappSecret(String wxappUniappSecret) {
        this.wxappUniappSecret = wxappUniappSecret;
    }

    public static Boolean getAddressEnabled() {
        return addressEnabled;
    }

    public static void setAddressEnabled(Boolean addressEnabled) {
        MangoConfig.addressEnabled = addressEnabled;
    }

    public Boolean getCaptchaEnable() {
        return captchaEnable;
    }

    public void setCaptchaEnable(Boolean captchaEnable) {
        this.captchaEnable = captchaEnable;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }
}