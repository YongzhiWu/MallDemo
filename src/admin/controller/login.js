'use strict';

export default class extends think.controller.base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction() {
    //auto render template file index_index.html
    if (this.isPost()) {
      let username = this.post('username');
      let password = this.post('password');
      console.log(username)
      if (!(username == 'hust' && password == 'eic')) {
        return this.error(403, '用户名或密码不正确');
      } else {
        await this.session('userinfo', {
          username: username,
          password: password
        });
        return this.redirect('/admin/index');
      }
    }
    return this.display();
  }
}