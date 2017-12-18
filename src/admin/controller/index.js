'use strict';

export default class extends think.controller.base {
  /**
   * index action
   * @return {Promise} []
   */
  async __before(){
    let userinfo = await this.session('userinfo')
    console.log(userinfo)
    if(think.isEmpty(userinfo)){
      this.assign('isLogin', false)
    }else{
      this.assign('isLogin', true)
      this.assign('username', userinfo.username)
    }
  }
  indexAction(){
    //auto render template file index_index.html
    return this.display();
  }
}