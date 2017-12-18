'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    //查询用户地址、订单中的商品详情

    //将数据传给前端
    return this.display();
  }
}