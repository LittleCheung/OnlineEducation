package com.atguigu.orderservice.service.impl;

import com.easyLearn.commonutils.user.CourseWebVoOrder;
import com.easyLearn.commonutils.user.UcenterMemberOrder;
import com.atguigu.orderservice.client.EduClient;
import com.atguigu.orderservice.client.UcenterClient;
import com.atguigu.orderservice.entity.Order;
import com.atguigu.orderservice.mapper.OrderMapper;
import com.atguigu.orderservice.service.OrderService;
import com.atguigu.orderservice.utils.OrderNoUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author atguigu
 * @since 2020-08-16
 */
@Transactional
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private EduClient eduClient;

    @Autowired
    private UcenterClient ucenterClient;

    //1.生成订单的方法
    @Override
    public String createOrders(String courseId, String memberId) {

        //远程调用根据课程id获得课程信息
        CourseWebVoOrder courseInfoOrder = eduClient.getCourseInfoOrder(courseId);

        //远程调用根据用户id获得用户信息
        UcenterMemberOrder userInfoOrder = ucenterClient.getUserInfoOrder(memberId);

        //创建order对象，向order中设置需要的值
        Order order = new Order();
        order.setOrderNo(OrderNoUtil.getOrderNo());
        order.setCourseId(courseId);
        order.setCourseTitle(courseInfoOrder.getTitle());
        order.setCourseCover(courseInfoOrder.getCover());
        order.setTeacherName(courseInfoOrder.getTeacherName());
        order.setTotalFee(courseInfoOrder.getPrice());
        order.setMemberId(memberId);
        order.setMobile(userInfoOrder.getMobile());
        order.setNickname(userInfoOrder.getNickname());

        //订单状态与支付类型
        order.setStatus(0);
        order.setPayType(1);
        baseMapper.insert(order);

        //返回订单号
        return order.getOrderNo();
    }
}
