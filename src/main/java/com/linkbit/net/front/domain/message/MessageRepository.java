package com.linkbit.net.front.domain.message;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/14 0014.
 * 留言接口
 */
public interface MessageRepository extends CrudRepository<Message, Long> {
    /**
     * 保存留言
     */
    Message save(Message message);

    /**
     * 查询所有留言
     */
    @Query("select m from Message m   order by m.messageTime desc")
    List<Message> findAll();

    /**
     * 根据id查询留言
     */

    Message findById(long id);

    /**
     * 查询未读信息
     */
    @Query("select m from Message m where m.status='0' order by m.messageTime desc")
    List<Message> findAllUnreadMessages();

}
