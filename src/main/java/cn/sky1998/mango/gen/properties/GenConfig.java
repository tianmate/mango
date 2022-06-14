package cn.sky1998.mango.gen.properties;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * 读取代码生成相关配置
 * 
 * @author tcy@1753163342@qq.com
 */
@Component
@ConfigurationProperties(prefix = "gen")
public class GenConfig
{
    /** 作者 */
    @Value("${gen.author}")
    public String author;

    /** 生成包路径 */
    @Value("${gen.packageName}")
    public String packageName;

    /** 自动去除表前缀，默认是false */
    public Boolean autoRemovePre;

    /** 表前缀(类名不会包含表前缀) */
    @Value("${gen.tablePrefix}")
    public String tablePrefix;

    /** 表名字*/
    @Value("${gen.tableName}")
    private String tableName;

    public Boolean getAutoRemovePre() {
        return autoRemovePre;
    }

    @Value("${gen.autoRemovePre}")
    public void setAutoRemovePre(String autoRemovePre) {
        this.autoRemovePre = Boolean.parseBoolean(autoRemovePre);
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

    public void setAutoRemovePre(Boolean autoRemovePre) {
        this.autoRemovePre = autoRemovePre;
    }

    public String getTablePrefix() {
        return tablePrefix;
    }

    public void setTablePrefix(String tablePrefix) {
        this.tablePrefix = tablePrefix;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}
