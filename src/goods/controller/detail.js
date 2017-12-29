'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    //根据商品id查询商品详情
    let productid = this.get('productid');
    if(!think.isEmpty(productid)){
      let productData = await this.model('productinfo').where({ProductId: productid}).find();
      this.assign('ProductInfo', productData);
    }
    //将数据传递给前端
    this.assign('CrumbTitle', '商品详情')
    return this.display();
  }
}