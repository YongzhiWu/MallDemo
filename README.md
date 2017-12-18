# HUSTMall
HUSTMall是一个用ThinkJS 2.2（一个基于Node.js的优秀国产框架）做的电子商务网站，参考[官方文档](https://thinkjs.org/zh-cn/doc/2.2/index.html)

## 使用前
由于相关依赖包都是通过npm添加，需要先安装[Node.js](https://nodejs.org/zh-cn/)

## 说明
视图文件（在view目录中）默认的命名规则为 模块/控制器_操作.html。

假如 URL home/article/detail 解析后的模块是 home，控制器是 article，操作是 detail，那么对应的视图文件为 home/article_detail.html。

## Install dependencies

```
npm install
```

## Start server

```
npm start
```

## Deploy with pm2

Use pm2 to deploy app on production enviroment.

```
pm2 startOrReload pm2.json
```