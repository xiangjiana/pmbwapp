var Status={
  loaded:0,
  ready:1,
  success:2,
  close:3,
  error:-1,
  serverError:-2,
}

window.onload = () => {
  window.parent.postMessage({ code: Status.loaded },"*");
}
window.parent.setHttpConfig = (config) => {
 // new Http().setConfig(config);
  new ObWebCaptcha().init();
}

class ObWebCaptcha {
  constructor() {
    this._instance = null;
  }

  async init() {
    try {
      //const res = await new Http().firstRegister();
      window.parent.postMessage({ firstRegister: 1 },"*");
      window.parent.firstRegisterSuccess=(res)=>{
        res=JSON.parse(res)
        initGeetest({
          gt: res.gt,
          challenge: res.challenge,
          offline: res.success != 1,
          new_captcha: true,
          product: 'bind',
        }, (instance) => {
          this._instance = instance;
          this._instance.appendTo("#gt-captcha");
          this._instance.onReady(() => this.onReady());
          this._instance.onSuccess(() => this.onSuccess());
          this._instance.onError(() => this.onError());
          this._instance.onClose(() => this.onClose());
        });
      }
      
      window.parent.firstRegisterFail=(res)=>{
        window.parent.postMessage({ code: Status.serverError },"*");
      }
    } catch (e) {
      console.error(e);
      window.parent.postMessage({ code: Status.serverError },"*");
    }
  }

  onReady() {
    this._instance.verify();
    window.parent.postMessage({ code: Status.ready },"*");
  }

  async onSuccess() {
    //这个secondValidate接口有需要加密的post参数所以交给flutter去调用，省去js端的加密逻辑
    const result = this._instance.getValidate();
    window.parent.postMessage({ result: JSON.stringify(result) },"*");
    // try {
    //   const result = this._instance.getValidate();
    //   await new Http().secondValidate({
    //     challenge: result.geetest_challenge,
    //     validate: result.geetest_validate,
    //     seccode: result.geetest_seccode,
    //   });
    //   this._instance.destroy();
    //   window.parent.postMessage({ code: Status.success },"*");
    // } catch (e) {
    //   console.error(e);
    //   window.parent.postMessage({ code: Status.serverError },"*");
    // }
  }

  onError() {
    window.parent.postMessage({ code: Status.error },"*");
  }

  onClose() {
    window.parent.postMessage({ code: Status.close },"*");
  }
}