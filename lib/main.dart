import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/cubit/todo_cubit.dart';
import 'package:todo/todo/view/todo_screen.dart';

main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: TodoScreen(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final List<String> danhSachCongViecHoanThanh = [
//     'Công việc 1',
//     'Công việc 2',
//     'Công việc 3',
//   ];

//   String? selectedValue;
//   // Biến để lưu giá trị đã chọn
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Chọn Công Việc Hoàn Thành'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               DropdownButton<String>(
//                 items: danhSachCongViecHoanThanh.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   // Xử lý khi người dùng chọn một công việc đã hoàn thành
//                   setState(() {
//                     selectedValue = value;
//                   });
//                 },
//                 value: selectedValue,
//                 hint: Text('Chọn công việc hoàn thành'),
//               ),
//               if (selectedValue != null)
//                 Text('Công việc đã chọn: $selectedValue'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
