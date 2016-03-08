package com.linkbit.net.front.domain.role;

import lombok.*;
import lombok.extern.log4j.Log4j;

import javax.persistence.*;
import java.io.Serializable;

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
}