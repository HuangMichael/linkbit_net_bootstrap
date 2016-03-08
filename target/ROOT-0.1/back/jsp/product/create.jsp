<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="modal fade" id="myModal${product.id}" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">产品信息明细</h4>
            </div>
            <div class="modal-body">
                <form id="productForm${product.id}">
                    <div class="form-group">
                        <label for="productName${product.id}">产品名称</label>
                        <input type="text" class="form-control"
                               id="productName${product.id}"
                               name="product.productName"
                               value="${product.productName}">
                    </div>
                    <div class="form-group">
                        <label for="productType${product.id}">产品类型</label>
                        <select class="form-control"
                                id="productType${product.id}"
                                name="product.productType">
                            <option value="1">PDA</option>
                            <option value="2">手机</option>
                            <option value="3">导航仪</option>
                            <option value="4">指挥机</option>
                            <option value="5">手表</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="productDesc${product.id}">产品描述</label>
                        <input type="text" class="form-control"
                               id="productDesc${product.id}"
                               name="product.productDesc"
                               value="${product.productDesc}">
                    </div>
                    <div class="form-group">
                        <label for="onLineDate${product.id}">上线日期</label>
                        <input type="date" class="form-control"
                               id="onLineDate${product.id}"
                               name="product.onLineDate"
                               value="${product.onLineDate}">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">产品图片</label>
                        <input type="file" id="exampleInputFile">

                        <p class="help-block">上传一张产品图片吧</p>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="online${product.id}"
                                   name="product.online"
                                   value="${product.online}"> 是否显示
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="submit" id="save${product.id}" name="saveBtn"
                        class="btn btn-primary">保存
                </button>
            </div>
        </div>
    </div>
</div>