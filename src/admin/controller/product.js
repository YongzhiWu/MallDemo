'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  //商品种类展示
  async indexAction() {
    //auto render template file index_index.html
    if(this.isPost()){
      //查询商品
      let select = this.post('select');
      let key = this.post('key');
      console.log(key);
      if( select == 1){
        //按商品名称查询
        let searchData = await this.model('productinfo').select();
        var result = [];
        for(var i = 0; i < searchData.length; i++){
          if(searchData[i].ProductName.indexOf(key) != -1 ){
            result.push(searchData[i]);
          }
        }
        this.assign('items', result);
      } else if(select == 2) {
        //按商品id查询
        let searchData = await this.model('productinfo').where({ProductId: key}).select();
        this.assign('items', searchData);
      }
      return this.display();
    }
    let productinfo = this.model('productinfo');
    let data = await productinfo.select();
    this.assign('items', data);
    return this.display();
  }

  //品类管理
  async cateAction() {
    let productclass = this.model('productclass');
    let ClassData = await productclass.select();
    this.assign('ClassItems', ClassData);
    return this.display();
  }

  //网站首页展示管理
  showAction() {
    return this.display();
  }

  //添加新商品
  async addAction() {
    if (this.isPost()) {
      let name = this.post('name');
      let description = this.post('description');
      let producttype = this.post('ChildClassId');
      let price = this.post('price');
      let quantity = this.post('quantity');
      let addProduct = await this.model('productinfo').add({
        ProductTypeId: producttype,
        ProductName: name,
        ProductPrice: price,
        ProductOutline: description,
        ProductStorage: quantity
      });
      return this.redirect('/admin/product');
    }
    let productclass = this.model('productclass');
    let ClassData = await productclass.select();
    this.assign('ClassItems', ClassData);
    return this.display();
  }

  //商品品类选择
  async addtypeselectAction() {
    let classid = this.post('ClassValue');
    let producttypeinfo = this.model('producttypeinfo');
    let productTypeData = await producttypeinfo.where({
      ClassId: classid
    }).select();
    return this.success(productTypeData);
  }

  //删除商品
  async productDeleteAction() {
    let id = this.get('productid');
    let deleteProductData = await this.model('productinfo').where({
      ProductId: id
    }).delete();
    return this.redirect('/admin/product/index');
  }

  //查看编辑商品
  async productEditAction() {
    if(this.isPost()){
      let id = this.post('productid');
      let name = this.post('name');
      let description = this.post('description');
      let price = this.post('price');
      let quantity = this.post('quantity');
      let updateData = await this.model('productinfo').where({ProductId: id}).update({
        ProductName: name,
        ProductPrice: price,
        ProductOutline: description,
        ProductStorage: quantity
      });
      return this.redirect('/admin/product');
    }
    let productid = this.get('productid');
    let productData = await this.model('productinfo').where({ProductId: productid}).find();
    let producttypeid = productData.ProductTypeId;
    let productTypeIdData = await this.model('producttypeinfo').where({ProductTypeId: producttypeid}).find();
    let classid = productTypeIdData.ClassId;
    let classData = await this.model('productclass').where({ClassId: classid}).find();
    this.assign('class', classData);
    this.assign('producttype', productTypeIdData);
    this.assign('product', productData);
    return this.display();
  }

  //添加品类
  async newAction() {
    if (this.isPost()) {
      let type = this.post('type');
      let childType = this.post('child-type');
      let productclass = this.model('productclass');
      let producttypeinfo = this.model('producttypeinfo');
      //添加品类
      let addClassId = await productclass.add({
        ClassName: type
      });
      //添加子品类
      if (typeof childType == "object") {
        let childTypeLen = childType.length;
        for (var i = 0; i < childTypeLen; i++) {
          let addChildClass = await producttypeinfo.add({
            ProductTypeName: childType[i],
            ClassId: addClassId
          });
        }
      } else if (typeof childType == "string") {
        let addChildClass = await producttypeinfo.add({
          ProductTypeName: childType,
          ClassId: addClassId
        });
      }
      return this.redirect('/admin/product/cate');
    }
    return this.display();
  }

  //删除品类
  async cateDeleteAction() {
    let id = this.get('classid');
    let deleteTypeData = await this.model('producttypeinfo').where({
      ClassId: id
    }).delete();
    let deleteClassData = await this.model('productclass').where({
      ClassId: id
    }).delete();
    return this.redirect('/admin/product/cate');
  }

  //品类编辑
  async cateEditAction() {
    if (this.isPost()) {
      let updateData = this.post();
      let keys = Object.keys(updateData);
      var ClassId;
      for (var i = 0; i < keys.length; i++) {
        var item = keys[i];
        if (item.indexOf('class') != -1) {
          ClassId = item.split('-')[1];
          let updateClass = await this.model('productclass').where({
            ClassId: parseInt(ClassId)
          }).update({
            ClassName: updateData[item]
          });
        }
        if (item.indexOf('type') != -1) {
          let typeid = item.split('-')[1];
          let updateType = await this.model('producttypeinfo').where({
            ProductTypeId: parseInt(typeid)
          }).update({
            ProductTypeName: updateData[item]
          });
        }
        if (item.indexOf('new') != -1) {
          let newType = await this.model('producttypeinfo').add({
            ProductTypeName: updateData[item],
            ClassId: parseInt(ClassId)
          })
        }
      }
      return this.redirect('/admin/product/cate');
    }
    let classid = this.get('classid');
    let productclassData = await this.model('productclass').where({
      ClassId: classid
    }).find();
    let producttypeData = await this.model('producttypeinfo').where({
      ClassId: classid
    }).select();
    this.assign('ClassItem', productclassData);
    this.assign('TypeItems', producttypeData);
    return this.display();
  }
}