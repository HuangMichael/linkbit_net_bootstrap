package com.linkbit.net.front.domain.message;

import org.springframework.data.repository.CrudRepository;

/**
 * Created by huangbin on 2016/1/14 0014.
 * 留言接口
 */
public interface MessageRepository extends CrudRepository<Message,Long> {
    /**
     * 保存留言
     */
    Message save(Message message);
}
