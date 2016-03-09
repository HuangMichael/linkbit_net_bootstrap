package com.linkbit.net.front.domain.role;

import com.linkbit.net.front.domain.user.User;
import lombok.*;
import lombok.extern.log4j.Log4j;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by huangbin on 2016/3/8.
 */
@Entity
@Table(name = "T_ROLE")
@Data
@Log4j
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Role implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(length = 20,unique = true,nullable = false)
    private String roleName;
    @Column(length = 20,nullable = false)
    private String roleDesc;
    @Column(length = 1,nullable = false)
    private String status;
    @ManyToMany(mappedBy="roles",cascade=CascadeType.ALL , targetEntity = com.linkbit.net.front.domain.user.User.class)
    private Set<User> users = new HashSet<User>();
}
