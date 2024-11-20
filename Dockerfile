FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3
FROM openjdk:8
MAINTAINER chenzhehao

# 声明容器内主进程所对应的端口
EXPOSE 19007
ADD springboot-test-0.0.1-SNAPSHOT.jar /springboot-test-0.0.1-SNAPSHOT.jar

# 相当于windows中的cd命令
WORKDIR /
ENTRYPOINT ["java" , "-jar" , "springboot-test-0.0.1-SNAPSHOT.jar"]