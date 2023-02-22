import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gtranslation_clone/cubits/first_button/first_but_changer_cubit.dart';
import 'package:gtranslation_clone/cubits/second_button/second_button_cubit.dart';
import 'package:gtranslation_clone/service/api_service.dart';
import 'package:gtranslation_clone/service/hive_service.dart';
import 'package:gtranslation_clone/ui/home_screen/widgets/action_circle_but.dart';
import 'package:gtranslation_clone/ui/home_screen/widgets/change_lan_but.dart';
import 'package:gtranslation_clone/utils/colors.dart';
import 'package:gtranslation_clone/utils/helper.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'widgets/lan_searcher_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _translatedController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _textController.text = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    var readFirstBut = context.read<FirstButChangerCubit>();
    var readSecondBut = context.read<SecondButtonCubit>();
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60.0,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: 'Google',
              style: textStyle.headline3!.copyWith(
                color: GTranslationColors.black,
              ),
              children: [
                TextSpan(
                  text: ' Translate',
                  style: textStyle.headline3!.copyWith(
                    fontSize: 18.0,
                    color: GTranslationColors.C_C3D3E5,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                style: textStyle.headline4!.copyWith(
                  fontSize: 24.0,
                  color: GTranslationColors.white,
                ),
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    _translatedController.text =
                        await ApiService().tryToTranslate(
                      firstLanguage: readFirstBut.language['code']!,
                      secondLanguage: readSecondBut.language['code']!,
                      word: value,
                    );
                    setState(() {});
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  hintStyle: textStyle.headline4,
                  border: InputBorder.none,
                ),
                maxLength: null,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: false,
                controller: _translatedController,
                style: textStyle.headline4!.copyWith(
                  fontSize: 24.0,
                  color: GTranslationColors.white,
                ),
                showCursor: false,
                decoration: InputDecoration(
                  hintStyle: textStyle.headline4,
                  border: InputBorder.none,
                ),
                maxLength: null,
                maxLines: null,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: GTranslationColors.C_C3D3E5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () async {
                if (_translatedController.text.isEmpty) {
                  await Fluttertoast.showToast(
                    msg: 'Text is empty',
                    backgroundColor: GTranslationColors.C_98A8BA,
                  );
                  return;
                }
                await HiveService.instance
                    .putData(
                      firstLan: _textController.text,
                      secondLan: _translatedController.text,
                    )
                    .then(
                      (value) async => await Fluttertoast.showToast(
                        msg: 'Text is saved',
                        backgroundColor: GTranslationColors.C_98A8BA,
                      ),
                    );
              },
              child: Text(
                'Save text',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: GTranslationColors.black,
                      fontSize: 14.0,
                    ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: GTranslationColors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocBuilder<FirstButChangerCubit, FirstButChangerState>(
                        builder: (context, state) {
                          return ChangeLanButton(
                            textStyle: textStyle,
                            onTap: () {
                              Helper.whichButtonTapped = 1;
                              _focusNode.unfocus();
                              showSearch(
                                context: context,
                                delegate: LanSearcher(),
                              );
                            },
                            textButon: (state is FirstButChangerInitial)
                                ? readFirstBut.language['lan']!
                                : '',
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          var secondLanCode = readSecondBut.language['code']!;
                          readSecondBut.language['code'] =
                              readFirstBut.language['code']!;
                          readFirstBut.language['code'] = secondLanCode;
                          var secondLan = readSecondBut.language['lan']!;
                          readSecondBut.language['lan'] =
                              readFirstBut.language['lan']!;
                          readFirstBut.language['lan'] = secondLan;
                        }),
                        icon: const Icon(
                          Icons.compare_arrows_outlined,
                        ),
                      ),
                      BlocBuilder<SecondButtonCubit, SecondButtonState>(
                        builder: (context, state) {
                          return ChangeLanButton(
                            textStyle: textStyle,
                            onTap: () {
                              Helper.whichButtonTapped = 2;
                              _focusNode.unfocus();
                              showSearch(
                                context: context,
                                delegate: LanSearcher(),
                              );
                            },
                            textButon: (state is SecondButtonInitial)
                                ? readSecondBut.language['lan']!
                                : '',
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionCircleButton(
                        onTap: () async {
                          Navigator.pushNamed(context, '/saved_screen');
                        },
                        icon: Icons.bookmark,
                        padding: 15.0,
                      ),
                      ActionCircleButton(
                        onTap: _speechToText.isNotListening
                            ? _startListening
                            : _stopListening,
                        icon: _speechToText.isNotListening
                            ? Icons.mic_off
                            : Icons.mic,
                        padding: 25.0,
                      ),
                      ActionCircleButton(
                        onTap: () async => await Fluttertoast.showToast(
                          msg: 'Sorry not working',
                          backgroundColor: GTranslationColors.C_98A8BA,
                        ),
                        icon: Icons.history_outlined,
                        padding: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
