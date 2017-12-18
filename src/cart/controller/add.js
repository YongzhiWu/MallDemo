'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    //实现将该商品加入购物车

    //跳转到购物车页面
    return this.redirect('/cart/index');
  }
}