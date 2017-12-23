'use strict';

import Base from '../../cart/controller/base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    if(this.isPost()){
      let pass = this.post('pass');
      let newpass = this.post('newpass');
      let repeat = this.post('repeat');
      let userinfo = await this.session('userinfo');
      if( pass != userinfo.UserPwd){
        return this.error(403, '原始密码不正确');
      } else if( newpass != repeat){
        return this.error(403, '两次输入的密码不一致');
      } else{
        let passupdateData = await this.model('user').where({UserId: userinfo.UserId}).update({UserPwd: newpass});
        let newinfo = await this.model('user').where({UserId: userinfo.UserId}).find();
        await this.session('userinfo', newinfo);
        return this.redirect('/user/passupdate');
      }
    }
    return this.display();
  }
}