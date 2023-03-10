import 'package:flutter/material.dart';
import 'package:li_live_kit/live/lj_live_kit.dart';

class LJLivePageDemo extends StatefulWidget {
  const LJLivePageDemo({Key? key}) : super(key: key);

  @override
  State<LJLivePageDemo> createState() => _LJLivePageDemoState();
}

class _LJLivePageDemoState extends State<LJLivePageDemo> {
  LJLivePushController _pushController = LJLivePushController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LJLiveVideoWidget(
              pushController: _pushController,
            ),
          ),
          Wrap(
            children: [
              TextButton(
                  onPressed: () {
                    _pushController.beautyManager
                        .setBeautyStyle(TXBeautyStyle.tXBeautyStyleSmooth);
                  },
                  child: Text("光滑")),
              TextButton(
                  onPressed: () {
                    _pushController.beautyManager
                        .setBeautyStyle(TXBeautyStyle.tXBeautyStyleNature);
                  },
                  child: Text("自然")),
              TextButton(
                  onPressed: () {
                    _pushController.beautyManager
                        .setBeautyStyle(TXBeautyStyle.tXBeautyStylePitu);
                  },
                  child: Text("优图")),
              TextButton(
                  onPressed: () {
                    _pushController.deviceManager.switchCamera(false);
                  },
                  child: Text("后置摄像头")),
              TextButton(
                  onPressed: () {
                    _pushController.deviceManager.switchCamera(true);
                  },
                  child: Text("前置摄像头")),
            ],
          )
        ],
      ),
    );
  }
}
