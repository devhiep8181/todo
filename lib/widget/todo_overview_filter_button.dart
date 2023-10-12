import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants/color_palette.dart';
import 'package:todo/core/constants/text_style.dart';
import '../todo/cubit/todo_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoOverViewFilterButton extends StatefulWidget {
  const TodoOverViewFilterButton({super.key});

  @override
  State<TodoOverViewFilterButton> createState() =>
      _TodoOverViewFilterButtonState();
}

class _TodoOverViewFilterButtonState extends State<TodoOverViewFilterButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Filter>(
      itemBuilder: (BuildContext cnt) => [
        PopupMenuItem(
          value: Filter.active,
          child: Text(
            AppLocalizations.of(context)!.active,
            style: CustomStyle.titleText(context),
          ),
        ),
        PopupMenuItem(
          value: Filter.complete,
          child: Text(AppLocalizations.of(context)!.complete,
              style: CustomStyle.titleText(context)),
        ),
        PopupMenuItem(
          value: Filter.all,
          child: Text(AppLocalizations.of(context)!.all,
              style: CustomStyle.titleText(context)),
        ),
      ],
      icon: Icon(
        Icons.format_list_bulleted,
        color: ColorPalette.primaryColor.withOpacity(0.7),
      ),
      onSelected: (Filter value) {
        context.read<TodoCubit>().setFilter(value);
      },
    );
  }
}
