# 使用官方的 Node.js 镜像作为基础镜像
FROM node:16

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 以安装依赖
COPY package.json ./
COPY package-lock.json ./

# 安装依赖
RUN npm config set registry https://registry.npmmirror.com&&npm install --no-proxy

# 复制项目的所有文件到容器
COPY . .

# 构建 React 应用
RUN npm run build

FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf
# 暴露端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]