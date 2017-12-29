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
  async indexAction(){
    //auto render template file index_index.html
    if(this.isPost()){
      //查询订单
      let select = this.post('select');
      if(select == 1){
        //按订单号查询
        let orderid = this.post('orderid');
        let orderData = await this.model('userorder').where({OrderId: orderid}).find();
        let receiveAddData = await this.model('receiveadd').where({ReceiveAddId: orderData.ReceiveAddId}).find();
        orderData['ReceiveName'] = receiveAddData.ReceiveName;
        orderData.OrderTime = orderData.OrderTime.Format("yyyy-MM-dd hh:mm:ss");
        this.assign('OrderItems', orderData);
      }
      return this.display();
    }
    let orderData = await this.model('userorder').select();
    for(var index in orderData){
      let receiveAddData = await this.model('receiveadd').where({ReceiveAddId: orderData[index].ReceiveAddId}).find();
      orderData[index]['ReceiveName'] = receiveAddData.ReceiveName;
      orderData[index].OrderTime = orderData[index].OrderTime.Format("yyyy-MM-dd hh:mm:ss")
    }
    this.assign('OrderItems', orderData);
    return this.display();
  }

  async detailAction(){
    let orderid = this.get('orderid');
    let orderData = await this.model('userorder').where({OrderId: orderid}).find();
    let receiveAddData = await this.model('receiveadd').where({ReceiveAddId: orderData.ReceiveAddId}).find();
    orderData['ReceiveAdd'] = receiveAddData;
    orderData.OrderTime = orderData.OrderTime.Format("yyyy-MM-dd hh:mm:ss");
    this.assign('Order', orderData);

    let productData = await this.model('userorder_productinfo').where({OrderId: orderid}).select();
    for(var index in productData){
      let productInfo = await this.model('productinfo').where({ProductId: productData[index].productid}).find();
      productData[index]['ProductInfo'] = productInfo;
    }
    this.assign('Product', productData);
    return this.display();
  }

  async deliverAction(){
    let orderid = this.post('orderid');
    let deliverData = await this.model('userorder').where({OrderId: orderid}).update({
      Ispay: '已发货'
    });
    return this.success();
  }
}