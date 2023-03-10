import 'package:li_live_kit/live/lj_live_define.dart';
import 'package:live_flutter_plugin/v2_tx_live_player.dart';

class LJLivePlayController {

  V2TXLivePlayer player = V2TXLivePlayer();

  bindRenderView(int viewId) {
    player.setRenderViewID(viewId);
  }

  /// 开始拉流
  startLivePlay() async {
    // 生成拉流url RTMP/TRTC/Led
    var url = "";
    // 开始拉流
    await player?.startLivePlay(url);
  }

  /// 暂停播放
  pause() {
    player.pauseAudio();
    player.pauseVideo();
  }

  /// 继续播放
  resume() {
    player.resumeAudio();
    player.resumeVideo();
  }

  /// 结束播放
  stop() {
    player.stopPlay();
  }

  re(LJLivePlayMode mode) async {
    bool isPlaying = await player.isPlaying() == 1;
    if (isPlaying) {
      pause();
    }
    /// 自动模式
    player.setCacheParams(1, 5);
    /// 极速模式
    player.setCacheParams(1, 1);
    /// 流畅模式
    player.setCacheParams(5, 5);
    resume();
  }
}