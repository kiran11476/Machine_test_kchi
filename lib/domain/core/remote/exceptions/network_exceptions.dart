import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.appServerException(
      [@Default(false) bool success,
      @Default('API ERROR') String message]) = AppServerException;
  const factory NetworkExceptions.notFound(
      [@Default('Something you are looking for not found')
          String message]) = NotFound;
  const factory NetworkExceptions.internalServerError(
      [@Default('Internal server error') String message]) = InternalServerError;
  const factory NetworkExceptions.unKnownError(
      [@Default('Unknown error occured') String message]) = UnKnownError;
  const factory NetworkExceptions.noInternet(
      [@Default('Network unavailable') String message]) = NoInternet;
  const factory NetworkExceptions.noDefaultPinCode(
      [@Default('Pincode unavailable') String message]) = NoDefaultPinCode;
}

NetworkExceptions getExceptionFromStatusCode(int? code) {
  final exceptionsMap = {
    404: const NetworkExceptions.notFound(),
    500: const NetworkExceptions.internalServerError(),
  };
  if (exceptionsMap.containsKey(code)) {
    return exceptionsMap[code]!;
  } else {
    return const NetworkExceptions.unKnownError();
  }
}

String getMessageFromException(NetworkExceptions exception) {
  return exception.map(
    appServerException: (v) => v.message,
    notFound: (v) => v.message,
    internalServerError: (v) => v.message,
    unKnownError: (v) => v.message,
    noInternet: (v) => v.message,
    noDefaultPinCode: (v) => v.message,
  );
}
