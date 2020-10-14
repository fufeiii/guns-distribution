package cn.stylefeng.guns.modular.distribution.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.stylefeng.guns.modular.distribution.service.WebhookService;
import cn.stylefeng.guns.modular.distribution.util.TenantHelper;
import cn.stylefeng.roses.core.util.ToolUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

/**
 * 钉钉WebHook 默认安全设置为自定义关键词
 *
 * @author Fu Fei
 * @date 2020/10/11
 */
@Component
@Slf4j
public class DingDingWebhookServiceImpl implements WebhookService {

    private final String keyword = "【业务异常】";

    @Autowired
    private RestTemplate restTemplate;


    @Override
    public String getWebhook() {
        return TenantHelper.getTenantWebhook();
    }

    @Override
    public void sendMessage(String content) {
        try {
            String webhook = this.getWebhook();
            // 没设置webhook就不发了
            if (ToolUtil.isEmpty(webhook)) {
                return;
            }
            String postForObject = restTemplate.postForObject(webhook, this.buildMessage(content), String.class);
            log.debug("发送WebHook的响应为：" + postForObject);
        } catch (Exception e) {
            log.debug("webhook send fail...");
        }
    }

    /**
     * 构建发送的消息
     */
    Map<String, Object> buildMessage(String content) {
        // 发送类型为text类型
        Map<String, Object> data = CollUtil.newHashMap();
        data.put("msgtype", "text");
        Map<String, Object> text = CollUtil.newHashMap();
        text.put("content", keyword +"请尽快处理 ===> \n" + content);
        data.put("text", text);
        return data;
    }


}
