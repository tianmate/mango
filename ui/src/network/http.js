import axios from "axios";
//数据处理包含序列化
import qs from 'qs';
import router from '../router';
import { Message } from 'element-ui';

const instance = axios.create({
  baseURL: process.env.VUE_APP_URL + process.env.VUE_APP_URL_PREFIX,
  timeout: 5000,
  headers: {
    'Content-type': 'application/json;charset=utf-8'
  }
});

// 请求拦截器
instance.interceptors.request.use(config => {
  // 除了登录接口 其他接接口请求都需要在请求头上添加 token
  if (config.url !== '/system/account/login') {
    const accessToken = Cookies.get('accessToken');
    const tokenType = Cookies.get('tokenType');
    if (accessToken) {
      config.headers['Authorization'] = `${accessToken}`;
    }
  }
  return config;
}, error => {
  Promise.reject(error).then(() => {
  });
});


instance.interceptors.response.use(res => {
  return res.data;
}, error => {
  if (error.response) {
    switch (error.response.status) {
      case 400:
        Message.error(error.response.data.message);
        break;
      case 401:
        router.replace({
          path: '/login'
        })
        break;
      // token 认证通过 但是没有权限
      case 403:
        Message.warning(error.response.data.message);
        break;
      // 404请求不存在
      case 404:
        Message.error(error.response.data.message);
        break;
      case 406:
        router.replace({
          path: '/login'
        })
        break;
      // 其他错误，直接抛出错误提示
      default:
        Message.error(error.response.data.message);
    }
  } else {
    Message.error("网络异常！");
  }
  return Promise.reject(error);
});

// get 方式
export function get(url, params) {
  return new Promise((resolve, reject) => {
    instance.get(url, {
      params
    }).then(res => {
      resolve(res);
    }).catch(err => {
      reject(err);
    })
  });
}

// 传参格式为 form-data
export function post(url, params) {
  return new Promise((resolve, reject) => {
    instance({
      method: 'POST',
      url,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
      },
      data: qs.stringify(params)
    }).then(res => {
      resolve(res);
    }).catch(err => {
      reject(err);
    });
  });
}

// 传参格式为 json
export function postObj(url, params) {
  return new Promise((resolve, reject) => {
    instance.post(url, params).then(res => {
      resolve(res);
    }).catch(err => {
      reject(err);
    })
  });
}
