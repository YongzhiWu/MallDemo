'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    //从数据库获取满足关键词的商品数据

    //通过给变量赋值将数据传给前端
    return this.display();
  }
}