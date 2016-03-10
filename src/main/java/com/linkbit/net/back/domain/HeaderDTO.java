package com.linkbit.net.back.domain;

import lombok.*;
import lombok.extern.log4j.Log4j;

/**
 * Created by huangbin on 2016/2/16 0016.
 */
@Data
@Setter
@Getter
@Log4j
@NoArgsConstructor
@AllArgsConstructor
public class HeaderDTO {
    private String systemName; //系统名称
    private String appName; //应用名称
    private String urlName;//url名称
}
