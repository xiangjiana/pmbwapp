//根据文本生成二维码并下载
function createrQRDownload(text) {
    var options = {
        text: text,
        quietZone: 5,
    };
    // Create QRCode Object
    new QRCode(document.getElementById("qrcode"), options);
    let drawing = document.getElementsByTagName('canvas')[0];
    if (drawing.getContext) {
        let context = drawing.getContext('2d');
        console.log(context);
        let imgURI = drawing.toDataURL("image/png");
        let image = document.createElement("img");
        image.src = imgURI;
        $("#qrcode").empty()
        let a = document.createElement("a");
        a.href = imgURI;
        a.innerText = 'download qrcode';
        a.download = 'OBBW-' + new Date().getTime() + '.png';
        document.body.appendChild(a);
        a.click()
    }
}
//代理库的下载
async function downloadImageWithQRCode(data) {
    data=JSON.parse(data)
    let {backgroundImageUrl, qrCodeText,qrCodeSize,qrCodeColor,qrCodeLeft=0,qrCodeTop=0,tipStr,fontSize=12,tipStrColor='#222222',tipStrLeft=0,tipStrTop=0}=data;
    let canvas = document.createElement('canvas');
    document.body.appendChild(canvas)
    let ctx = canvas.getContext('2d');
    const ratio = 3
    const transform = n => n * ratio
    const background = await loadImage(backgroundImageUrl)
    canvas.width = background.width
    canvas.height = background.height
    ctx.drawImage(background, 0, 0, background.width, background.height, 0, 0, background.width, background.height)
    if(qrCodeText){
        let qrCanvas=getQrCanvas(qrCodeText,transform(qrCodeSize),transform(qrCodeSize),qrCodeColor)
        //qrCodeLeft=-1默认放到右上角 
        if(qrCodeLeft==-1){
            ctx.drawImage(qrCanvas, background.width-qrCanvas.width, 0, qrCanvas.width, qrCanvas.height)
        }else{
            ctx.drawImage(qrCanvas, transform(qrCodeLeft),transform(qrCodeTop), qrCanvas.width, qrCanvas.height)
        }
        qrCanvas.remove();
    }
    if(tipStr){
        ctx.font = `${transform(fontSize)}px inherit bold`
        ctx.fillStyle = tipStrColor
        ctx.fillText(tipStr, transform(tipStrLeft), transform(tipStrTop))
    }
    showCanvasImgInDialog(canvas)
}

