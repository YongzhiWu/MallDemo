'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async __before(){
    super.__before();
    let userinfo = await this.session('userinfo')
    if(think.isEmpty(userinfo)){
      return this.redirect('/user/login')
    }
  }
  indexAction(){
    //auto render template file index_index.html
    //生成支付宝二维码

    //将二维码数据传递给前端
    this.assign('CrumbTitle', '订单支付');
    return this.display();
  }
}