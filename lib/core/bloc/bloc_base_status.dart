import 'package:equatable/equatable.dart';

enum AppStatus { initial, loading, success, error }

abstract class BlocBaseStatus extends Equatable {
  final AppStatus status;
  final String? errorMessage;

  const BlocBaseStatus({this.status = AppStatus.initial, this.errorMessage});

  @override
  List<Object?> get props => [status, errorMessage];
}
