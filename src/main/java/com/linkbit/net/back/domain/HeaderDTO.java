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
    private  String systemName;
    private String appName;
}
