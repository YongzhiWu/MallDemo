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

    //将数据传递给前端
    return this.display();
  }
}