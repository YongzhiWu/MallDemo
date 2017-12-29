'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  //更新购物车中的商品数量
  async indexAction(){
    let count = this.post('count');
    let productid = this.post('productid');
    let userinfo = await this.session('userinfo');
    let updateData = await this.model('shopcart_productinfo').where({shopcartid: userinfo.shopcartid, productid: productid}).update({
      count: count
    });
    return this.success();
  }
  
  //删除购物车中的商品
  async deleteAction(){
    let productid = this.get('productid');
    let userinfo = await this.session('userinfo');
    let updateData = await this.model('shopcart_productinfo').where({shopcartid: userinfo.shopcartid, productid: productid}).delete();
    return this.redirect('/cart');
  }
}