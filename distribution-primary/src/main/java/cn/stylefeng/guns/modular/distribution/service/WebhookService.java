package cn.stylefeng.guns.modular.distribution.service;

/**
 * WebHook服务
 *
 * @author Fu Fei
 * @date 2020/10/11
 */
public interface WebhookService {

    /**
     * 获得webhook
     */
    String getWebhook();


    /**
     * 发送消息
     */
    void sendMessage(String content);


}
