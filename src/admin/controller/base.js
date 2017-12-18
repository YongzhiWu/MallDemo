'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */
  async __before(){
    let userinfo = await this.session('userinfo')
    if(think.isEmpty(userinfo)){
      this.assign('isLogin', false)
      return this.redirect('/admin/login')
    }else{
      this.assign('isLogin', true)
      this.assign('username', userinfo.username)
    }
  }
}