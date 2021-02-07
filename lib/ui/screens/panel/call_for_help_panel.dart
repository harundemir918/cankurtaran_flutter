import 'package:cankurtaran/api/api.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class CallForHelpPanel extends StatefulWidget {
  static const routeName = '/call-for-help-panel';

  @override
  _CallForHelpPanelState createState() => _CallForHelpPanelState();
}

class _CallForHelpPanelState extends State<CallForHelpPanel> {
  Api api = Api();
  final assetsAudioPlayer = AssetsAudioPlayer();

  playLocal() {
    assetsAudioPlayer.open(
      Audio('assets/sounds/alarm_clock.mp3'),
    );
  }

  _sendMessage() async {
    await api.sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Yardım Çağır'),
          onPressed: () async {
            await _sendMessage();
            final snackBar = SnackBar(content: Text('Yardım mesajı gönderildi.'));

            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
        ElevatedButton(
          child: Text('Deprem Düdüğü'),
          onPressed: playLocal,
        ),
      ],
    );
  }
}
