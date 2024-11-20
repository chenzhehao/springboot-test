# 启用官方的 Maven 镜像作为构建步骤的基础镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3
FROM maven:3.8.4-openjdk-17

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . .

# 使用 Maven 进行项目构建
RUN mvn package

# 启用最小化的 JDK 运行时环境镜像
FROM openjdk:8

ARG JAR_FILE=/app/target/*.jar

# 设置工作目录
WORKDIR /app

# 从构建阶段复制生成的 JAR 文件到该阶段的工作目录
COPY --from=build ${JAR_FILE} ./app.jar

# 运行应用程序
ENTRYPOINT ["java","-jar","app.jar"]