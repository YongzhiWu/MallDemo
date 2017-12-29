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
    let userinfo = await this.session('userinfo');
    let shopcartData = await this.model('shopcart').where({UserId: userinfo.UserId}).find();
    let cartData = await this.model('shopcart_productinfo').where({shopcartid: shopcartData.ShopCartId}).select();
    var item;
    for(item in cartData){
      let productData = await this.model('productinfo').where({ProductId: cartData[item].productid}).find();
      cartData[item]['ProductName'] = productData.ProductName;
      cartData[item]['ProductPrice'] = productData.ProductPrice;
      cartData[item]['ProductPic'] = productData.ProductPic;
    }
    //通过变量赋值将数据传给前端
    this.assign('CartItems', cartData);
    this.assign('CrumbTitle', '购物车');
    return this.display();
  }
}