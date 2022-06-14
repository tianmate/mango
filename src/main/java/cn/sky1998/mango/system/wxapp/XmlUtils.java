package cn.sky1998.mango.system.wxapp;

import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.system.wxapp.domain.Article;
import cn.sky1998.mango.system.wxapp.domain.BaseWxModel;
import cn.sky1998.mango.system.wxapp.domain.Image;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

import java.io.Writer;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class XmlUtils {
    /**
     * 获取xml中相应的字段名
     * @param str
     * @return
     */
    public static String getColunmValue(String str, String column) {
        String beginStr = "<" + column + "><![CDATA[";
        String endStr = "]]></" + column + ">";
        int i = str.indexOf(beginStr);
        int i2 = str.indexOf(endStr);
        if (i < 0) {
            beginStr = "<" + column + ">";
            endStr = "</" + column + ">";
            i = str.indexOf(beginStr);
            i2 = str.indexOf(endStr);
            if (i < 0) {
                return null;
            }
        }
        return str.substring(i + beginStr.length(), i2);
    }

    public static String parseToXml(Object o){
        StringBuffer stringBuffer = new StringBuffer();
        Method method;
        stringBuffer.append("<xml>");
        for (Class clazz = o.getClass();!clazz.equals(Object.class);clazz=clazz.getSuperclass()){
            Field fields[] = clazz.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String column = field.getName();
                Object o1 = null;
                try {
                    o1 = field.get(o);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
                if(Objects.nonNull(o1)){
                    try {
                        method= clazz.getDeclaredMethod("get" + column.toUpperCase().substring(0, 1) + column.substring(1));
                        if (!method.getName().equals("getMsgId")){
                            String result = (String) method.invoke(o);
                            stringBuffer.append("<"+method.getName().substring(3)+">");
                            if (!method.getName().equals("getCreateTime")){
                                stringBuffer.append("<![CDATA["+result+"]]></"+ method.getName().substring(3)+">");
                            }else {
                                stringBuffer.append(result+"</"+ method.getName().substring(3)+">");
                            }
                        }
                    } catch (NoSuchMethodException e) {
                        e.printStackTrace();
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        stringBuffer.append("</xml>");
        return  stringBuffer.toString();
    }


    public static void main(String[] args) {
        BaseWxModel baseWxModel = new BaseWxModel();
        baseWxModel.setCreateTime(new Date().toString());

        Image image=new Image();
        image.setMediaId("111");
        baseWxModel.setImage(image);

        System.out.println(beanToXml(baseWxModel));
    }

    /**
     * bean转成微信的xml消息格式
     * @param object
     * @return
     */
    public static String beanToXml( BaseWxModel object) {

        XStream xStream = getMyXStream();
        xStream.alias("xml", object.getClass());
        xStream.alias("item", new Article().getClass());

        xStream.processAnnotations(object.getClass());
        String xml = xStream.toXML(object);
        if (!StringUtils.isEmpty(xml)){
            return xml;
        }else{
            return null;
        }
    }

    //xstream扩展,bean转xml自动加上![CDATA[]]
    public static XStream getMyXStream() {
        return new XStream(new XppDriver() {
            @Override
            public HierarchicalStreamWriter createWriter(Writer out) {
                return new PrettyPrintWriter(out) {
                    // 对所有xml节点都增加CDATA标记
                    boolean cdata = true;

                    @Override
                    public void startNode(String name, Class clazz) {
                        super.startNode(name, clazz);
                    }

                    @Override
                    protected void writeText(QuickWriter writer, String text) {
                        if (cdata) {
                            writer.write("<![CDATA[");
                            writer.write(text);
                            writer.write("]]>");
                        } else {
                            writer.write(text);
                        }
                    }
                };
            }
        });
    }

    /**
     * 将图文消息转换为xml
     * @param baseWxModel
     * @return
     */
    public static String newsMessageToXml(BaseWxModel baseWxModel) {
        XStream xstream=new XStream();
        xstream.alias("xml", baseWxModel.getClass());//将根节点转换为<xml></xml>
        xstream.alias("item", new Article().getClass());
        return xstream.toXML(baseWxModel);
    }


}
