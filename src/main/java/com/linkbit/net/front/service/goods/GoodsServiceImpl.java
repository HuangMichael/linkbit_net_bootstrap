package com.linkbit.net.front.domain.service.goods;


import com.linkbit.net.front.domain.goods.Goods;
import com.linkbit.net.front.domain.goods.GoodsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsRepository goodsRepository;

    @Override
    public void create() {
        goodsRepository.create();
        System.out.println("this is the method from " + this.getClass().getSimpleName());
    }


    @Override
    public List<Goods> findAllGoods() {
        List<Goods> goodsList = new ArrayList<Goods>();
        Goods goods = null;
        for (int i = 0; i < 5; i++) {
            goods = new Goods("0012311-" + i, "商品" + i, Math.random() + i, "商品描述");
            goodsList.add(goods);
        }
        return goodsList;
    }
}
