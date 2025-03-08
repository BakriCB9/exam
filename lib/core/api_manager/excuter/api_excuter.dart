



import 'package:dio/dio.dart';
import 'package:exam_app/core/api_manager/api_result.dart';

Future<ApiResult<T>> excuteApi<T>( Future<T> Function() apiCall)
async{
try {
  var result = await apiCall.call();
  return SuccessApiResult(result);
}
  on DioException catch(ex)
  {

return ErrorApiResult(Exception(' ${ex.response?.data["message"]}'));

  }

}