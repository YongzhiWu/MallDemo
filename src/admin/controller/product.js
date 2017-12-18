'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    return this.display();
  }

  cateAction(){
    return this.display();
  }

  showAction(){
    return this.display();
  }

  addAction(){
    return this.display();
  }

  newAction(){
    return this.display();
  }
}