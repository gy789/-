package com.expressage.service.impl;

import com.expressage.entity.Menu;
import com.expressage.mapper.MenuMapper;
import com.expressage.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired(required = false)
    private MenuMapper menuMapper;
    @Override
    public List<Menu> getMenuList() {
        return menuMapper.getMenuList();
    }

    @Override
    public int addMenu(Menu menu) {
        return menuMapper.addMenu(menu);
    }
}
