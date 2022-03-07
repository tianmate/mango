//保存文件的路由器
import VueRouter from 'vue-router'

import Vue from "vue";

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: () => import('../pages/login')
    },
    {
        path: '/pages/Index',
        component: () => import('../pages/Index'),
        children:[
            {
                path: '/pages/menu',
                component: () => import('../pages/menu/menu')
            },
            {
                path: '/pages/role',
                component: () => import('../pages/role/role')
            },
            {
                path: '/pages/user',
                component: () => import('../pages/user/user')
            },
            {
                path: '/pages/gzh/keyword',
                component: () => import('../pages/gzh/keyword')
            },
            {
                path: '/pages/gzh/plan',
                component: () => import('../pages/gzh/plan')
            },
            {
                path: '/pages/gzh/publicUser',
                component: () => import('../pages/gzh/publicUser')
            },
            {
                path: '/pages/gzh/nightJoin',
                component: () => import('../pages/gzh/nightJoin')
            },
            {
                path: '/pages/gzh/swag',
                component: () => import('../pages/gzh/swag')
            }
        ]
    },


]


const router = new VueRouter({
    routes
});

export default router