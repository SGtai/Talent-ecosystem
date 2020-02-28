package com.alipay.config;
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
	public static String app_id = "2016101800717119";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCjxFw/MhnBUZB0o424mfyGNVioCbiuxHN1s2wjZ6wmxpwCqGWK4l+U8GUqPxmwMNbliH/ziFRImWzneFG8s4LWa+ZLy4lszkz5QnddgsOCah/EGX87nEMoj/EOe/RnFItXearAdAmNgXoh5b+1tqpOg4i070QEyDXxkFn6lNAehNu4V+CxVIsraiqweEPtfvSxfhlGDRpEAy3pEpdSlAwqiea5231UlaNXUmgTUUFVvxd2DAh6yrhm0dCt1o+NzeGCzm1p+tgYSnFVb1/XzX1QnEPC0t3Ait839i2eAVQVXyWVmIj4XzbFzSsVzXQwVeBz5b8ougb21DxrGIrRtWgZAgMBAAECggEAWRJKzgB066VuOVJfmaD/LQvEzZiD/2JQHhtZXKRdiLWLUxK+L9zR+dMKYwDw+tiFeVBVr2Jd3SK9jePuKQFFz1PebSkl9Kz8RrI09AJUThFkd6cagZSLHnuzs5oNoycUZp6BFa3HKFTc1aT9MVtJo+x8pVRhnWw7kshdeCIKVB41vtMAhX6KhZTWkUuO1+pY0wENmt56BRksoupnLQ0ZInxh1OPNqGG1AYTyEWlUQTBdEKd35Am/fYUp++B5tOEUx/AYYe8/8jpvNGSIYJcohu7hnJNZ48A0xWFZO8AIhmWiD90nJh2n0TKunc8rGhGZcWFXSCZnpb3srBXWZEaUlQKBgQDYy5EH8pw8Zvwx5IcdOdWdW1ULlaLUg/jBAnsnBVt+6dIF6DgbyJJfrqD1wQJMl7kqcNMWTkGZzm8nJwDCOOydc22RE/8WTQQU0k9BvQ2CUPFe/200u+HusCMe4+DLbsg/AfLJbkpFsmmic6bmCS5S2mPBUqsLDRtuzfkIy+TROwKBgQDBYeFGEJfyHpbHThPleNq9iG9NgiJYoJjJnm1dwwYw0wZf27A36XRKb+Q/Ue6etp8OpWWzK6BI3b5qO2Zn9pUrJVPF3Qcn1N3/YqS5+RzzIkKOyPpNJWxXg+jQewR8gptZpjfoWjVchpOEfjpmTHd/rIxzbCRCJOAXsgElfWiWuwKBgQDKbpK3FCA0+ojk4ZoUfSts6ppn3cqUm8JMH0/1aLg9soFtCKBTuR6Mf5hGwXmvIUFCUuWX/2yb/LmnmnDH6rVudBjMDhrzrOhxtMtS+//APmqTpPhI9GMMKKYyst/1tTUAOIaG9hgeKnEewtUGGW6K6Oea3eFeyVdjSKsQPqsjfwKBgQCkUtEDIYyL//Qtran4f0aYcXvqx975opXSFV5noxX6nQa4o8xM5oKb0hKIv81dbl8gKemOY07TPCHW0VzGkODWheR2qMew0BBIOAEzynwQGhemjx8qONekUgGeTjpUtwLdHgI53ZWkZvKpTj2/udB9XBkI52a0EfOeDvMscTFTiwKBgBIZcqjo0IlAcSuIW4ko49QVK4MdJXSnGrzV0ajAZQGgLGgCurf/Qfu6g+iOibV9+/dZoHTFxSmYw+m/wN7LPqmVbDOogsQDrHKXKkN0b8AKAJHs9iXpQk5mKma++TnG/d2gLHq/0muIH9BPCbdR3UoxeD4n4nXBjnW/mWR6RsZB";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo8RcPzIZwVGQdKONuJn8hjVYqAm4rsRzdbNsI2esJsacAqhliuJflPBlKj8ZsDDW5Yh/84hUSJls53hRvLOC1mvmS8uJbM5M+UJ3XYLDgmofxBl/O5xDKI/xDnv0ZxSLV3mqwHQJjYF6IeW/tbaqToOItO9EBMg18ZBZ+pTQHoTbuFfgsVSLK2oqsHhD7X70sX4ZRg0aRAMt6RKXUpQMKonmudt9VJWjV1JoE1FBVb8XdgwIesq4ZtHQrdaPjc3hgs5tafrYGEpxVW9f1819UJxDwtLdwIrfN/YtngFUFV8llZiI+F82xc0rFc10MFXgc+W/KLoG9tQ8axiK0bVoGQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp
	public static String notify_url = "http://localhost:8080/paymentUrlS";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp
	public static String return_url = "http://localhost:8080/paymentUrl";

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

