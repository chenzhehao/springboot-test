# 启用官方的 Maven 镜像作为构建步骤的基础镜像
FROM maven:latest AS build

# 设置工作目录
WORKDIR /opt/chenzhehao/code/test

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . .

# 使用 Maven 进行项目构建
RUN mvn package

# 启用最小化的 JDK 运行时环境镜像
FROM openjdk:8

ARG JAR_FILE=/opt/chenzhehao/code/test/target/*.jar

# 设置工作目录
WORKDIR /opt/chenzhehao/code/test

# 从构建阶段复制生成的 JAR 文件到该阶段的工作目录
COPY --from=build ${JAR_FILE} /opt/chenzhehao/code/test/spring-test.jar

# 运行应用程序
ENTRYPOINT ["java","-jar","spring-test.jar"]