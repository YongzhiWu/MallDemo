'use strict';

import Base from './base.js';

Date.prototype.Format = function (fmt) {
  var o = {
    "M+": this.getMonth() + 1, //月份 
    "d+": this.getDate(), //日 
    "h+": this.getHours(), //小时 
    "m+": this.getMinutes(), //分 
    "s+": this.getSeconds(), //秒 
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
    "S": this.getMilliseconds() //毫秒 
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction() {
    let params = this.get();
    let userinfo = await this.session('userinfo');

    //创建订单
    var d = new Date();
    let orderid = d.getTime().toString();
    var ordertime = d.Format("yyyy-MM-dd hh:mm:ss");
    let orderData = await this.model('userorder').add({
      OrderId: orderid,
      ReceiveAddId: params.addressid,
      UserId: userinfo.UserId,
      OrderTime: ordertime,
      Ispay: '未付款',
      PayMethod: '在线支付'
    });

    var total = 0;
    for (var index in params) {
      if (index != 'addressid') {
        let data = await this.model('shopcart_productinfo').where({
          shopcartid: userinfo.shopcartid,
          productid: params[index]
        }).find();
        let productData = await this.model('productinfo').where({
          ProductId: data.productid
        }).find();
        productData['count'] = data.count;
        //创建订单商品信息表
        let orderProductData = await this.model('userorder_productinfo').add({
          orderid: orderid,
          productid: params[index],
          count: data.count
        })
        total = total + data.count * productData.ProductPrice;
      }
    }
    let addTotal = await this.model('userorder').where({
      OrderId: orderid
    }).update({
      OrderTotalPrice: total
    });
    //删除购物车中的商品
    for (var index in params) {
      if (index != 'addressid') {
        console.log('delete');
        let deleteProductData = await this.model('shopcart_productinfo').where({
          shopcartid: userinfo.shopcartid,
          productid: params[index]
        }).delete();
      }
    }
    return this.redirect('/pay/index/index/orderid/' + orderid);
  }
}