<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="form-group">
    <label for="paraDesc">参数描述</label>
    <input type="text" class="form-control"
           id="paraDesc"
           name="sysConfig.paraDesc" value="${sysConfig.paraDesc}">
</div>
<div class="form-group">
    <label for="paraName">参数名</label>
    <input type="text" class="form-control"
           id="paraName"
           name="sysConfig.paraName" value="${sysConfig.paraName}">
</div>
<div class="form-group">
    <label for="paraValue">参数值</label>
    <input type="text" class="form-control"
           id="paraValue"
           name="sysConfig.paraValue" value="${sysConfig.paraValue}">
</div>
<div class="form-group">
    <label for="status">使用状态</label>
    <select class="form-control"
            id="status"
            name="user.status">
        <option value="1" selected>启用</option>
        <option value="0">禁用</option>
    </select>
</div>