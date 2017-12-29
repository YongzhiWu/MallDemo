'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    //查询用户地址、订单中的商品详情
    let productid = this.get();
    let userinfo = await this.session('userinfo');
    console.log(productid);
    var confirmProductData = [];
    var total = 0;
    for(var index in productid){
      let data = await this.model('shopcart_productinfo').where({shopcartid: userinfo.shopcartid, productid: productid[index]}).find();
      let productData = await this.model('productinfo').where({ProductId: data.productid}).find();
      productData['count'] = data.count;
      total = total + data.count * productData.ProductPrice;
      confirmProductData.push(productData);
    }

    let addressData = await this.model('receiveadd').where({UserId: userinfo.UserId}).select();

    //将数据传给前端
    this.assign('AddressItems', addressData);
    this.assign('total', total);
    this.assign('ProductItems', confirmProductData);
    this.assign('CrumbTitle', '订单确认');
    return this.display();
  }
  
  //更新地址
  async updateAddressAction(){
    let param = this.post();
    let userinfo = await this.session('userinfo');
    let updateData = await this.model('receiveadd').where({ReceiveAddId: param.id, UserId: userinfo.UserId}).update({
      ReceiveName: param.name,
      ReceiveAdd: param.address,
      ReceiveTel: param.phone,
      ReceiveProvince: param.province,
      ReceiveCity: param.city,
      ReceivePost: param.postcode
    });
    return this.success();
  }

  //新建地址
  async addAddressAction(){
    let param = this.post();
    let userinfo = await this.session('userinfo');
    var d = new Date();
    let addressid = d.getTime().toString();
    let addData = await this.model('receiveadd').add({
      ReceiveAddId: addressid,
      UserId: userinfo.UserId,
      ReceiveName: param.name,
      ReceiveAdd: param.address,
      ReceiveTel: param.phone,
      ReceiveProvince: param.province,
      ReceiveCity: param.city,
      ReceivePost: param.postcode
    });
    return this.success(addressid);
  }

  async deleteAddressAction(){
    let addressid = this.post('id');
    let userinfo = await this.session('userinfo');
    let deleteData = await this.model('receiveadd').where({ReceiveAddId: addressid, UserId: userinfo.UserId}).delete();
    return this.success();
  }
}