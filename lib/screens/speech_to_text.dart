import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:speech_to_text/speech_recognition_result.dart';

class SpeechTpTextScreen extends StatefulWidget {
  const SpeechTpTextScreen({super.key});

  @override
  State<SpeechTpTextScreen> createState() => _SpeechTpTextScreenState();
}

class _SpeechTpTextScreenState extends State<SpeechTpTextScreen> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _lastWords = "";

  @override
  void initState() {
    _initSpeech();
    super.initState();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);

    setState(() {});
    _lastWords = "";
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
    // _lastWords = "";
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                // If listening is active show the recognized words

                // If listening isn't active but could be tell the user
                // how to start it, otherwise indicate that speech
                // recognition is not yet ready or not supported on
                // the target device
                _speechEnabled
                    ? 'Tap the microphone to start listening...'
                    : 'Speech not available',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              _speechToText.isListening
                  ? _lastWords
                  : _lastWords.toUpperCase().toString(),
              style: const TextStyle(fontSize: 20, color: Colors.green),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            _speechToText.isNotListening ? Colors.red : Colors.green,
        onPressed:
            // If not yet listening for speech start, otherwise stop
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
