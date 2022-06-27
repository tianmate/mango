package cn.sky1998.mango.common.constant;

/**
 * 通用常量信息
 *
 * @author tcy@1753163342@qq.com
 * @date 2021/7/7
 */
public class Constants {

    /**
     * UTF-8 字符集
     */
    public static final String UTF8 = "UTF-8";

    /**
     * GBK 字符集
     */
    public static final String GBK = "GBK";

    /**
     * http请求
     */
    public static final String HTTP = "http://";


    /**
     * https请求
     */
    public static final String HTTPS = "https://";

    /**POST请求*/
    public static final String HTTP_POST = "POST";

    /**PUT请求*/
    public static final String HTTP_PUT = "PUT";

    /**PATCH请求*/
    public static final String HTTP_PATCH = "PATCH";
    /**
     * http内容类型 json
     */
    public static final String CONTENT_TYPE_JSON = "application/json";

    /**
     * http内容类型 form
     */
    public static final String CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

    /**
     * http内容类型 文件
     */
    public static final String CONTENT_TYPE_MULTIPART = "multipart/form-data";
    /**
     * 令牌前缀
     */
    public static final String LOGIN_USER_KEY = "login_user_key";

    /**
     * 验证码 redis key
     */
    public static final String CAPTCHA_CODE_KEY = "captcha_codes:";

    /**
     * 验证码有效期（分钟）
     */
    public static final Integer CAPTCHA_EXPIRATION = 2;

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY = "sys_dict:";

    /**
     * 系统日志类型： 登录
     */
    public static final int LOG_TYPE_1 = 1;

    /**
     * 系统日志类型： 操作
     */
    public static final int LOG_TYPE_2 = 2;

    /**
     * 操作日志类型： 增加
     */
    public static final int OPERATE_TYPE_1 = 1;

    /**
     * 操作日志类型： 删除
     */
    public static final int OPERATE_TYPE_2 = 2;

    /**
     * 操作日志类型： 更新
     */
    public static final int OPERATE_TYPE_3 = 3;

    /**
     * 操作日志类型： 查询
     */
    public static final int OPERATE_TYPE_4 = 4;

    /**
     * 操作日志类型： 倒入
     */
    public static final int OPERATE_TYPE_5 = 5;

    /**
     * 操作日志类型： 导出
     */
    public static final int OPERATE_TYPE_6 = 6;

}
