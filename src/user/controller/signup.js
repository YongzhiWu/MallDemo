'use strict';

import Base from './base.js';

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */
    async indexAction() {
        //auto render template file index_index.html
        if (this.isPost()) {
            let username = this.post('username');
            let password = this.post('password');
            let phone = this.post('phone');
            let mail = this.post('email');
            let question = this.post('question');
            let answer = this.post('answer');

            //生成用户Id，getTime() 方法可返回距 1970 年 1 月 1 日之间的毫秒数
            var d = new Date();
            let userid = d.getTime().toString();
            let adduser = await this.model('user').add({
                UserId: userid,
                shopcartid: userid,
                UserName: username,
                UserPwd: password,
                UserEmail: mail,
                UserTel: phone,
                UserQuestion: question,
                UserAnswer: answer
            });
            let addcart = await this.model('shopcart').add({
                ShopCartId: userid,
                UserId: userid
            });
            return this.redirect('/user/login');
    }
    return this.display();
}

//检查用户名是否已经存在
async isNameAction() {
    let username = this.post('username');
    let isName = await this.model('user').where({
        UserName: username
    }).find();
    if (think.isEmpty(isName)) {
        return this.success();
    } else {
        return this.fail(2000, '用户名已经存在！');
    }
}
}