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
        this.assign('error', true);
        return this.display();
      } else {
        await this.session('admininfo', {
          username: username,
          password: password
        });
        return this.redirect('/admin/index');
      }
    }
    this.assign('error', false);
    return this.display();
  }
}