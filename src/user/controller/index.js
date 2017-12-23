'use strict';

import Base from '../../cart/controller/base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    let userinfo = await this.session('userinfo');
    if(this.isPost()){
      console.log('Hello');
      let phone = this.post('phone');
      let email = this.post('email');
      let question = this.post('question');
      let answer = this.post('answer');
      let data = await this.model('user').where({UserId: userinfo.UserId}).update({
        UserTel: phone,
        UserEmail: email,
        UserQuestion: question,
        UserAnswer: answer
      });
      let newinfo = await this.model('user').where({UserId: userinfo.UserId}).find();
      await this.session('userinfo', newinfo);
      return this.redirect('/user');
    }
    this.assign('userinfo', userinfo);
    return this.display();
  }
}