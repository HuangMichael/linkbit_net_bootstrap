package com.linkbit.net.front.web;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by Administrator on 2015/12/24 0024.
 */



@Controller
public class MainsiteErrorController extends BaseController implements ErrorController {

    private static final String ERROR_PATH = "/front/error";

    @RequestMapping(value = ERROR_PATH)
    public String handleError() {
        return ERROR_PATH;
    }

    @Override
    public String getErrorPath() {
        // TODO Auto-generated method stub

        return ERROR_PATH;
    }

}

