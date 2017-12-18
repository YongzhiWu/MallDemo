'use strict';

import Base from '../../home/controller/base.js';
export default class extends Base {
  /**
   * some base method in here
   */
  async __before(){
    let userinfo = await this.session('userinfo')
    if(think.isEmpty(userinfo)){
      return this.redirect('/user/login')
    }
  }
}