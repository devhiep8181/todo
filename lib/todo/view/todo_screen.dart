import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/assets.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import 'package:todo/representation/screen/login/login_screen.dart';
import 'package:todo/representation/screen/setting_screen.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/view/edit_todo_screen.dart';
import 'package:todo/widget/todo_overview_filter_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        const Color(0xffE50000).withOpacity(0.13),
                        const Color.fromRGBO(21, 147, 175, 0.66)
                            .withOpacity(0.73)
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: ColorPalette.primaryColor,
                        radius: 42,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          backgroundImage:
                              AssetImage(Assets.assets_image_avatar1_png),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Hiep",
                        style: CustomStyle.itemText(context),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "abc@gmail.com",
                        style: CustomStyle.itemText(context),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person_outline,
                    color: ColorPalette.primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.account,
                    style: CustomStyle.itemText(context),
                  ),
                  onTap: () {
                    SnackBar snackBar = SnackBar(
                      content: Text(AppLocalizations.of(context)!.update),
                      backgroundColor: (Colors.black12),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  endIndent: 100,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.view_comfy_outlined,
                    color: ColorPalette.primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.statistical,
                    style: CustomStyle.itemText(context),
                  ),
                  onTap: () {
                    SnackBar snackBar = SnackBar(
                      content: Text(AppLocalizations.of(context)!.update),
                      backgroundColor: (Colors.black12),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  endIndent: 100,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings_outlined,
                    color: ColorPalette.primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.settings,
                    style: CustomStyle.itemText(context),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SettingScreen()));
                  },
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  endIndent: 100,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.power_settings_new,
                    color: ColorPalette.primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.logOut,
                    style: CustomStyle.itemText(context),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: ColorPalette.primaryColor,
                  ));
            }),
            title: Text(AppLocalizations.of(context)!.todo,
                style: CustomStyle.headingText(context)),
            centerTitle: true,
            actions: [
              const TodoOverViewFilterButton(),
              //TodoOverviewOptionButton(checkbox: checkBox),
              const SizedBox(width: 4),
              PopupMenuButton<int>(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      AppLocalizations.of(context)!.makeAllCmp,
                      style: CustomStyle.titleText(context),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      AppLocalizations.of(context)!.clearCmp,
                      style: CustomStyle.titleText(context),
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      // context.read<TodoCubit>().checkAllBox(checkBox);
                      setState(() {
                        checkBox = !checkBox;
                        for (var element in state.todos) {
                          element.isCompleted = checkBox;
                        }
                      });
                      break;
                    case 2:
                      context.read<TodoCubit>().removeAll();
                      break;
                  }
                },
                icon: Icon(
                  Icons.more_horiz,
                  color: ColorPalette.primaryColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(Assets.assets_image_frame1_png),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: state.todos.length,
                      itemBuilder: (_, index) {
                        return Dismissible(
                            key: UniqueKey(),
                            direction:
                                DismissDirection.endToStart, //right to left
                            onDismissed: (direction) {
                              context
                                  .read<TodoCubit>()
                                  .removeTodo(state.todos[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorPalette.itemColor,
                                ),
                                child: ListTile(
                                  leading: Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      activeColor: Colors.white,
                                      checkColor: Colors.green,
                                      value: state.todos[index].isCompleted,
                                      onChanged: (newValue) {
                                        setState(() {
                                          state.todos[index].isCompleted =
                                              newValue;
                                        });
                                      }),
                                  title: Text(
                                    state.todos[index].title!,
                                    style:
                                        state.todos[index].isCompleted == true
                                            ? const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough)
                                            : CustomStyle.itemText(context),
                                  ),
                                  subtitle: Text(
                                    state.todos[index].subTitle!,
                                    style:
                                        state.todos[index].isCompleted == true
                                            ? const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough)
                                            : CustomStyle.subText(context),
                                  ),
                                  onTap: () async {
                                    await Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => EditTodoScreen(
                                                  todo: state.todos[index],
                                                  index: index,
                                                  editTodo: context
                                                      .read<TodoCubit>()
                                                      .editTodo,
                                                )));
                                  },
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
