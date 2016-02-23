package com.linkbit.net.front.domain.message;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/14 0014.
 * 留言接口
 */
public interface MessageRepository extends CrudRepository<Message,Long> {
    /**
     * 保存留言
     */
    Message save(Message message);

    /**
     * 查询所有留言
     */

    List<Message> findAll();

    /**
     * 根据id查询留言
     */

    Message findById(long id);
}
