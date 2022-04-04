package com.easyLearn.educms.service.impl;

import com.easyLearn.educms.entity.CrmBanner;
import com.easyLearn.educms.mapper.CrmBannerMapper;
import com.easyLearn.educms.service.CrmBannerService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 首页banner表 服务实现类
 */
@Transactional
@Service
public class CrmBannerServiceImpl extends ServiceImpl<CrmBannerMapper, CrmBanner> implements CrmBannerService {

    @Cacheable(value = "banner",key = "'selectIndexList'")
    /**
     * 查询所有banner
     */
    @Override
    public List<CrmBanner> selectAllBanner() {
        //根据id降序排列，显示排列之后的前两条记录
        QueryWrapper<CrmBanner> bannerQueryWrapper = new QueryWrapper<>();
        bannerQueryWrapper.orderByDesc("id");
        bannerQueryWrapper.last("limit 2");
        List<CrmBanner> list = baseMapper.selectList(null);
        return list;
    }
}
