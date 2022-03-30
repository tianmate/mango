package cn.sky1998.mongo.common.enums;


/**
 * Http状态枚举
 * <p>
 * {@code 1**}  信息，服务器收到请求，需要请求者继续执行操作
 * {@code 2**}  成功，操作被成功接收并处理
 * {@code 3**}  重定向，需要进一步的操作以完成请求
 * {@code 4**}  客户端错误，请求包含语法错误或无法完成请求
 * {@code 5**}  服务器错误，服务器在处理请求的过程中发生了错误
 *
 * @author tcy@1753163342@qq.com
 * @date 2021/6/30
 */
public enum HttpStatus {

    /**
     * 已接受。已经接受请求，但未处理完成
     */
    ACCEPTED("ACCEPTED", 202),

    /**
     * 作为网关或者代理工作的服务器尝试执行请求时，从远程服务器接收到了一个无效的响应
     */
    BAD_GATEWAY("BAD_GATEWAY", 502),

    /**
     * 客户端请求的语法错误，服务器无法理解
     */
    BAD_REQUEST("BAD_REQUEST", 400),

    /**
     * 服务器完成客户端的PUT请求是可能返回此代码，服务器处理请求时发生了冲突
     */
    CONFLICT("CONFLICT", 409),

    /**
     * 继续。客户端应继续其请求
     */
    CONTINUE("CONTINUE", 100),

    /**
     * 已创建。成功请求并创建了新的资源
     */
    CREATED("CREATED", 201),

    /**
     * 服务器无法满足Expect的请求头信息
     */
    EXPECTATION_FAILED("EXPECTATION_FAILED", 417),

    /**
     * 服务器理解请求客户端的请求，但是拒绝执行此请求
     */
    FORBIDDEN("FORBIDDEN", 403),

    /**
     * 临时移动。与301类似。但资源只是临时被移动。客户端应继续使用原有URI
     */
    FOUND("FOUND", 302),

    /**
     * 充当网关或代理的服务器，未及时从远端服务器获取请求
     */
    GATEWAY_TIMEOUT("GATEWAY_TIMEOUT", 504),

    /**
     * 客户端请求的资源已经不存在。410不同于404，如果资源以前有现在被永久删除了可使用410代码，网站设计人员可通过301代码指定资源的新位置
     */
    GONE("GONE", 410),

    /**
     * 服务器不支持请求的HTTP协议的版本，无法完成处理
     */
    HTTP_VERSION_NOT_SUPPORTED("HTTP_VERSION_NOT_SUPPORTED", 505),

    /**
     * 服务器内部错误，无法完成请求
     */
    INTERNAL_SERVER_ERROR("INTERNAL_SERVER_ERROR", 500),

    /**
     * 服务器无法处理客户端发送的不带Content-Length的请求信息
     */
    LENGTH_REQUIRED("LENGTH_REQUIRED", 411),

    /**
     * 客户端请求中的方法被禁止
     */
    METHOD_NOT_ALLOWED("METHOD_NOT_ALLOWED", 405),

    /**
     * 永久移动。请求的资源已被永久的移动到新URI，返回信息会包括新的URI，浏览器会自动定向到新URI。今后任何新的请求都应使用新的URI代替
     */
    MOVED_PERMANENTLY("MOVED_PERMANENTLY", 301),

    /**
     * 多种选择。请求的资源可包括多个位置，相应可返回一个资源特征与地址的列表用于用户终端（例如：浏览器）选择
     */
    MULTIPLE_CHOICES("MULTIPLE_CHOICES", 300),

    /**
     * 非授权信息。请求成功。但返回的meta信息不在原始的服务器，而是一个副本
     */
    NON_AUTHORITATIVE_INFORMATION("NON_AUTHORITATIVE_INFORMATION", 203),

    /**
     * 服务器无法根据客户端请求的内容特性完成请求
     */
    NOT_ACCEPTABLE("NOT_ACCEPTABLE", 406),

    /**
     * 服务器无法根据客户端的请求找到资源（网页）。通过此代码，网站设计人员可设置"您所请求的资源无法找到"的个性页面
     */
    NOT_FOUND("NOT_FOUND", 404),

