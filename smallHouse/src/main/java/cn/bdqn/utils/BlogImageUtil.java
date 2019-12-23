package cn.bdqn.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

public class BlogImageUtil {

    public static String uploadImage(MultipartFile photo, String basePath) throws Exception {
        String ret = "";

        //生成uuid作为文件名称
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //获得文件类型，如果不是图片，禁止上传
        String contentType = photo.getContentType();
        //获得文件的后缀名
        String suffixName = contentType.substring(contentType.indexOf("/") + 1);
        //得到文件名
        String imageName = uuid + "." + suffixName;
        //获取文件夹路径
        String direPath = basePath + "uploadImage\\blogTitle\\";
        File direFile = new File(direPath);
        //文件夹如果不存在，新建文件夹
        if (direFile.exists() == false || direFile.isDirectory() == false) {
            //此处的坑。谨记！ 之前是direFile.mkdir();这个方法只能生成一层文件夹
            //direFile.mkdirs()此方法可以递归的生成文件夹。即多层文件夹。
            direFile.mkdirs();
        }
        //得到文件路径
        String path = direPath + "\\" + imageName;

        photo.transferTo(new File(path));

        ret = "uploadImage/blogTitle/"  + imageName;

        return ret;
    }
}
