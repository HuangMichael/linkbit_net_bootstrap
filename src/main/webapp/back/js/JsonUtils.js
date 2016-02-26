/**
 * 字符串转JSON对象
 * from 序列化
 * */
$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};


/**
 * from 序列化后的字符串转换为对象
 * */
function convertToObject(str) {
    var o = {};
    var array = str.split("&");
    for (var x in array) {
        console.log(array[x].split("=")[0]+"-------------"+array[x].split("=")[1]);
        o[array[x].split("=")[0]] = array[x].split("=")[1];
    }
    return o;
}