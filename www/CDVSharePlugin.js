/**
 * Created by njupt on 7/14/15.
 */

  share = function(types, onHelloSuccess, onHelloFail) {
      return cordova.exec(onHelloSuccess, onHelloFail, "CDVSharePlugin", "share", types);
  };