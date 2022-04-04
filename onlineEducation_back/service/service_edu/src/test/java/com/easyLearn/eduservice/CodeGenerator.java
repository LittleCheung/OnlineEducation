package com.easyLearn.eduservice;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.Test;


/**
 * 代码生成器，用于MyBatis Plus自动生成所需代码
 */
public class CodeGenerator {
    @Test
    public void run() {

        //创建代码生成器
        AutoGenerator mpg = new AutoGenerator();

        //全局配置如下：
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        System.out.println(projectPath);
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor("easyLearn");
        gc.setOpen(false); //生成后是否打开资源管理器
        gc.setFileOverride(false); //重新生成时文件是否覆盖
        gc.setServiceName("%sService");    //去掉Service接口的首字母I
        gc.setIdType(IdType.ID_WORKER_STR); //主键策略
        gc.setDateType(DateType.ONLY_DATE);//定义生成的实体类中日期类型
        gc.setSwagger2(true);//开启Swagger2模式
        mpg.setGlobalConfig(gc);

        //数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/easyLearn?serverTimezone=GMT%2B8");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("170220");
        dsc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dsc);

        //包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName("serviceedu");
        pc.setParent("com.easyLearn");
        pc.setController("controller");
        pc.setEntity("entity");
        pc.setService("service");
        pc.setMapper("mapper");
        mpg.setPackageInfo(pc);

        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setInclude("edu_chapter", "edu_course", "edu_course_description", "edu_video");
        strategy.setNaming(NamingStrategy.underline_to_camel);  // 数据库表映射到实体的命名策略
        strategy.setTablePrefix(pc.getModuleName() + "_");      // 生成实体时去掉表前缀
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);        // 数据库表字段映射到实体的命名策略
        strategy.setEntityLombokModel(true);        // lombok 模型 @Accessors(chain = true) setter链式操作
        strategy.setRestControllerStyle(true);      // restful api风格控制器
        strategy.setControllerMappingHyphenStyle(true);     // url中驼峰转连字符
        mpg.setStrategy(strategy);


        mpg.execute();
    }
}
