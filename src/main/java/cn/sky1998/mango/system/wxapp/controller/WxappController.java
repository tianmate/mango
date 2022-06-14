package cn.sky1998.mango.system.wxapp.controller;

import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.system.wxapp.service.WxappService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/wechat")
public class WxappController {

    @Autowired
    private WxappService wxappService;

    @GetMapping("/getQrCode/public")
    public AjaxResult getQrCode(){
        return AjaxResult.success(wxappService.getQrCode());
    }

    /**
     * 验证token
     * @param response
     * @param signature
     * @param timestamp
     * @param nonce
     * @param echostr
     * @return
     * @throws IOException
     */
    @RequestMapping("/valid/public")
    public String validateWxappToken(HttpServletResponse response,String  signature, String timestamp, String nonce, String echostr) throws IOException {
        String s = wxappService.validateWxappToken(signature, timestamp, nonce, echostr);
        response.setCharacterEncoding("UTF-8");
       // response.getWriter().print(echostr);
        response.getOutputStream().print(echostr);
        return s;
    }

    /**
     * 接收用户的消息和事件
     * @param request
     * @param openid
     * @return
     */
    @PostMapping("/valid/public")
    public String getMessage(HttpServletRequest request,String  openid) {

        return wxappService.getMessage(request,openid);
    }



}
