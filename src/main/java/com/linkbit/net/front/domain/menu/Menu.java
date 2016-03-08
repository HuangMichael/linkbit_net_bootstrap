package com.linkbit.net.front.domain.menu;


import lombok.*;

import javax.persistence.*;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 菜单
 */
@Entity
@Table(name = "T_MENU")
@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String menuName;
    private String menuDesc;
    private String iconClass;
    private String url;
    private String menuType;
    private long sortNo;
    private String status;
}

