
var dartCallback

/**
 * dart设置回调
*/
function setDartCallBack(callback) {
    dartCallback = callback;
}

/**
 * dart给js 发送命令
*/
function sendMessage(msg) {
    let msgObj=JSON.parse(msg);
    let {action,url}=msgObj;
    if(action=="openIframe"){
        openIframe(url);
    }else if(action=="closeIframe"){
        closeIframe();
    }else if(action=="resumeIframe"){
        resumeIframe();
    }
}
window.addEventListener("message",(e)=>{
    console.log("收到message数据",e)
    let data=e.data;
    if(data.action=="transfer"){
        dartCallback(JSON.stringify({action:"transfer"}))
    }else if(data.action=="closeIframe"){
        closeIframe();
    }
})
function openIframe(url) {
    document.getElementsByClassName("iframeloadingarea")[0].style.display='flex';
    document.getElementById("iframeWrapper").style.display='block';
    document.getElementById("iframe1").src=url;
}
function resumeIframe(url) {
    document.getElementById("iframeWrapper").style.display='block';
}
function closeIframe() {
    document.getElementById("iframeWrapper").style.display='none';
}
function sendMessage2Iframe() {
    document.getElementById("iframe1").contentWindow.postMessage({ desc: "这是父页面postMessage来的数据", a: 1, b: 2, action: "t" }, "*");
}
function iframeLoad() {
    document.getElementsByClassName("iframeloadingarea")[0].style.display='none';
}
function transfer() {
    dartCallback(JSON.stringify({action:"transfer"}))
}
function refresh() {
    openIframe(document.getElementById("iframe1").src)
}
function close_() {
    closeIframe();
    dartCallback(JSON.stringify({event:"closeIframe"}))
}
function fullscreen() {

}

function setPointerEvents(data) {
    var canvasElements = document
        .querySelector("flt-glass-pane")
        .shadowRoot.querySelectorAll("canvas");
      canvasElements.forEach(function (el) {
        el.style.pointerEvents = data;
    });
}

window.parent.setPointerEvents = setPointerEvents;