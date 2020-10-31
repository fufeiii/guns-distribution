FROM openjdk:8-jdk-alpine
MAINTAINER FuFei
WORKDIR /runtime
COPY guns-distribution-starter.jar app.jar
ENV ACTIVE=prod
ENV TZ=Asia/Shanghai
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache tini tzdata
RUN apk add --no-cache openssl wget
RUN apk add ca-certificates
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENTRYPOINT ["tini","--","java","-Djava.security.egd=file:/dev/./urandom","-jar","/runtime/app.jar","--spring.profiles.active=${ACTIVE}"]