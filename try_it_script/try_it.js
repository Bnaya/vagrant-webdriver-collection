const webdriver = require("selenium-webdriver");
const firefoxStuff = require("selenium-webdriver/firefox");
// const open = require("open");
const fs = require("fs");

const prefs = new webdriver.logging.Preferences();
prefs.setLevel(webdriver.logging.Type.DRIVER, webdriver.logging.Level.ALL);
prefs.setLevel(webdriver.logging.Type.BROWSER, webdriver.logging.Level.ALL);
prefs.setLevel(webdriver.logging.Type.CLIENT, webdriver.logging.Level.ALL);
prefs.setLevel(webdriver.logging.Type.SERVER, webdriver.logging.Level.ALL);


let ffOpts = new firefoxStuff.Options();
ffOpts = ffOpts
    .headless()
    .setPreference("devtools.debugger.remote-enabled", true)
    .setPreference("devtools.debugger.force-local", false)
    .setPreference("devtools.debugger.remote-host", "0.0.0.0")
    .setPreference("devtools.debugger.prompt-connection", false)
    .setPreference("devtools.chrome.enabled", true)
    .addArguments("--start-debugger-server", "3456")
    // .windowSize({
    //     width: 1366,
    //     height: 680
    // });

let builder = new webdriver.Builder()
    .forBrowser(webdriver.Browser.EDGE)
    // .forBrowser(webdriver.Browser.CHROME)
    // .forBrowser(webdriver.Browser.SAFARI)
    .setFirefoxOptions(ffOpts)
    // .usingServer('http://localhost:5444/wd/hub');
    .usingServer('http://localhost:6444/wd/hub');

    const c = builder.getCapabilities();

    builder.withCapabilities(c);

    const driver = builder.build();


driver.get('https://google.com').then(function () {
}).then(function () {
    console.log("Navigate completed");
})
.then(function () {
    return driver.getTitle();
})
.then((resp) => {
    console.log(resp)
})
.then(function () {
    console.log("Done!");
})
.then(function () {
    return driver.quit();
}, (error) => {
    console.error(error);
    return driver.quit();
});

/**
 *
 * @param {number} time
 *
 * @returns {Promise<void>}
 */
function sleep(time) {
    return new Promise(res => {
      setTimeout(res, time);
    });
  }
