'use strict';

import Base from '../../home/controller/base.js';
export default class extends Base {
  /**
   * some base method in here
   */
  async __before(){
    super.__before();
    let userinfo = await this.session('userinfo')
    if(think.isEmpty(userinfo)){
      let url = this.http.url;
      await this.session('nexturl', url);
      return this.redirect('/user/login')
    }
  }
}