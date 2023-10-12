import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/core/language/cubit/change_language_cubit.dart';
import 'package:todo/representation/screen/setting_screen.dart';
import 'package:todo/representation/screen/test.dart';
import 'package:todo/todo/view/todo_screen.dart';

import '../../todo/cubit/todo_cubit.dart';
import '../../todo/view/add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.nameAccount, this.emailAcount});
  String? nameAccount;
  String? emailAcount;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final PageController _myPageView = PageController(initialPage: 0);
  bool isIconPressed = true;
  // final TextEditingController _nameAccount = TextEditingController();
  // final TextEditingController _emailAccount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: PageView(
            controller: _myPageView,
            children: const [
              TodoScreen(),
              SettingScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddTodoScreen(
                      addTodo: context.read<TodoCubit>().addTodo)));
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: ColorPalette.itemColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _myPageView.jumpToPage(0);
                        isIconPressed = !isIconPressed;
                      });
                    },
                    icon: Icon(Icons.home,
                        color: isIconPressed
                            ? ColorPalette.primaryColor.withOpacity(0.7)
                            : Colors.black.withOpacity(0.6))),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _myPageView.jumpToPage(1);
                        isIconPressed = !isIconPressed;
                      });
                    },
                    icon: Icon(
                      Icons.settings,
                      color: isIconPressed
                          ? Colors.black.withOpacity(0.6)
                          : ColorPalette.primaryColor.withOpacity(0.7),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
