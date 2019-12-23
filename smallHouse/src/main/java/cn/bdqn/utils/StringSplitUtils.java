package cn.bdqn.utils;

public class StringSplitUtils {

    /**
     * 对字符串进行分割    str是字符串   separator是分隔符
     */
    public static String[] splitString(String str,String separator){
        String [] strs = str.split(separator);
        for (int i = 0; i < strs.length; i++) {
            strs[i] = strs[i].trim();
        }
        return strs;
    }

    /**
     * 将字符串数组转换称字符串
     */
    public static String splitString(String[] str){
        StringBuilder sb =  new StringBuilder();
        for (int i = 0; i < str.length; i++) {
            sb.append(str[i]+",");
        }
        return sb.toString();
    }

}
