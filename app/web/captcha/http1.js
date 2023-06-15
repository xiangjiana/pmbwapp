class Http {
  setConfig(config) {
    const _config = JSON.parse(config);
    axios.defaults.baseURL = _config.baseUrl;
    axios.defaults.headers.common['merchant-id'] = _config.merchantId;
    axios.defaults.headers.common['ob-application'] = 2;
    axios.defaults.headers.common['ob-client'] = new Tools().isiOS() ? 3 : 4; // 3-IOS_H5，4-Android_H5
    axios.defaults.headers.common['ob-timestamp'] = new Date().getTime();
    axios.defaults.headers.common['ob-nonce'] = new Tools().generateRandomDigits(18);
    axios.defaults.headers.common['ob-encrypted'] = _config.crypto_switch;
    axios.defaults.headers.common['ob-secret-version'] = 1;
  }

  async firstRegister() {
    const res = await axios.post('/client-server/geetest/firstRegister');
    return JSON.parse(res.data.data);
  }

  async secondValidate(data) {
    const res = await axios.post('/client-server/geetest/secondValidate', data);
    return res.data;
  }
}

