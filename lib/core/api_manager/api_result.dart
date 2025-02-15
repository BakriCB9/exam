sealed class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  T data;
  ApiResultSuccess(this.data);
}

class ApiResultError<T> extends ApiResult<T> {
  String error;
  ApiResultError(this.error);
}
