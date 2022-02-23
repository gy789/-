package com.expressage.mapper;

import com.expressage.entity.Menu;

import java.util.List;

public interface MenuMapper {
    List<Menu> getMenuList();//得到所有menu列表
    int addMenu(Menu menu);//添加menu（主要是添加快递公司菜单信息）
}
