'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    //从数据库里获取用户购物车数据

    //通过变量赋值将数据传给前端
    return this.display();
  }
}