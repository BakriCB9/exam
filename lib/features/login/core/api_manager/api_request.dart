sealed class ApiRequest <T>{

}

class ApiRequestModel<T> extends ApiRequest<T> {
  T data;
  ApiRequestModel(this.data);
}
