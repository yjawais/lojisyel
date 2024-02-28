import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MorseCodeConverter extends StatefulWidget {
  const MorseCodeConverter({Key? key}) : super(key: key);

  @override
  _MorseCodeConverterState createState() => _MorseCodeConverterState();
}

class _MorseCodeConverterState extends State<MorseCodeConverter> {
  static const _morseAlphabet = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '0': '-----',
    '   ': '/',
  };

  String _input = '';
  String _output = '';

  String _morseToText(String morse) {
    var tokens = morse.trim().split(' ');

    return tokens.map((token) {
      if (token == '') {
        return '   '; // 3 spaces for word break
      } else {
        return _morseAlphabet.keys
            .firstWhere((letter) => _morseAlphabet[letter] == token);
      }
    }).join(' '); // Join letters with single spaces
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morse Code Converter'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  label: Text("Input"),
                  border: OutlineInputBorder(),
                  hintText: 'Enter morse code to convert to text',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[^-\./ ]'))
                ],
                onChanged: (morse) {
                  setState(() {
                    _input = morse;
                    _output = _morseToText(_input);
                  });
                },
              ),
              const SizedBox(height: 100),
              const Text("Output"),
              const SizedBox(height: 10),
              Text(_output),
            ],
          ),
        ),
      ),
    );
  }
}
