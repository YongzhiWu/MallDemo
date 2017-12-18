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
      let phone = this.post('phone');
      let mail = this.post('mail');
      //生成用户Id，getTime() 方法可返回距 1970 年 1 月 1 日之间的毫秒数
      var d = new Date();
      let userid = d.getTime().toString();
      let adduser = await this.model('user').add({
        UserId: userid,
        UserName:username, 
        UserPwd:password,
        UserEmail: mail,
        UserTel: phone
      });
      return this.redirect('./login');
    }
    return this.display();
  }
}