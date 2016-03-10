package com.linkbit.net.back.web;

/**
 * Created by Administrator on 2016/3/10.
 */
public class BackBaseController {


    public String getIndexUrl() {
        String indexUrl = "";
        indexUrl = this.getClass().getSimpleName();
        if (indexUrl != null) {
            indexUrl = indexUrl.substring(4, indexUrl.indexOf("Controller") );
            indexUrl =   indexUrl.substring(0,1).toLowerCase()+indexUrl.substring(1,indexUrl.length());
        }
        return indexUrl;
    }
}
