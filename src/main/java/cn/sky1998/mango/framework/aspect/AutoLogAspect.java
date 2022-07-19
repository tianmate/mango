package cn.sky1998.mango.framework.aspect;

import cn.sky1998.mango.common.constant.Constants;
import cn.sky1998.mango.common.utils.ip.IpUtils;
import cn.sky1998.mango.framework.aspect.annotation.AutoLog;
import cn.sky1998.mango.framework.utils.ServletUtils;
import cn.sky1998.mango.system.domain.sysLog;
import cn.sky1998.mango.system.mapper.sysLogMapper;
import cn.sky1998.mango.system.security.entity.AccountUserDetails;
import cn.sky1998.mango.system.security.utils.SecurityUtils;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.PropertyFilter;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 日志记录实现
 * @author tcy@1753163342@qq.com
 * @Date 27-06-2022
 */
@Aspect
@Component
public class AutoLogAspect {

    @Resource
    private sysLogMapper sysLogMapper;

    @Pointcut("@annotation(cn.sky1998.mango.framework.aspect.annotation.AutoLog)")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        //执行方法
        Object result = point.proceed();

        //保存日志
        saveSysLog(point, result);

        return result;
    }

    /**
     * 保存日志
     * @param joinPoint
     * @param obj
     */
    private void saveSysLog(ProceedingJoinPoint joinPoint, Object obj) {

        sysLog sysLogS=new sysLog();

        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        //获取request
        HttpServletRequest request = ServletUtils.getRequest();
        // HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
        //请求的参数
        String reqestParams = getReqestParams(request, joinPoint);

        //请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();

        //请求的URL
        String requestURI = request.getRequestURI();
        //设置IP地址
        String ipAddr = IpUtils.getIpAddr(request);

        sysLogS.setIp(ipAddr);
        sysLogS.setRequestUrl(requestURI);
        sysLogS.setRequestParam(reqestParams);
        sysLogS.setMethod(className+"."+methodName);

        AutoLog syslog = method.getAnnotation(AutoLog.class);

        if(syslog != null){

            //注解上的描述,操作日志内容
            String content = syslog.value();

            //注解上的日志类型 登录、操作、定时任务
            int loginType=syslog.logType();

            //注解上的日志类型 登录、操作、定时任务
            int operateType=syslog.operateType();

            //注解上的描述,业务标识字段key
            String work_key = syslog.key();
            List list= (List)JSONObject.parse(reqestParams);
            if (list!=null){
                Map parmMap = new HashMap();
                list.forEach(l->{
                    parmMap.putAll((Map)l);
                });
                // 业务标识字段value
            String work_value= (String) parmMap.get(work_key);

                sysLogS.setLogContent(content);
                sysLogS.setLogType(loginType);
                sysLogS.setOperateType(operateType);
                sysLogS.setWorkKey(work_key);
                sysLogS.setWorkValue(work_value);

            }

        }

        //获取登录用户信息
        if (SecurityUtils.getLoginUser()!=null){
            AccountUserDetails sysUser = (AccountUserDetails) SecurityUtils.getLoginUser();
            sysLogS.setUsername(sysUser.getUsername());
        }
        sysLogS.setCreateTime(new Date());
        //保存系统日志
        sysLogMapper.insertsysLog(sysLogS);

    }

    /**
     * @Description: 获取请求参数
     * @param request:  request
     * @param joinPoint:  joinPoint
     * @Return: java.lang.String
     */
    private String getReqestParams(HttpServletRequest request, JoinPoint joinPoint) {
        String httpMethod = request.getMethod();
        String params = "";
        //post put patch 请求
        if (Constants.HTTP_POST.equals(httpMethod) || Constants.HTTP_PUT.equals(httpMethod) || Constants.HTTP_PATCH.equals(httpMethod)) {
            Object[] paramsArray = joinPoint.getArgs();
            // java.lang.IllegalStateException: It is illegal to call this method if the current request is not in asynchronous mode (i.e. isAsyncStarted() returns false)
            //  https://my.oschina.net/mengzhang6/blog/2395893
            Object[] arguments  = new Object[paramsArray.length];
            for (int i = 0; i < paramsArray.length; i++) {
                if (paramsArray[i] instanceof BindingResult || paramsArray[i] instanceof ServletRequest || paramsArray[i] instanceof ServletResponse || paramsArray[i] instanceof MultipartFile) {
                    //ServletRequest不能序列化，从入参里排除，否则报异常：java.lang.IllegalStateException: It is illegal to call this method if the current request is not in asynchronous mode (i.e. isAsyncStarted() returns false)
                    //ServletResponse不能序列化 从入参里排除，否则报异常：java.lang.IllegalStateException: getOutputStream() has already been called for this response
                    continue;
                }
                arguments[i] = paramsArray[i];
            }
            //update-begin-author:taoyan date:20200724 for:日志数据太长的直接过滤掉
            PropertyFilter profilter = new PropertyFilter() {
                @Override
                public boolean apply(Object o, String name, Object value) {
                    int length = 500;
                    if(value!=null && value.toString().length()>length){
                        return false;
                    }
                    return true;
                }
            };
            params = JSONObject.toJSONString(arguments, profilter);
            //update-end-author:taoyan date:20200724 for:日志数据太长的直接过滤掉
        //get delete 请求
        } else {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            Method method = signature.getMethod();
            // 请求的方法参数值
            Object[] args = joinPoint.getArgs();
            // 请求的方法参数名称
            LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
            String[] paramNames = u.getParameterNames(method);
            if (args != null && paramNames != null) {
                for (int i = 0; i < args.length; i++) {
                    params += "  " + paramNames[i] + ": " + args[i];
                }
            }
        }
        return params;
    }
}