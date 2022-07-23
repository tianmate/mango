package cn.sky1998.mango.common.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 上传一个底图、一个二维码，两段文案
 * @author tcy
 * @Date 20-07-2022
 */
public class DrawImgUtils {

    public static void main(String[] args) {
        String backgroundPath = "D:\\idea_demo\\1.jpg";

       // getImgInfo(backgroundPath);
        String qrCodePath = "D:\\idea_demo\\2.jpg";
        String message01 ="长按识别下方二维码，查看更多劲爆图文和视频";
        String message02 = "男人必备，你的私房小秘书！";
        String outPutPath="D:\\idea_demo\\end.jpg";
        overlapImage(backgroundPath,qrCodePath,message01,message02,outPutPath,80,80);
        //overlapImage(backgroundPath,qrCodePath,message01,message02,outPutPath);
    }

    /**
     *  二维码所处的位置
     * @param backgroundPath 背景图
     * @param qrCodePath 二维码
     * @param message01 文字1
     * @param message02 文字2
     * @param outPutPath 输出图片路径
     * @return
     */
    public static String overlapImage(String backgroundPath,String qrCodePath,String message01,String message02,String outPutPath,
                                      Integer position_x,Integer position_y){
        try {
            //设置图片大小
            //BufferedImage background = resizeImage(1000,618, ImageIO.read(new File(backgroundPath)));
            //原始图片宽度、高度
            Integer sourceWidth=getImgWidth(backgroundPath);
            Integer sourceHeight=getImgHeight(backgroundPath);

            BufferedImage background = resizeImage(sourceWidth,sourceHeight, ImageIO.read(new File(backgroundPath)));
            BufferedImage qrCode = resizeImage(150,150,ImageIO.read(new File(qrCodePath)));

            //二维码位置
            int target_x= (int) (sourceWidth*position_x*0.01);
            int target_y= (int) (sourceHeight*position_y*0.01);

            //在背景图片中添加入需要写入的信息，例如：扫描下方二维码，欢迎大家添加我的淘宝返利机器人，居家必备，省钱购物专属小秘书！
            Graphics2D g = background.createGraphics();
            g.setColor(Color.white);
            g.setFont(new Font("微软雅黑",Font.BOLD,20));
            g.drawString(message01,50 ,target_x);
            //g.drawString(message01,530 ,190);
            //g.drawString(message02,530 ,220);
            //g.drawString(message02,530 ,target_x-150-30);

            //在背景图片上添加二维码图片
           // g.drawImage(qrCode, 700, 240, qrCode.getWidth(), qrCode.getHeight(), null);

            g.drawImage(qrCode, target_x, target_y-100, qrCode.getWidth(), qrCode.getHeight(), null);
            g.dispose();

            //输出图片
            ImageIO.write(background, "jpg", new File(outPutPath));
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /**
     *  二维码所处的位置
     * @param backgroundPath 背景图
     * @param qrCodePath 二维码
     * @param message01 文字1
     * @param message02 文字2
     * @param outPutPath 输出图片路径
     * @return
     */
    public static String overlapImage(String backgroundPath,String qrCodePath,String message01,String message02,String outPutPath){
        try {
            //设置图片大小
            BufferedImage background = resizeImage(1000,618, ImageIO.read(new File(backgroundPath)));
            BufferedImage qrCode = resizeImage(150,150,ImageIO.read(new File(qrCodePath)));

            //在背景图片中添加入需要写入的信息，例如：扫描下方二维码，欢迎大家添加我的淘宝返利机器人，居家必备，省钱购物专属小秘书！
            Graphics2D g = background.createGraphics();
            g.setColor(Color.white);
            g.setFont(new Font("微软雅黑",Font.BOLD,20));

            g.drawString(message01,530 ,190);
            g.drawString(message02,530 ,220);

            //在背景图片上添加二维码图片
             g.drawImage(qrCode, 700, 240, qrCode.getWidth(), qrCode.getHeight(), null);

            g.dispose();

            //输出图片
            ImageIO.write(background, "jpg", new File(outPutPath));
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 设置图片大小
     * @param x
     * @param y
     * @param bfi
     * @return
     */
    public static BufferedImage resizeImage(int x, int y, BufferedImage bfi){
        BufferedImage bufferedImage = new BufferedImage(x, y, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(
                bfi.getScaledInstance(x, y, Image.SCALE_SMOOTH), 0, 0, null);
        return bufferedImage;
    }

    /**
     * 获取图片宽度
     * @param imgPath
     * @return
     */
    public static Integer getImgWidth(String imgPath){
        // 文件对象
        File file = new File(imgPath);
        // 文件大小；其中file.length()获取的是字节，除以1024可以得到以kb为单位的文件大小
        long size = file.length() / 1024;
        // 图片对象
        BufferedImage bufferedImage = null;
        try {
            bufferedImage = ImageIO.read(new FileInputStream(file));
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 宽度
        int width = bufferedImage.getWidth();

        return width;
    }

    /**
     * 获取图片高度
     * @param imgPath
     * @return
     */
    public static Integer getImgHeight(String imgPath){
        // 文件对象
        File file = new File(imgPath);
        // 文件大小；其中file.length()获取的是字节，除以1024可以得到以kb为单位的文件大小
        long size = file.length() / 1024;
        // 图片对象
        BufferedImage bufferedImage = null;
        try {
            bufferedImage = ImageIO.read(new FileInputStream(file));
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 高度
        int height = bufferedImage.getHeight();

        return height;
    }
}