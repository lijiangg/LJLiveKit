
import 'package:live_flutter_plugin/v2_tx_live_def.dart';
import 'package:live_flutter_plugin/v2_tx_live_premier.dart';
import 'package:live_flutter_plugin/v2_tx_live_pusher.dart';

class LJLiveManager {
  static final LJLiveManager _manager = LJLiveManager._private();
  LJLiveManager._private();
  factory LJLiveManager() {
    return _manager;
  }

  /// 腾讯云License管理页面(https://console.cloud.tencent.com/live/license)
  /*
  * licenseUrl 当前应用的License
  * licenseUrlKey 当前应用的License Key
  * LJLiveAgreement 协议类型
  * */
  config({required String licenseUrl, required String licenseUrlKey}) {
    V2TXLivePremier.setLicence(licenseUrl, licenseUrlKey);
  }



}