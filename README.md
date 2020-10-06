# Duns-Distribution

[TOC]
## 前言
- 整个项目基于 [Guns后台管理框架v6.1](https://gitee.com/stylefeng/guns)，简单易用学习成本低。
- 部分思想参考 [分销管理系统(EDEN-MACE)](https://gitee.com/codingdb/distribution_management) ，并重新设计了各个模块。

**建议先看看上述两个项目，了解一些基本的概念，并且我想介绍一些内容，他们已经介绍了哦~**

产品前期推广必备**分销模块**，利用熟人社交，人脉等方式进行产品推广、商品销售等，利用这种裂变方式，可以达到精准投放的效果，使产品能够得到良好的收益和推广，同时也为产品积累用户和活跃度，帮助产品度过最为艰难的初期，最终实现盈利。

不想重复造轮子但是没办法还是自己写了，作者曾使用过大部分分销开源项目作为分销解决方案，但都存在代码复杂晦涩难懂，且存在一些安全和其他漏洞问题，或是系统版本太老不便于与新项目集成，亦或是不利于拓展或者修改新的业务逻辑等，让我们感到十分困扰。因此，决定重新设计一个能解决了上述问题的基于分销层级的分销框架，理论上实现了分销项目的所应具备的基本功能，同时代码逻辑简单，注释充足，也便于改造或者实现自己想要的分销策略。

最终，希望它能够帮助到您。




## 开源地址

https://gitee.com/fufeii/guns-distribution



## 版权声明

LGPL-3.0开源协议



## 快速开始

> 第零步：准备环境

- 选择一：通过IDEA运行程序

  1. 在数据库中执行./sql/guns_distribution.sql的脚本文件
  2. 修改application-local.yml配置文件中mysql、redis的配置

- 选择二：通过容器化运行程序

  请查看【快速部署】模块

> 第一步：创建租户

使用guns默认账户 admin/111111 登录本系统 http://localhost:8080/
在 用户管理  => 平台管理 创建一个平台(租户)，初始化了相关角色、职位、密码（111111）

![getstart-tenant-add.png](https://i.loli.net/2020/10/05/dmTWPQFtpL7unzC.png)


> 第二步：登录租户端并设置分销参数

在 分销参数 => 分润参数 创建分润参数
在 分销参数 => 段位参数 创建段位参数
注：此模块定义可根据需要设置不同的参数。以下示例参数不考虑用户类型和用户段位

![getstart-profitparam-add.png](https://i.loli.net/2020/10/05/j2VuFhWwbAvYf1n.png)

![getstart-rankparam-add.png](https://i.loli.net/2020/10/05/uOsNtblqXCApjH5.png)

> 第三步：模拟接口调用

在 开发管理 => 模拟操作 模拟其他外部模块调用

在 开发管理 => 接口文档 查看参数或者调试接口

![getstart-mock-index.png](https://i.loli.net/2020/10/05/SyvDjuAoiJXcbax.png)

![getstart-api-index.png](https://i.loli.net/2020/10/05/oVQkNy9Sd7WlGrt.png)


## 项目介绍

### 项目特点

1. 依托Guns开源版，基于Springboot2.1.6能够快速上手
2. 分润参数配置化，简单操作即可完成分润参数的构建
3. 开箱即用，内置三种分润策略
4. 易于扩展，能够快速实现自己的分润策略
5. 乐观锁保护，通过aop实现重试机制
6. 参数校验分离，基于javax.validation注解和自定义aop，将参数校验从代码中脱离
7. 多线程加持，通过并行解决串行化造成的耗时问题，提升接口相应速度

**模块分包**

```
└─distribution   // 分销模块
    ├─aop             // aop模块
    │  ├─retry            // 重试机制
    │  └─vaildate         // 验证机制
    ├─api             // api模块
    │  ├─controller       // 控制器
    │  ├─request          // api请求模型
    │  └─response         // api相应模型 
    ├─controller       // 管理后台控制器模块
    ├─entity           // 实体类包
    ├─enums            // 枚举模块
    │  └─biz               // 业务相关枚举包
    ├─event            // 事件模块
    ├─exception        // 异常模块
    │  └─handler           // 异常处理器
    ├─listener         // 监听器模块
    ├─mapper           // dao模块
    │  └─mapping           // xml文件
    ├─model            // 模型模块
    │  ├─dto               // 管理端前台请求实体
    │  └─vo			       // 前端模型
    ├─profit           // 分润模块
    │  └─strategy          // 分润策略
    ├─service          // 服务层模块
    │  └─impl              // 服务实现类
    ├─socket           // websocket模块
    └─util             // 工具模块
```

**分润模型**

分润相关的UML模型可在IDEA中查看，通过spring的事件发布/订阅模型，将分润业务代码和其他业务逻辑分离。

通过spring的事件发布/订阅模型，将分润业务代码和其他业务逻辑分离。

下面将介绍如何快速拓展符合自己业务的分润策略，以邀请分润为例。

```java
// 1、创建邀请会员事件
public class InviteMemberEvent extends ApplicationEvent {

    private static final long serialVersionUID = -5904603262579267324L;

    /**
     * 发出邀请的人
     */
    private final DistMemberDTO inviter;

    public InviteMemberEvent(Object source, DistMemberDTO inviter) {
        super(source);
        this.inviter = inviter;
    }

    public DistMemberDTO getInviter() {
        return inviter;
    }
}

// 2、在监听器组件类中定义对应的事件监听器
public class ProfitEventListener {

    @Autowired
    private ProfitStrategyContext profitStrategyContext;

    /**
     * 监听InviteMemberEvent事件，触发事件所在事务成功提交后
     * 异步执行，注释@Async注解则为同步执行。
     * 默认邀请会员事件的业务在其所促发的模块事务之外。
     *
     * @param inviteMemberEvent 会员邀请事件
     */
    @Async
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handle(InviteMemberEvent inviteMemberEvent) {
        // 执行邀请分润机制
        profitStrategyContext.getProfitStrategy(ProfitTypeEnum.INVITE).startProfit(inviteMemberEvent.getInviter());
    }
    
}

// 3、实现邀请分润策略的业务逻辑，实现接口
public class InviteProfitStrategy extends AbstractProfit {

    @Override
    protected void setTenantForCurrentThread(ProfitAccess subject) {
        // 此接口如果为异步时需要重写
        TenantHelper.setTenant(((DistMemberDTO) subject).getPlatformUsername());
    }

    @Override
    public void validateBiz(ProfitAccess subject) throws DistributionException {
        // 验证业务合法性
    }

    @Override
    public DistProfitEvent recordEvent(ProfitAccess subject) {
        // 记录分润事件
    }


    @Override
    public void executeProfit(DistProfitEvent event, ProfitAccess subject) {
        // 执行分润
    }

}

// 4、在必要的地方发布邀请会员事件
public class DistMemberServiceImpl extends ServiceImpl<DistMemberMapper, DistMember> implements DistMemberService {

    @Autowired
    private ApplicationEventPublisher applicationEventPublisher;
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(DistMemberDTO param) {
        // 其他会员添加的业务逻辑
        if (isInviteJoin) {
			applicationEventPublisher.publishEvent(new InviteMemberEvent(this, param));        
        }
    }
}

```

### 项目预览

> 主控面板模块

![console-preview-pindex.png](https://i.loli.net/2020/10/05/bJDaGyiW3O81tEN.png)

> 用户管理模块

![user-member-index.png](https://i.loli.net/2020/10/05/uNivTfUGx7daVyP.png)

![user-member-account.png](https://i.loli.net/2020/10/05/6JnQlVizAu7pqoF.png)

![user-member-team.png](https://i.loli.net/2020/10/05/ZuDyiHar7Jlco4B.png)


![user-account-index.png](https://i.loli.net/2020/10/05/kCaFvjBf3iPe2A6.png)

![user-account-changelist.png](https://i.loli.net/2020/10/05/shXJvYxyTZQMrKw.png)


![user-accountrecord-index.png](https://i.loli.net/2020/10/05/bqTzaRNeuVBDQZi.png)


> 分润参数模块

![dist-rank-index.png](https://i.loli.net/2020/10/05/AxUbHqdYoSWzO3N.png)

![dist-profit-index.png](https://i.loli.net/2020/10/05/euvX51ZwpIkh4nL.png)

> 分润中心模块

![profitcenter-event-index.png](https://i.loli.net/2020/10/05/7hpTjsZW6EnBRom.png)

![profitcenter-event-detail.png](https://i.loli.net/2020/10/05/yCWitK85Tvk7dgI.png)

![profitcenter-profitrecord-index.png](https://i.loli.net/2020/10/05/5KVxDX7O9nqWkAY.png)

![profitcenter-withdrawal.png](https://i.loli.net/2020/10/05/aVPCI59kJSvb4MW.png)



## 快速部署

### 使用Dockfile

将项目中的Dockerfile和guns-distribution-starter.jar上传到服务器

```shell
[root@centos7 dockerfile]# ls
Dockerfile  guns-distribution-starter.jar
```

构建镜像并启动容器，注意：默认启动prod配置，所以需要修改prod配置中的redis和mysql配置，启动其他配置请使用--spring.profiles.active=dev进行追加

```shell
[root@centos7 dockerfile]# docker build -t guns-distribution:1.0 ./ && docker run -d -p 8080:8080 -v $(pwd)/logs:/runtime/app_logs --name guns-distribution guns-distribution:1.0
```

访问系统，默认8080端口

### 使用docker-compose

推荐使用此方法，一键启动，不需要自己搭建mysql和redis环境

将项目中的docker-compose.yml和Dockerfile以及guns-distribution-starter.jar和guns_distribution.sql上传到服务器

```shell
[root@centos7 docker-compose]# ls
docker-compose.yml  Dockerfile  guns_distribution.sql  guns-distribution-starter.jar
```

构建镜像并启动整个项目

```shell
[root@centos7 docker-compose]# docker-compose up -d --build
```

访问系统，默认8081端口