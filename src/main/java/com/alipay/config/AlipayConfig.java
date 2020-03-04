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
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCHDacXodK5Z3SaqimTt6Hy68/w4ls8qJ9kORNxnMTA1VMbwUiRU+cyMx0JTc3zZjs2Qdx46dq8NWhk3f+4ci3Fuvty6NL7ui83VD4m4POQgzPDLnQwfxtC0mfHYVLIBY7AjEO5jh9qUXgCC77jW1/SuU8DWKDYzU9A3X5iPT13YsqOrFkKRe1S3xVB6kem3+ICyfGJkl+3UBfyKtrsp+5ubcCfLOvEcv3+cEldyc3lt44KzduyQBVDAyYFxVU6AwzN5Gehiof8trbg4i8oURQxdzewTBEi6Qc90MTIs4SQqbBt/Nn8KZ55O21+ZEeq5XOuPUDhd7zRK6W9irrVsdJNAgMBAAECggEAEqQpyjNF+N101Nxj/MW+Dt/JxgAYg9jql1ThgC8ZYVyQqiYVtCmWofE4Ms6QfOZBig2xNudgj9X3YOTbpUPtWXujtYq5hJGAbuyr34XxWKMjg+9njkIdKy4LsROX75AE0kMKHhSl9XDlVbL1WECGi3mUlGupWAOOyu9HwJufXlkLMrxYL6Wq0DXhtlFHghDKSXX62aRVgditzejvYijTC4HuLRsQ6VOGyCGaiYPsEQt2An24u/W/iY103bxKMVRJe71dCTPZIDCB8Pb9752c8WilwS9Kr5VSWdHsmibo0VDVyjcIGg3rQax9KLw2GCK7/ICgsd5sCDqZLqXkcDktQQKBgQC8TmAXxiU+XG+R/ca1ETUTRp8lvbin41ahKcDhX1x3OoPyctTrlu2eJ/RP2vNxkntxX06JMlG9NjiO/U0Y53rTly9eTyniKiJ4rNzeTIs3H9CYC+UDW2EXhXYOl/U3RWW9tU+L4UO8zX0xDGh8zGAsj2MR/+HP/TumL30uJ8zBVQKBgQC3mnlWt7VNDH1hwOm7lM9N6EAuksO5k9eDnUOeyrMQv4RUy1p9l2gNfr511ChxIF151Y73Nq1wPN92n9dEtbzWj1F0rNrzP/CcHeumlvXmmvkc5uCiKKfcRi9mqnJC35Dy6wcBqjUj9eVSp3zt5QGRLKUsCYNrerf7N9JCTdstGQKBgQCoCzVb4frYlPsICLXsXifERPC/aHjCcnGbrzwuo8BLsk+P7IQwneb9jeBL5zP7NWKuAQSAEQS62wlMKaZExEZrTu75taHF8B4FHRaZ1yshjWXEWlEMVt7lc7ewPFGb+nVZ/9S2GtgtRCAlxlH0lRp6iZc6t+RXjUBPBPAsYV4rZQKBgQCqiYAVDRQImgZH6xDvHBylx4j9+XJ1CB6Q8F0jvDEw6EL5I91MdHrAti4gccySrzZD+RoPA6l7a/9ARt2Dw67AOGS3k+rXMFfEGoKMvQFwjhe/Qa/6zvqDvmk+2ijBdrlC+Q0L/dXYLgkwicOfkCuxdZ+B1OBNz7HeVQ4mafyf2QKBgC/zmFdZrpRvwONP18BUm/Mu5VwljQG7MP+pGZmzaHm2r5rrXZ07luU1WavuccywGGqr5keszSZyc+k+laXu2N9RrtGFqxr7WlsQaPVLZuDxBXdn8hC+8TU3AWOqttVl7fR+naCVpklTo6Vl15l2vBpQmIHsqh2oxQl1T2p3ZUDV";
	
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

