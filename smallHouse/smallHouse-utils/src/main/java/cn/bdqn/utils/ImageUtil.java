package cn.bdqn.utils;



import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class ImageUtil {

    /**
     上传图片 ，将图片上传到 uploadImage/log/userId/文件加下
     * @Title: uploadImage
     * @Description: 上传图片 ，将图片上传到 uploadImage/log/userId/文件加下
     * @param image 要上传的图片
     * @param basePath 基础路径
     * @param userId 上传者的用户ID
     * @param articleId 当前文章编号
     * @return String (图片要上传的位置)
     * @throws
     */
    /*图片上传路径 为 uploadImage/log/userId/articleId/imageName*/
    public static String uploadImage(MultipartFile image, String basePath, Integer userId, Integer articleId) throws Exception {
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
        String direPath = basePath + "uploadImage\\log\\" + userId.toString() + "\\" + articleId.toString();
        File direFile = new File(direPath);
        //文件夹如果不存在，新建文件夹
        if (direFile.exists() == false || direFile.isDirectory() == false) {
            //此处的坑。谨记！ 之前是direFile.mkdir();这个方法只能生成一层文件夹
            //direFile.mkdirs()此方法可以递归的生成文件夹。即多层文件夹。
            direFile.mkdirs();
        }
        //得到文件路径
        String path = direPath + "\\" + imageName;

        image.transferTo(new File(path));

        ret = "/smallHouse/uploadImage/log/" + userId.toString() + "/" + articleId.toString() + "/" + imageName;

        return ret;
    }

}
