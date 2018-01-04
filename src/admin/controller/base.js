'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */
  async __before(){
    let userinfo = await this.session('admininfo')
    if(think.isEmpty(userinfo)){
      this.assign('isAdminLogin', false)
      return this.redirect('/admin/login')
    }else{
      this.assign('isAdminLogin', true)
      this.assign('username', userinfo.username)
    }
  }
}