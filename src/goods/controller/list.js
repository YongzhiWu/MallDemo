'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    //从数据库获取满足关键词的商品数据
    let keyword = this.get('keyword');
    let producttypeid = this.get('producttypeid');
    if(!think.isEmpty(producttypeid)){
      //通过商品种类id查询
      let productData = await this.model('productinfo').where({ProductTypeId: producttypeid}).select();
      this.assign('ProductItems', productData);
      console.log('Hello');
    } else if(!think.isEmpty(keyword)){
      //通过关键词用LIKE子句查询
      let productData = await this.model('productinfo').where({'ProductName|ProductOutline': ['like', '%'+keyword+'%'] }).select();
      //不用LIKE子句查询
      // let producttypeData = await this.model('producttypeinfo').where({ProductTypeName: keyword}).find();
      // let productData = await this.model('productinfo').where({ProductTypeId: producttypeData.ProductTypeId}).select();
      this.assign('ProductItems', productData);
      console.log(productData);
    }
    this.assign('CrumbTitle', '商品列表');
    return this.display();
  }
}