//优惠分享的海报下载
async function downloadDiscountPoster(data) {
    data=JSON.parse(data)
    console.log(data)
    let {imageUrl, qrCodeText,title,date}=data;
    let qrCodeSize=90;
    let fontSize=16;
    let qrCodeColor='#000';
    let canvas = document.createElement('canvas');
    canvas
    document.body.appendChild(canvas)
    let ctx = canvas.getContext('2d');
    const ratio = 2
    const transform = n => n * ratio
    const background = await loadImage(imageUrl)
    let canvasWidth=1024;
    canvas.width = canvasWidth
    canvas.height = (background.height/background.width)*canvasWidth + transform(130)
    ctx.fillStyle = '#1D2933';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.drawImage(background, 0, 0, background.width, background.height, 0, 0, canvasWidth, (background.height/background.width)*canvasWidth)
    if(qrCodeText){
        let qrCanvas=getQrCanvas(qrCodeText,transform(qrCodeSize),transform(qrCodeSize),qrCodeColor)
        ctx.drawImage(qrCanvas, canvas.width-qrCanvas.width-20, canvas.height-qrCanvas.height-20, qrCanvas.width, qrCanvas.height)
        qrCanvas.remove();
    }
    ctx.font = `bold small-caps ${transform(fontSize)}px sans-serif`;
    ctx.fillStyle = '#fff'
    ctx.fillText(date, 20 , canvas.height - transform(100)/2 + 15)
    ctx.fillStyle = '#ccc'
    ctx.fillText(`${title}`, 20 , canvas.height - transform(100)/2 - 30)
    showCanvasImgInDialog(canvas)
}
//根据文字获取二维码的canvas
function getQrCanvas(text,width,height,colorDark) {
    width=width||120;
    height=height||120;
    colorDark=colorDark||"#000000"
    let div = document.createElement('div');
    div.width=width;
    div.height=height;
    document.body.appendChild(div)
    new QRCode(div, {
        text: text,
        quietZone: 10,
        width,
        height,
        colorDark
    });
    return div.childNodes[0]
}
//把canvas保存下载图片并移除dom
function saveCanvasAndRemove(canvas,format) {
    canvas=canvas||currentCanvas;
    let a = document.createElement("a");
    a.href = canvas.toDataURL(format);
    a.innerText = 'download qrcode';
    a.download = 'OBBW-' + new Date().getTime() + '.png';
    document.body.appendChild(a);
    a.click()
    a.remove()
    canvas.remove()
}
var currentCanvas;//当前操作的canvas
//弹窗展示图片让用户手动长按保存
function showCanvasImgInDialog(canvas) {
    let imgBase64=canvas.toDataURL()
    let saveTipLongPress=languageData&&languageData["long_press_to_save"]||"";
    let saveTipTap=languageData&&languageData["tap_to_save"]||"";
    currentCanvas=canvas;
    //弹窗出现的时候暂时把body内容都隐藏，等关闭弹窗再关闭，解决chrome长按不出现保存图片的问题
    $("body").css("display","none");
    $("body").css("opacity","0");
    let isChrome=navigator.userAgent.includes("Chrome");
    let htmlDialogCode=`<div style="box-sizing: border-box; width: 100vw;height:100vh;padding: 0 10vw;padding-bottom:5vh;position: fixed;left: 0;top: 0;z-index: 999;background-color: rgba(0, 0, 0, 0.8);display: flex;flex-direction: column;justify-content: center;align-items: center;">
            <div style="width: 100%;text-align: right;">
                <span style="border: 1px solid #fff;border-radius: 100%;font-size: 16px;color: white;width: 20px;position: relative;right: -13px;
                display: inline-block;height: 20px;line-height: 16px;text-align: center;" onclick='$(this).parent().parent().remove();$("body").css("display","initial");$("body").css("opacity","1");removeForbiddenUserScaleOnIOS();'>x</span>
            </div>
            <img src="${imgBase64}" style="width:100%;object-fit: contain;margin: 10px 0;max-height:65vh;touch-action:initial;" onclick="saveCanvasAndRemove('')">
            <div style="color: #eee;font-size: 13px;text-align: center;margin-top:20px;" onclick="saveCanvasAndRemove('')">${isChrome?saveTipTap:saveTipLongPress}</div>
        </div>`;
    $("html").append(htmlDialogCode)
    forbiddenUserScaleOnIOS()
}
var lastTouchEnd = 0;
var touchstart=function(event) {
    if (event.touches.length > 1) {
        event.preventDefault();
    }
}
var touchend = function(event) {
    var now = (new Date()).getTime();
    if (now - lastTouchEnd <= 300) {
        event.preventDefault();
    }
    lastTouchEnd = now;
};
var gesturestart = function(event) {
    event.preventDefault();
}
//对于iOS10以上需要以下方法来禁止用户缩放网页
function forbiddenUserScaleOnIOS() {
    document.addEventListener('touchstart', touchstart);
    document.addEventListener('touchend', touchend, false);
    document.addEventListener('gesturestart', gesturestart);
}
//弹窗关闭后移除监听避免对h5其他部分造成影响
function removeForbiddenUserScaleOnIOS() {
    document.removeEventListener('touchstart', touchstart);
    document.removeEventListener('touchend', touchend);
    document.removeEventListener('gesturestart', gesturestart);
}
//加载指定url图片，需要图片允许跨域，否则后续不能导出下载canvas
async function loadImage(url) {
    const image = new Image()
    image.setAttribute("crossOrigin",'anonymous')
    image.src = url
    return new Promise(resolve => (image.onload = () => resolve(image)))
}
//设置游戏页面顶部工具栏的position和index作为，避免一些游戏遮挡住点击事件
function setGameTopToolsZIndexAndPosition() {
   try {
    var platformViews = document.getElementsByTagName("flt-platform-view");
    platformViews[1].style.zIndex=11111111111;
    platformViews[1].children[0].style.zIndex=11111111111;
    platformViews[1].style.position='relative';
    platformViews[1].children[0].style.position='relative';
    platformViews[2].style.zIndex=11111111111;
    platformViews[2].style.position='relative';
    platformViews[2].children[0].style.zIndex=11111111111;
    platformViews[2].children[0].style.position='relative';
   } catch (error) {
    console.log('setGameTopToolsZIndexAndPosition')
    console.error(error)
   }
}