'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    //根据商品id查询商品详情

    //将数据传递给前端
    return this.display();
  }
}