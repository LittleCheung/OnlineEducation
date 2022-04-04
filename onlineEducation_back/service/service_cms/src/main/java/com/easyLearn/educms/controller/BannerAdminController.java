package com.easyLearn.educms.controller;


import com.easyLearn.commonutils.R;
import com.easyLearn.educms.entity.CrmBanner;
import com.easyLearn.educms.service.CrmBannerService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 首页banner表(轮播图)后台操作接口
 */
@RestController
@RequestMapping("/educms/banneradmin")
@CrossOrigin
public class BannerAdminController {

    @Autowired
    private CrmBannerService crmBannerService;

    /**
     * 分页查询banner
     * @param page
     * @param limit
     * @return
     */
    @GetMapping()
    public R pageBanner(@PathVariable long page,long limit){
        Page<CrmBanner> bannerPage = new Page<>(page,limit);
        IPage<CrmBanner> pages = crmBannerService.page(bannerPage, null);
        List<CrmBanner> records = pages.getRecords();
        long total = pages.getTotal();
        return R.ok().data("items",records).data("total",total);
    }


    /**
     * //添加banner
     * @param crmBanner
     * @return
     */
    @PostMapping("addBanner")
    public R addBanner(@RequestBody CrmBanner crmBanner){
        crmBannerService.save(crmBanner);
        return R.ok();
    }


    /**
     * 根据id获取Banner
     */
    @ApiOperation(value = "获取Banner")
    @GetMapping("get/{id}")
    public R get(@PathVariable String id) {
        CrmBanner banner = crmBannerService.getById(id);
        return R.ok().data("item", banner);
    }


    /**
     * 修改Banner
     * @param banner
     * @return
     */
    @ApiOperation(value = "修改Banner")
    @PutMapping("update")
    public R updateById(@RequestBody CrmBanner banner) {
        crmBannerService.updateById(banner);
        return R.ok();
    }


    /**
     * 根据id删除Banner
     * @param id
     * @return
     */
    @ApiOperation(value = "删除Banner")
    @DeleteMapping("remove/{id}")
    public R remove(@PathVariable String id) {
        crmBannerService.removeById(id);
        return R.ok();
    }

}

