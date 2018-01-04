'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    // let cate = this.model('cate');
    // let cate_row = await cate.where().max('cate_row');
    // let cate_column = await cate.where().max('cate_column');
    // let cata_data = await cate.select();
    // let cate_items = new Array(cate_row);
    // for(var i = 0; i < cate.length; i++){
    //   cate_items[cate[i].row][cate[i].column] = cate[i].name;
    // }
    // this.assign('cate_items', cate_items);
    // console.log(cate_items);
    //查询首页商品数据表

    //查询侧边导航栏
    let cate = new Array(10);
    var index;
    for(var i = 0; i< 10; i++){
      let cateData = await this.model('cate').where({row: i+1}).select();
      for(index in cateData){
        let productTypeData = await this.model('producttypeinfo').where({ProductTypeId: cateData[index].ProductTypeId}).find();
        cateData[index]['ProductTypeName'] = productTypeData.ProductTypeName;
      }
      cate[i] = cateData;
    }
    this.assign('CateItems', cate);

    //查询轮播图
    let carousel = await this.model('carousel').select();
    for(index in carousel){
      let productData = await this.model('productinfo').where({ProductId: carousel[index].ProductId}).find();
      carousel[index]['ProductPic'] = productData.ProductPic;
    }
    this.assign('Carousel', carousel);
    return this.display();
  }
}