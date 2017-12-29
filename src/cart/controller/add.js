'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    //实现将该商品加入购物车
    let productid = this.get('productid');
    let count = this.get('count');
    let userinfo = await this.session('userinfo');
    console.log(userinfo);
    let shopcartData = await this.model('shopcart').where({UserId: userinfo.UserId}).find();
    let data = await this.model('shopcart_productinfo').where({shopcartid: shopcartData.ShopCartId, productid: productid}).find();
    if(think.isEmpty(data)){
      //购物车中不存在该商品
      let addproductData = await this.model('shopcart_productinfo').add({
        shopcartid: shopcartData.ShopCartId,
        productid: productid,
        count: count
      });
    } else{
      //购物车中已经存在该商品
      let newcount = parseInt(count) + data.count;
      let addproductData = await this.model('shopcart_productinfo').where({shopcartid: shopcartData.ShopCartId, productid: productid}).update({count: newcount});
    }
    
    
    //跳转到购物车页面
    return this.redirect('/cart/index');
  }
}