import 'package:denari_app/utils/log/logging.dart';
import 'package:denari_app/utils/network/exceptions/api_error.dart';

final class UseCase {
  static Future<Result<R>> handle<R>(Future<R> Function() request) async {
    R? result;
    String? error;
    try {
      result = await request.call();
    } on ConnectionError catch (e, st) {
      error = 'Connection error';
      logger.error(error, e, st);
    } on ApiError catch (e, st) {
      error = e.message;
      logger.error(error, e, st);
    } catch (e, st) {
      error = 'Error processing response when receiving $R';
      logger.error(error, e, st);
    }
    return Result<R>(data: result, error: error);
  }
}

class Result<R> {
  final R? data;
  final String? error;

  Result({required this.data, required this.error});


}