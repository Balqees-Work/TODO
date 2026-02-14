import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_bal/presentation/bloc/todo_bloc.dart';
import 'package:todo_bal/presentation/page/page_todo.dart';

class AppRoutes {
  static String pathHome = '/';
  static String nameHome = 'home';

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        name: nameHome,
        path: pathHome,
        builder: (context, state) => BlocProvider(
          create: (context) => TodoBloc()..add(LoadTodoStarted()),
          child: const PageTodo(),
        ),
        routes: [
          // children
          GoRoute(
            path: '/details',
            builder: (context, state) => BlocProvider.value(
              // TODO: extra data
              value: context.read<TodoBloc>(),
              child: const PageTodo(),
            ),
          ),
        ],
      ),
    ],
  );
}
