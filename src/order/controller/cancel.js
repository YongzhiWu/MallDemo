'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    let orderid = this.get('orderid');
    let userinfo = await this.session('userinfo');
    let cancelProduct = await this.model('userorder_productinfo').where({orderid: orderid}).delete();
    let cancelData = await this.model('userorder').where({OrderId: orderid}).delete();
    return this.redirect('/user/order/index');
  }
}