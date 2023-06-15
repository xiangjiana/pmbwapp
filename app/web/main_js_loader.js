//用于分包加载main.dart.js文件加快加载速度
var package0, package1, package2, package3;//分4个包
//加载分包内容
function loadPackage(packageName) {
    $.ajax({
        url: `./main.${packageName}.dart.js?v=${appBuildUUID}`,
        success(data) {
            switch (packageName) {
                case 'package0':
                    package0 = data;
                    break;
                case 'package1':
                    package1 = data;
                    break;
                case 'package2':
                    package2 = data;
                    break;
                case 'package3':
                    package3 = data;
                    break;

                default:
                    break;
            }
            appendMainJs();
        },
        error() {
            window.location.reload();
        }
    })
}
//合并分包内容并加载到页面
function appendMainJs() {
    if (!package0 || !package1 || !package2 || !package3) return;//需要等4个都加载完，然后按顺序拼接一起
    let mainScrpt = document.createElement("script");
    mainScrpt.text = package0 + package1 + package2 + package3;
    mainScrpt.onload=ensureScreenOrientation
    document.getElementsByTagName("head")[0].appendChild(mainScrpt)
}
if(window.location.href.startsWith("http://localhost")||window.location.href.startsWith("http://127")
||window.location.href.startsWith("http://192")||window.location.href.startsWith("http://116")
||window.location.href.startsWith("http://172")){
    //本地开发的时候没有分包
    $.ajax({
        url:"./.last_build_id?t="+new Date().getTime(),
        success(data){
            let mainScrpt = document.createElement("script");
            mainScrpt.src = "main.dart.js?t="+(data.length==32?data:new Date().getTime());
            mainScrpt.onload=ensureScreenOrientation
            document.getElementsByTagName("head")[0].appendChild(mainScrpt)
        },
        onerror(e){
            let mainScrpt = document.createElement("script");
            mainScrpt.src = "main.dart.js?t="+new Date().getTime();
            mainScrpt.onload=ensureScreenOrientation
            document.getElementsByTagName("head")[0].appendChild(mainScrpt)
        }
    })
}else{
    loadPackage("package0");
    loadPackage("package1");
    loadPackage("package2");
    loadPackage("package3");
}
//从main.dart.js文件加载完之后的1秒内保证屏幕是竖屏的，避免横屏引起的UI异常等
function ensureScreenOrientation(){
    let now=new Date()
    let timer = setInterval(()=>{
     var orientation = window.orientation;
     if (orientation == 90 || orientation == -90) {
         window.location.href=window.location.href;
     }
     if(new Date()-now>1000){
         clearInterval(timer)
     }
    },0)
}