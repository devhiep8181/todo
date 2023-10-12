import 'package:flutter/material.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/representation/screen/home.dart';
import 'package:todo/todo/model/todo_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class AddTodoScreen extends StatefulWidget {
  void Function(TodoModel) addTodo;
  AddTodoScreen({super.key, required this.addTodo});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subtitle = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode =
      FocusNode(); //khai bao de tat ban phim khi nhap xong
  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _subtitle.dispose();
    _focusNode.dispose();
    _focusNode1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.addTodo,
            style: CustomStyle.headingText(context),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(Assets.assets_image_frame1_png)),
                  const SizedBox(height: 32),
                  Text(
                    AppLocalizations.of(context)!.title,
                    style: CustomStyle.titleText(context),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _title,
                    focusNode: _focusNode1,
                    onFieldSubmitted: (value) {
                      _focusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: ColorPalette.primaryColor),
                      ),
                      hintText: AppLocalizations.of(context)!.enterTitle,
                      hintStyle: CustomStyle.hiddenText(context),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context)!.description,
                    style: CustomStyle.titleText(context),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _subtitle,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.enterDes,
                      hintStyle: CustomStyle.hiddenText(context),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: ColorPalette.primaryColor),
                      ),
                    ),
                    focusNode: _focusNode,
                    onFieldSubmitted: (value) {
                      _focusNode.unfocus(); // tu tat ban phim
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 106,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                backgroundColor: ColorPalette.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {
                              final todo = TodoModel(
                                  title: _title.text,
                                  subTitle: _subtitle.text,
                                  id: const Uuid().v4());
                              widget.addTodo.call(todo);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomeScreen()));
                            },
                            child: Text(AppLocalizations.of(context)!.add,
                                style: CustomStyle.buttonText(context))),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 106,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomeScreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.cancel,
                              style: CustomStyle.buttonText(context),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
