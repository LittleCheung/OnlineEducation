import axios from 'axios'
import cookie from 'js-cookie'
import { MessageBox, Message } from 'element-ui'

// 创建axios实例
const service = axios.create({
  baseURL: `http://localhost:9001`, // api的base_url
  timeout: 20000 // 请求超时时间
})
// 第三步http request 拦截器
service.interceptors.request.use(
  config => {
  //debugger
  //判断cookie里面guli_token是否有值
  if (cookie.get('guli_token')) {
    //吧获取的token放在头部headers中
    config.headers['token'] = cookie.get('guli_token');
  }
    return config
  },
  err => {
  return Promise.reject(err);
})

export default service