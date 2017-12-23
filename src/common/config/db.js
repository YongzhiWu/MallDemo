'use strict';
/**
 * db config
 * @type {Object}
 */
export default {
  type: 'mysql',
  adapter: {
    mysql: {
      host: '127.0.0.1',  //localhost
      port: '3306',   //服务器占用本地端口
      database: 'malldemo',  //数据库名称
      user: 'root',          //数据库用户名
      password: '123456',    //数据库密码
      prefix: '',
      encoding: 'utf8'
    },
    mongo: {

    }
  }
};