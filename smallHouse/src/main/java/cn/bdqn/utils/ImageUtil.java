package cn.bdqn.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class ImageUtil {

    /**
     上传图片 ，将图片上传到 uploadImage/log/stuId/文件加下
     * @Title: uploadImage
     * @Description: 上传图片 ，将图片上传到 uploadImage/log/stuId/文件加下
     * @param image 要上传的图片
     * @param basePath 基础路径
     * @param stuId 上传者的学号
     * @param logId 当前日志编号
     * @param: request
     * @return String (图片要上传的位置)
     * @throws
     */
    public static String uploadImage(MultipartFile image, String basePath, String stuId, Integer logId) throws Exception {
        String ret = "";

        //生成uuid作为文件名称
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //获得文件类型，如果不是图片，禁止上传
        String contentType = image.getContentType();
        //获得文件的后缀名
        String suffixName = contentType.substring(contentType.indexOf("/") + 1);
        //得到文件名
        String imageName = uuid + "." + suffixName;
        //获取文件夹路径
        String direPath = basePath + "uploadImage\\log\\" + stuId + "\\" + logId.toString();
        File direFile = new File(direPath);
        //文件夹如果不存在，新建文件夹
        if (direFile.exists() == false || direFile.isDirectory() == false) {
            direFile.mkdir();
        }
        //得到文件路径
        String path = direPath + "\\" + imageName;

        image.transferTo(new File(path));

        ret = "/Test/uploadImage/log/" + stuId + "/" + logId.toString() + "/" + imageName;

        return ret;
    }

}
