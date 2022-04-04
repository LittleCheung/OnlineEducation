package com.easyLearn.educenter.mapper;

import com.easyLearn.educenter.entity.UcenterMember;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 会员表 Mapper 接口
 * </p>
 *
 * @author atguigu
 * @since 2020-08-11
 */


public interface UcenterMemberMapper extends BaseMapper<UcenterMember> {

    Integer ucenterMemberService(String day);
}
