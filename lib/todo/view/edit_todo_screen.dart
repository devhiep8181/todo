import 'package:flutter/material.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/representation/screen/home.dart';
import 'package:todo/todo/model/todo_model.dart';
import '../../core/constants/color_palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTodoScreen extends StatefulWidget {
  final void Function(int index, TodoModel todo) editTodo;
  final TodoModel todo;
  final int index;
  const EditTodoScreen(
      {super.key,
      required this.todo,
      required this.index,
      required this.editTodo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _subTitle = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _title.text = widget.todo.title!;
    _subTitle.text = widget.todo.subTitle!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.editTodo,
            style: CustomStyle.headingText(context),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
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
                      hintText: widget.todo.title,
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
                    controller: _subTitle,
                    decoration: InputDecoration(
                      hintText: widget.todo.subTitle,
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
                              final todos = TodoModel(
                                  id: widget.todo.id,
                                  title: _title.text,
                                  subTitle: _subTitle.text);
                              widget.editTodo.call(widget.index, todos);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => HomeScreen()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.edit,
                              style: CustomStyle.buttonText(context),
                            )),
                      ),
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
