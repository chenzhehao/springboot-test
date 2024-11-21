# 启用官方的 Maven 镜像作为构建步骤的基础镜像
#FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3:latest

#FROM maven:3.8.4-openjdk-17
FROM crpi-3myp87oa7kp7kll9.cn-shanghai.personal.cr.aliyuncs.com/chenzhehao-test/test:3.8.4-openjdk-17 as build
MAINTAINER chenzhehao

# 设置工作目录
RUN mkdir /springboot-test
WORKDIR /springboot-test

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . .

# 使用 Maven 进行项目构建
RUN mvn package


# 启用最小化的 JDK 运行时环境镜像
#FROM openjdk:8
FROM crpi-3myp87oa7kp7kll9.cn-shanghai.personal.cr.aliyuncs.com/chenzhehao-test/test:openjdk-8

# 设置工作目录
RUN mkdir /springboot-test
WORKDIR /springboot-test

ARG JAR_FILE=/springboot-test/target/*.jar

# 从构建阶段复制生成的 JAR 文件到该阶段的工作目录
COPY --from=build ${JAR_FILE} ./app.jar

# 运行应用程序
ENTRYPOINT ["java","-jar","app.jar"]