
import 'package:li_live_kit/live/lj_live_define.dart';
import 'package:live_flutter_plugin/manager/tx_audio_effect_manager.dart';
import 'package:live_flutter_plugin/manager/tx_beauty_manager.dart';
import 'package:live_flutter_plugin/manager/tx_device_manager.dart';
import 'package:live_flutter_plugin/v2_tx_live_code.dart';
import 'package:live_flutter_plugin/v2_tx_live_def.dart';
import 'package:live_flutter_plugin/v2_tx_live_pusher.dart';
import 'package:live_flutter_plugin/v2_tx_live_code.dart';
import 'package:live_flutter_plugin/v2_tx_live_pusher_observer.dart';
class LJLivePushController {
  LJLivePushController({V2TXLiveMode mode = V2TXLiveMode.v2TXLiveModeRTMP}) {
    push = V2TXLivePusher(mode);
  }
  late V2TXLivePusher push;

  /// 美颜管理
  TXBeautyManager get beautyManager => push.getBeautyManager();
  /// 设备管理
  TXDeviceManager get deviceManager => push.getDeviceManager();
  /// 音效管理
  TXAudioEffectManager get audioEffectManager => push.getAudioEffectManager();

  /// 绑定widget
  bindRenderView(int viewId) {
    push.setRenderViewID(viewId);
  }

  /// 设置画面清晰度 横竖屏等
  setVideoQuality(V2TXLiveVideoEncoderParam videoEncoderParam) {
    push.setVideoQuality(videoEncoderParam);
  }

  /// 摄像头镜像类型
  setRenderMirror(V2TXLiveMirrorType mirrorType) {
    push.setRenderMirror(mirrorType);
  }

  /// 开始推流
  startPush({bool isFrontCamera = true, isCameraEnabled = true}) async {
    // 生成推流地址 RTMP/TRTC
    var url = "";
    // 开始推流
    await push.startPush(url);
    // 打开麦克风
    await push.startMicrophone();
    //打开摄像头
    if (isCameraEnabled) {
      await push.startCamera(isFrontCamera);
    }
  }

  /// 停止推流
  stopPush() async {
    // 关闭摄像头
    await push.stopCamera();
    // 关闭麦克风
    await push.stopMicrophone();
    // 停止推流
    await push.stopPush();
  }

}

