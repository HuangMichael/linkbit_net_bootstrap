package com.linkbit.net.front.domain.role;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/3/8.
 * 角色接口
 */
public interface RoleRepository extends CrudRepository<Role, Long> {
    /**
     * 查询所有角色
     */
    List<Role> findAll();

    /**
     * 根据id查询角色
     */
    Role findById(long id);

    /**
     * 保存角色
     */
    Role save(Role role);
    /**
     * 删除角色
     */
    void delete(Role role);


}
