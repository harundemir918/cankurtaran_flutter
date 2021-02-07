import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class CallForHelpPanel extends StatefulWidget {
  static const routeName = '/call-for-help-panel';

  @override
  _CallForHelpPanelState createState() => _CallForHelpPanelState();
}

class _CallForHelpPanelState extends State<CallForHelpPanel> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  playLocal() {
    assetsAudioPlayer.open(
      Audio('assets/sounds/alarm_clock.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Yardım Çağır'),
        onPressed: playLocal,
      ),
    );
  }
}
