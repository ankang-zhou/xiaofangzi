package cn.bdqn.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101900725639";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCSoyHPf6dYJrHzaDfI29XumE1xABq/6UuBYmYJzQn9ucBjCy/6P6nzEO//NGhkLUYf/LwsXWpgzQ1Vl27XTOhuKyuykBVMZyrQs2hNBPd1SJFyqeRtvNLHCooSLLq8MZn76r59d69O2buE+yZce5awUO6l4jRFAfzLrsDa2UokMOlQZUak3zpxGuxJjOdVIjC1IIaBHfzQOspflKT4kBQWNl+J0p/sXSxiteZdt2bnR+3awpyhJstvgxe3jPmmt5tlTxmzkESJ/u/RWY4IRAGcZA8pSMFXyrxV1No1h7iYHufxjtViRCZcLliRPYaMkSfBaM4KcPlSyDe2TK7FKVYvAgMBAAECggEAMYdYTDXZ2DR5trVk4jser1BSF/DpGBk8n58UyAqxbTnoeYu10NjgFnGKHrEc8Xk5TmSXSoTjAX9BGb/keGRJvaxnPhDcoMnX9FYkzJ741myEdC5eMZKtvv0YVbs194rpb+WCIe7jD8cLR4dtFZ/I7hToBq+45/Yb5NBJ46GxITe/FbNvgs+iozPPXDST42u48p+qx7FjFx/O1OzEwFERXufB6RNynjh1rtNXvr5Q4Q/jWQ+zOU3GrYgk2xyt50vDcvjq5kdN6w0kQ9SJKaZds9o969shmW2eEwSjnc/y+B7+KdAb5AIqxVb2xMNExwUYDaxHemBYUtSODV9EcSr1AQKBgQDn4jxHt7BxUonD55a7VY18VbTfnb6e6WbBH2WoMrU3Zkv1Mav6yIOXJh5IuePyQiwbncs5rPbsJFEIV2r9reJqcm47HhJZnOjTvjB2QksB05dule5fEzyzr1CKP9n4nuiO4KMH4/WVKT5E+G88hpTIZiUey828W6iIDIIF5OWSfwKBgQCh40KQM5l9UESFu+/hJokuhFQW76EdmFayUhcwzV/K1NFVVTiNENkTQXvgah3YYznucgl4f8lchrLpUARGIFGwo7ljc1OuNNh/++3SrsF+yYpFSAfLOV58G1ZA8XlgB86/Gu7h5HhmXk8jd5Fk09Gjsi6fiDE5OlQiXU8358QEUQKBgQDJ6Vsn77D53C8NoNjFYqeCfnayyH61jPLmctpn7U+SX8cASDJCetrqgEyacxMjXa9elLXjENMpqC3PH5+QKRsgKWgGnhbIZTLvPYqhTvRVMNOJfZBExVFz/NIar6KzNFu4Ha6YLk0nhvQrxk/F2kIvhZIJENmijAViAdIuI7QrLQKBgGcXF55InafFY71eDsXsClPLBNmOQ6VbC2qHCCmVvzilCaEzoc2DOxkeDEq+iL7xgUSs7gcEKTB4vpoA0JfvoNXBjR8do9493Nizj6EolCOvKBQyaHQr1lVl+ylkHIzgq/HaruC+40UdLXxCeh4hHVEG+NWyntX4pPc1QGszdgnhAoGARWLdJnf7SUyhFe2yf9JHRuRODqzpYiQWOH4n+7tTV53r+DSVRETEO8gi77UMn0v8tSgY0mnlFMqNZRVA7iGz+AudQe/GuUriPjbL94opxkc3bZ2hXEmm+f2MW7IIDftl3636rdwoG/k/7w73mYxtIJYY/JX5AdgJJ3lU1VpAU/0=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgyAyfv4zAhNEecM11X6G4VRqoEE7+51YGK+KIAvflXUFU3Uu6Y50xLsCGMgnh9xnCUboFGYRULGJexPTWXqxlgFBmTMmuFRIJhMlCKWnzEYZq5g9MgZTHuzQ5t8KHjNhDLT8EZKHPxOZTB9MnpiEVIEr/nsGg9zMw9Y+PMjYiraZbh1Z0slT5WmGY/003YP6BECoXHziZvOkaxLOT6yuAoRVj7b693pK2n9so1OAOOAzYGtsZZ+YiU0Qpxf5wELLU83TuthV6QZJpIywcogal9cG6DQQmE7jJiaZcBto1RKbTRAcwegRFUnMEimqI/2bFtves8jkR9gkwiSA2AC4sQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

