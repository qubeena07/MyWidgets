import 'package:my_widgets/constants/status.dart';

class GenericState<T> {
  Status status;
  T data;
  String errorMessage;

  GenericState({
    required this.status,
    required this.data,
    required this.errorMessage,
  });

  factory GenericState.loading(T initialValue) => GenericState(
      status: Status.loading, data: initialValue, errorMessage: "");

  GenericState<T> copyWith({
    Status? status,
    T? data,
    String? errorMessage,
  }) {
    return GenericState<T>(
        status: status ?? this.status,
        data: data ?? this.data,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
