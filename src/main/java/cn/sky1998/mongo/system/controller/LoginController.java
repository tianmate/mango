package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.common.constant.Constants;
import cn.sky1998.mongo.common.utils.sign.Base64;
import cn.sky1998.mongo.common.utils.uuid.IdUtils;
import cn.sky1998.mongo.framework.util.RedisUtils;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.form.LoginBody;
import cn.sky1998.mongo.system.service.LoginService;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author tcy@1753163342@qq.com
 * @Date 21-01-2022
 */
@RestController
@RequestMapping("/system/login")
public class LoginController {

    @Autowired
    private LoginService loginService;


    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;


    @PostMapping("/common")
    public AjaxResult login(@RequestBody LoginBody loginBody ){
        return  AjaxResult.success(loginService.commonLogin(loginBody));
    }

    @PostMapping("/gzhLogin")
    public AjaxResult gzhLogin(@RequestBody Account sysAccount ){
        return  AjaxResult.success(loginService.gzhLogin(sysAccount));
    }

    @GetMapping("/createImageCode")
    public AjaxResult createImageCode(){
        AjaxResult ajax = AjaxResult.success();
        String capStr = null, code = null;
        BufferedImage image = null;

            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            // 保存验证码信息
            String uuid = IdUtils.simpleUUID();
            String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
            image = captchaProducerMath.createImage(capStr);

        RedisUtils.setValue(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return AjaxResult.error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", "data:image/gif;base64," +Base64.encode(os.toByteArray()));
        return ajax;
    }

}