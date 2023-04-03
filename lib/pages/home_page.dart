import 'package:dart_openai/openai.dart';
import 'package:fablab_helper/logic/compose.dart';
import 'package:fablab_helper/utils/layout.dart';
import 'package:fablab_helper/widgets/app_bar.dart';
import 'package:fablab_helper/widgets/selection_chip.dart';
import 'package:fablab_helper/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, bool> _main = {
    'Idea': false,
    'Software': false,
    'Prototype': false,
  };

  final Map<String, bool> _machines = {
    '3D Printer': false,
    'Laser Cutter': false,
    'CNC Mill': false,
    'Vinyl Cutter': false,
    'Sewing Machine': false,
    'Embroidery Machine': false,
    'Soldering Station': false,
    'Oscilloscope': false,
    'Multimeter': false,
    'Logic Analyzer': false,
  };

  String? _notes;

  bool _isLoading = false;

  Future<OpenAIChatCompletionModel> chatCompletion({
    required String content,
  }) async {
    // Secret key
    OpenAI.apiKey = '<key>';

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: content,
          role: 'user',
        ),
      ],
    );

    return chatCompletion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kGapLarge,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const FabLabAppBar(),
                const SizedBox(height: kGapMedium),
                SelectionChipFabLab(
                  title: 'What do you want to do?',
                  data: _main,
                  onSelected: (_) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: kGapLarge),
                SelectionChipFabLab(
                    title: 'Which machines do you need?',
                    data: _machines,
                    onSelected: (_) {
                      setState(() {});
                    }),
                const SizedBox(height: kGapLarge),
                TextFieldFabLab(
                  onChanged: (String value) {
                    setState(() {
                      _notes = value;
                    });
                  },
                ),
                const SizedBox(height: kGapLarge),
                OutlinedButton(
                  onPressed: !_isLoading
                      ? () async {
                          final prompt = Compose(
                            main: _main,
                            machines: _machines,
                            notes: _notes,
                          ).buildPrompt();

                          debugPrint(prompt);

                          setState(() {
                            _isLoading = true;
                          });

                          final output = await chatCompletion(
                            content: prompt,
                          );

                          setState(() {
                            _isLoading = false;
                          });

                          if (mounted) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoActionSheet(
                                  title: const Text('FabLab Helper • Response'),
                                  message: Text(
                                    output.choices.first.message.content,
                                  ),
                                  cancelButton: CupertinoActionSheetAction(
                                    child: const Text('Back'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        }
                      : null,
                  child: Center(
                    child: !_isLoading
                        ? const Text(
                            'Send',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const SizedBox(
                            height: kGapMedium,
                            width: kGapMedium,
                            child: CircularProgressIndicator(
                              strokeWidth: kGapTiny,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: kGapLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
