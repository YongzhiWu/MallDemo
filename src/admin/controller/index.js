'use strict';

export default class extends think.controller.base {
  /**
   * index action
   * @return {Promise} []
   */
  async __before(){
    let userinfo = await this.session('admininfo')
    if(think.isEmpty(userinfo)){
      this.assign('isAdminLogin', false)
    }else{
      this.assign('isAdminLogin', true)
      this.assign('username', userinfo.username)
    }
  }
  indexAction(){
    //auto render template file index_index.html
    return this.display();
  }
}