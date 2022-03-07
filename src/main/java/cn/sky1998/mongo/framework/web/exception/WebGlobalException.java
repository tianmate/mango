package cn.sky1998.mongo.framework.web.exception;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author tcy
 * @Date 14-12-2021
 */
@RestControllerAdvice
public class WebGlobalException {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public AjaxResult ValidException(MethodArgumentNotValidException e){
        return AjaxResult.error("参数校验异常"+e,500);
    }

}