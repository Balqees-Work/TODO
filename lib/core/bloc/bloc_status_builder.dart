import 'package:flutter/material.dart';
import 'package:todo_bal/core/bloc/bloc_base_status.dart';

typedef SuccessBuilder<S> = Widget Function(BuildContext context);

class BlocStatusBuilder<S extends BlocBaseStatus> extends StatelessWidget {
  final S state;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final SuccessBuilder builder;

  const BlocStatusBuilder({
    super.key,
    required this.state,
    required this.builder,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state.status) {
      .loading =>
        loadingWidget ?? const Center(child: CircularProgressIndicator()),
      .error =>
        errorWidget ??
            Center(child: Text(state.errorMessage ?? 'An error occurred')),
      .success => builder(context),
      _ => const SizedBox.shrink(),
    };
  }
}
