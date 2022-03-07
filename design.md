一、包设计
common 基础_java相关
    -enums 自定义枚举常量
    -exception 自定义异常
    -自定义工具类
framework 核心_spring相关
    -config 注入类（如redis，mondob）
    -web 开发基础类
        --controller 基础控制层
        --core 返回封装
system 系统包_权限后台

work 业务包

二、数据库设计
系统权限表
用户sys_account
角色sys_role
用户-角色sys_account_role
权限sys_authority
角色-权限sys_role_authority
菜单资源sys_menu
权限-资源sys_authority_source
日志表
log_sys 操作人，操作时间，操作接口，响应时间，操作类型，异常类型
log_exception 异常时间，异常接口，异常类型（系统，业务），用户id
业务表
接口资源表p_api_resource
用户接口资源表p_user_api
使用表p_used_api

三、公众号设计
网站扫码登陆报名
用户回复：报名，回复表单（昵称，性别，手机号）收集信息
定时任务 根据表单信息匹配 手机号发短信
用户回复，是否继续交换微信，双方交换微信

用户信息表
openid 昵称 手机号 性别 地理位置 微信号

回复：交换 公众号：请留下你的祝福
回复：新年祝福 公众号：@B ***** 请留下你的微信
回复：qingtengpai 公众号：收到@B的祝福 并尽快与你交换

关键字表
关键字 回复
交换 嗨，你来了。。。。

发送内容表
openid message parent_id 时间

A 发送 B回复

一期 程序员田同学晚安计划-新年伊始献给赶路人的礼物
    网站报名
    公众号报名
 系统推送晚安短信，表单报名，发送短信
    user:晚安计划
    sys:发送一个表单
    
二期
 交换今天的一件小事，并可交换微信ID
    user:晚安互换
    sys:请输入你的昵称
    user:啦啦
    sys:请输入你的晚安话
    user:晚安陌生人
    sys:收到，尽快与你交换
    sys:@啦啦与你交换了晚安，望你安心入睡，有一次机会输入交换，与他（她）交换微信ID
    user:交换
    sys:请输入你的微信ID
    user:qingtengpai
    sys:收到

用户报名参加晚安短信，可以发送 交换 参加陌生人匹配
发送普通晚安短信 

晚安每月最后三天
早安每月前三天
三天可以交换晚安祝福


