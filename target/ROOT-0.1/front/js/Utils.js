/**
 * Created by Administrator on 2016/2/1 0001.
 */


function getRandomAnimation() {
    var array = new Array();
    array.push("fadeIn");
    array.push("fadeInUp");
    array.push("fadeInDown");
    array.push("fadeInLeft");
    array.push("fadeInRight");
    array.push("fadeInUpBig");
    array.push("fadeInDownBig");
    array.push("fadeInLeftBig");
    array.push("fadeInRightBig");
    array.push("flipInX");
    array.push("bounceIn");
    array.push("bounceInDown");
    array.push("bounceInUp");
    array.push("bounceInLeft");
    array.push("bounceInRight");
    array.push("rotateIn");
    array.push("rotateInDownLeft");
    array.push("rotateInDownRight");
    array.push("rotateInUpLeft");
    array.push("rotateInUpRight");
    array.push("rollIn");
    var index = Math.ceil(Math.random() * array.length);
    return array[index];
}