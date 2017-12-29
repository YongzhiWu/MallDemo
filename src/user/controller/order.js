'use strict';

import Base from '../../cart/controller/base.js';

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
    let userinfo = await this.session('userinfo');
    let orderData = await this.model('userorder').where({
      UserId: userinfo.UserId
    }).select();
    for (var index in orderData) {
      //获取收货人信息
      let addressData = await this.model('receiveadd').where({ReceiveAddId: orderData[index].ReceiveAddId, UserId: userinfo.UserId}).find();
      orderData[index]['AddressData'] = addressData;
      //获取订单商品信息
      let productData = await this.model('userorder_productinfo').where({
        orderid: orderData[index].OrderId
      }).select();
      for (var item in productData) {
        let productInfo = await this.model('productinfo').where({
          ProductId: productData[item].productid
        }).find();
        productData[item]['ProductName'] = productInfo.ProductName;
        productData[item]['ProductPrice'] = parseInt(productInfo.ProductPrice);
        productData[item]['ProductOutline'] = productInfo.ProductOutline;
        productData[item]['ProductStorage'] = productInfo.ProductStorage;
        productData[item]['ProductPic'] = productInfo.ProductPic;
      }
      orderData[index].OrderTime = orderData[index].OrderTime.Format("yyyy-MM-dd hh:mm:ss")
      orderData[index]['ProductData'] = productData;
    }
    this.assign('OrderItems', orderData);
    this.assign('CrumbTitle', '我的订单');
    return this.display();
  }

  async detailAction() {
    let orderid = this.get('orderid');
    let userinfo = await this.session('userinfo');
    let orderData = await this.model('userorder').where({
      UserId: userinfo.UserId,
      OrderId: orderid
    }).find();
    //获取收货人信息
    let addressData = await this.model('receiveadd').where({ReceiveAddId: orderData.ReceiveAddId, UserId: userinfo.UserId}).find();
    orderData['AddressData'] = addressData;
    //获取订单商品信息
    let productData = await this.model('userorder_productinfo').where({
      orderid: orderid
    }).select();
    for (var item in productData) {
      let productInfo = await this.model('productinfo').where({
        ProductId: productData[item].productid
      }).find();
      productData[item]['ProductName'] = productInfo.ProductName;
      productData[item]['ProductPrice'] = parseInt(productInfo.ProductPrice);
      productData[item]['ProductOutline'] = productInfo.ProductOutline;
      productData[item]['ProductStorage'] = productInfo.ProductStorage;
      productData[item]['ProductPic'] = productInfo.ProductPic;
    }
    orderData.OrderTime = orderData.OrderTime.Format("yyyy-MM-dd hh:mm:ss")
    orderData['ProductData'] = productData;
    this.assign('Order', orderData);
    this.assign('CrumbTitle', '订单详情');
    return this.display();
  }
}