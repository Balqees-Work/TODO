import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_bal/domain/enitiy/to_do_entity.dart';
import 'package:todo_bal/presentation/feature/to_do_details_page/to_do_details_page.dart';
import 'package:todo_bal/presentation/feature/to_do_page/bloc/todo_bloc.dart';
import 'package:todo_bal/presentation/feature/to_do_page/page/page_todo.dart';

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
          // GoRoute(
          //   path: '/details',
          //   builder: (context, state) => BlocProvider.value(
          //     // TODO: extra data
          //     value: context.read<TodoBloc>(),
          //     child: const ToDoDetailsPage(todo: ),
          //   ),
          // ),
          GoRoute(
            path: '/details',
            builder: (context, state) {
              final todo = state.extra as ToDoListEntity;
              return ToDoDetailsPage(todo: todo);
            },
          ),
        ],
      ),
    ],
  );
}
