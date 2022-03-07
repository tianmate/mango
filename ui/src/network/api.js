import { get, post, postObj } from "./http";

const apis = {
    //公共接口
    login: p => postObj('/system/login/common', p), // 登录
    //系统接口
    //用户
    getUser: p =>postObj('/system/account/getList', p),
    editUser: p =>postObj('/system/account/update', p),
    addUser: p =>postObj('/system/account/register', p),
    removeUser:p =>postObj('/system/account/remove',p),
    getUserMenu: p=>postObj('/system/account/getUserMenu', p),
    getUserRole: p=>postObj('/system/account/getUserRole', p),
    addUserRole: p=>postObj('/system/account/assignRole', p),
    removeUserRole:p=>postObj('/system/account/removeUserRole', p),
    //角色
    getRole: p =>postObj('/system/role/getList', p),
    editRole: p =>postObj('/system/role/update', p),
    addRole: p =>postObj('/system/role/add', p),
    getRoleMenu: p =>postObj('/system/role/getRoleMenu', p),
    addRoleMenu: p =>postObj('/system/role/assignMenu', p),
    removeRoleMenu: p =>postObj('/system/role/removeRoleMenu',p),
    //菜单
    getMenu: p => postObj('/system/menu/getList', p),
    editMenu: p => postObj('/system/menu/update', p),
    addMenu: p => postObj('/system/menu/add', p),
    getMenuByUser: p => postObj('/system/menu/getMenuByUser', p),

    //公众号接口
   // 关键字
    getKeyword: p => postObj('/wechat/keyWord/getList', p),
    editKeyword: p => postObj('/wechat/keyWord/update', p),
    addKeyword: p => postObj('/wechat/keyWord/add', p),
    // 活动计划
    getPlan: p => postObj('/wechat/plan/getList', p),
    editPlan: p => postObj('/wechat/plan/update', p),
    addPlan: p => postObj('/wechat/plan/add', p),
    //公众号用户管理
    getPublicUser: p => postObj('/wechat/publicUser/getList', p),
    editPublicUser: p => postObj('/wechat/publicUser/update', p),
    addPublicUser: p => postObj('/wechat/publicUser/add', p),
    //晚安计划管理
    getNightJoin: p => postObj('/wechat/nightJoin/getList', p),
    editNightJoin: p => postObj('/wechat/nightJoin/update', p),
    addNightJoin: p => postObj('/wechat/nightJoin/add', p),
    //交换管理
    getSwag: p => postObj('/wechat/swag/getList', p),
    editSwag: p => postObj('/wechat/swag/update', p),
    addSwag: p => postObj('/wechat/swag/add', p),
}

export default apis;
