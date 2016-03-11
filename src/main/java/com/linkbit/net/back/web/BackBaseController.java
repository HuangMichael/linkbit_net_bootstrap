package com.linkbit.net.back.web;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;

/**
 * Created by huangbin on 2016/3/10.
 */
@Controller
@EnableAutoConfiguration
public class BackBaseController {
    public String getIndexUrl() {
        String indexUrl = this.getClass().getSimpleName();
        if (indexUrl != null) {
            indexUrl = indexUrl.substring(4, indexUrl.indexOf("Controller"));
            indexUrl = indexUrl.substring(0, 1).toLowerCase() + indexUrl.substring(1, indexUrl.length());
        }
        return indexUrl;
    }
}
