# 使用官方的 Node.js 镜像作为基础镜像
FROM node:16

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 以安装依赖
COPY package.json ./
COPY package-lock.json ./

# 安装依赖
RUN npm install

# 复制项目的所有文件到容器
COPY . .

# 构建 React 应用
RUN npm run build