    /**
     * 服务器不支持请求的功能，无法完成请求
     */
    NOT_IMPLEMENTED("NOT_IMPLEMENTED", 501),

    /**
     * 未修改。所请求的资源未修改，服务器返回此状态码时，不会返回任何资源。客户端通常会缓存访问过的资源，通过提供一个头信息指出客户端希望只
     * 返回在指定日期之后修改的资源
     */
    NOT_MODIFIED("SEE_OTHER", 304),

    /**
     * 无内容。服务器成功处理，但未返回内容。在未更新网页的情况下，可确保浏览器继续显示当前文档
     */
    NO_CONTENT("NO_CONTENT", 204),

    /**
     * 请求成功。一般用于GET与POST请求
     */
    OK("OK", 200),

    /**
     * 部分内容。服务器成功处理了部分GET请求
     */
    PARTIAL_CONTENT("PARTIAL_CONTENT", 206),

    /**
     * 保留，将来使用
     */
    PAYMENT_REQUIRED("PAYMENT_REQUIRED", 402),

    /**
     * 客户端请求信息的先决条件错误
     */
    PRECONDITION_FAILED("PRECONDITION_FAILED", 412),

    /**
     * 请求要求代理的身份认证，与401类似，但请求者应当使用代理进行授权
     */
    PROXY_AUTHENTICATION_REQUIRED("PROXY_AUTHENTICATION_REQUIRED", 407),

    /**
     * 客户端请求的范围无效
     */
    REQUESTED_RANGE_NOT_SATISFIABLE("REQUESTED_RANGE_NOT_SATISFIABLE", 416),

    /**
     * 由于请求的实体过大，服务器无法处理，因此拒绝请求。为防止客户端的连续请求，服务器可能会关闭连接。如果只是服务器暂时无法处理，则会包含
     * 一个Retry-After的响应信息
     */
    REQUEST_ENTITY_TOO_LARGE("REQUEST_ENTITY_TOO_LARGE", 413),

    /**
     * 服务器等待客户端发送的请求时间过长，超时
     */
    REQUEST_TIMEOUT("REQUEST_TIMEOUT", 408),

    /**
     * 请求的URI过长（URI通常为网址），服务器无法处理
     */
    REQUEST_URI_TOO_LONG("REQUEST_URI_TOO_LONG", 414),

    /**
     * 重置内容。服务器处理成功，用户终端（例如：浏览器）应重置文档视图。可通过此返回码清除浏览器的表单域
     */
    RESET_CONTENT("NO_CONTENT", 205),

    /**
     * 查看其它地址。与301类似。使用GET和POST请求查看
     */
    SEE_OTHER("SEE_OTHER", 303),

    /**
     * 由于超载或系统维护，服务器暂时的无法处理客户端的请求。延时的长度可包含在服务器的Retry-After头信息中
     */
    SERVICE_UNAVAILABLE("SERVICE_UNAVAILABLE", 503),

    /**
     * 切换协议。服务器根据客户端的请求切换协议。只能切换到更高级的协议，例如，切换到HTTP的新版本协议
     */
    SWITCHING_PROTOCOLS("SWITCHING_PROTOCOLS", 101),

    /**
     * 临时重定向。与302类似。使用GET请求重定向
     */
    TEMPORARY_REDIRECT("TEMPORARY_REDIRECT", 307),

    /**
     * 请求要求用户的身份认证
     */
    UNAUTHORIZED("UNAUTHORIZED", 401),

    /**
     * 服务器无法处理请求附带的媒体格式
     */
    UNSUPPORTED_MEDIA_TYPE("UNSUPPORTED_MEDIA_TYPE", 415),

    /**
     * 已经被废弃的HTTP状态码
     */
    UNUSED("UNUSED", 306),

    /**
     * 使用代理。所请求的资源必须通过代理访问
     */
    USE_PROXY("SEE_OTHER", 305);

    private final String aliasName;

    private final int aliasValue;

    HttpStatus(String aliasName, int aliasValue) {
        this.aliasName = aliasName;
        this.aliasValue = aliasValue;
    }


    public String aliasName() {
        return aliasName;
    }

    public Integer aliasValue() {
        return aliasValue;
    }

}
