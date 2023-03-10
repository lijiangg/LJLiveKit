
import 'package:flutter/cupertino.dart';
import 'package:li_live_kit/live/lj_live_manager.dart';
import 'package:li_live_kit/live/lj_live_play_controller.dart';
import 'package:li_live_kit/live/lj_live_video_vm.dart';
import 'package:live_flutter_plugin/v2_tx_live_def.dart';
import 'package:live_flutter_plugin/v2_tx_live_pusher.dart';
import 'package:live_flutter_plugin/widget/v2_tx_live_video_widget.dart';
import 'lj_live_define.dart';
import 'lj_live_push_controller.dart';
class LJLiveVideoWidget extends StatefulWidget {
  final LJLivePushController? pushController;
  final LJLivePlayController? playController;
  const LJLiveVideoWidget({Key? key, this.pushController, this.playController}) : super(key: key);

  @override
  State<LJLiveVideoWidget> createState() => _LJLiveVideoWidgetState();
}

class _LJLiveVideoWidgetState extends State<LJLiveVideoWidget> {
  LJLiveVideoViewModel _viewModel = LJLiveVideoViewModel();
  late LJLivePushController _pushController;
  late LJLivePlayController _playController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.pushController != null) {
      _pushController = widget.pushController!;
    } else if (widget.playController != null) {
      _playController = widget.playController!;
    }

  }
  @override
  Widget build(BuildContext context) {
    return V2TXLiveVideoWidget(
      onViewCreated: (viewId) async {
        if (_pushController != null) {
          _pushController.bindRenderView(viewId);
          _pushController.startPush();
        } else if (widget.playController != null) {
          _playController.bindRenderView(viewId);
          _playController.startLivePlay();
        }
      },
    );
  }
}
