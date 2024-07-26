# 使用 ARM64 架构的 Ubuntu 镜像
FROM arm64v8/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 安装所需工具
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget

# 设置工作目录
WORKDIR /workspace

# 克隆 piper-phonemize 仓库
RUN git clone https://github.com/zhangYanGitHub/piper-phonemize.git /workspace
# 进入项目目录
WORKDIR /workspace

# 创建构建目录
RUN mkdir build && cd build && \
    cmake .. && \
    make

# 可选：如果你需要安装到系统路径
# RUN make install
