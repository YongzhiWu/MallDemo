'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */
  async __before(){
    let userinfo = await this.session('userinfo')
    if(think.isEmpty(userinfo)){
      this.assign('isLogin', false)
    }else{
      this.assign('isLogin', true)
      this.assign('username', userinfo.UserName)
    }
  }
}