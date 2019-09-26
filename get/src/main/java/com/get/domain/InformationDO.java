package com.get.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 资讯表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-09-23 19:56:59
 */
@Data
public class InformationDO implements Serializable {
    private static final long serialVersionUID = 1L;

            //主键
    private String tid;
            //标题
    private String title;
            //内容
    private String content;
            //类型，1-轮播图，2-轮播图下菜单，3-推荐菜单，4-table
    private Integer type;
            //层级
    private Integer level;
            //状态，0-可用，1-不可用
    private Integer status;
            //链接
    private String link;
            //创建时间
    private Date createDate;
            //更新时间
    private Date updateDate;
            //删除标记
    private String delFlag;
            //图片
    private String pic;
            //父级id
    private String ex1;
            //ex2
    private Integer ex2;
            //ex3
    private String ex3;
            //ex4
    private String ex4;
    
    }
