package com.linkbit.net.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
public class BaseController {
    Log log = LogFactory.getLog(this.getClass());
}