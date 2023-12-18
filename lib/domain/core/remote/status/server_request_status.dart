import 'package:freezed_annotation/freezed_annotation.dart';
part 'server_request_status.freezed.dart';

@freezed
class ServerRequestStatus<T> with _$ServerRequestStatus<T> {
  const factory ServerRequestStatus.idle() = Idle;
  const factory ServerRequestStatus.loading(
      [@Default('Loading') String messgae]) = Loading;
  const factory ServerRequestStatus.success(T data) = Success<T>;
  const factory ServerRequestStatus.failed(
      [@Default('Failed') String messgae]) = Failed;
}
