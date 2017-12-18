'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    if(this.isPost()){
      let username = this.post('username');
      let password = this.post('password');
      let data = await this.model('user').where({UserName:username,UserPwd:password}).find();
      if(think.isEmpty(data)){
        return this.error(403, '用户名或密码不正确');
      }else{
        await this.session('userinfo', data);
        let nexturl =await this.session('nexturl');
        if(think.isEmpty(nexturl)){
          return this.redirect('/home');
        }else{
          await this.session('nexturl', '');
          return this.redirect(nexturl);
        }
      }
    }
    return this.display();
  }
}