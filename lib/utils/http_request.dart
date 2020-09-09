import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

///http请求管理类，可单独抽取出来
class HttpRequest {
  static const BASEIC_URL = "http://192.168.99.198:8888";
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static void getRequest<T>(
    url, {
    params,
    Function(T t) onSuccess,
    Function(String error) onError,
  }) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      onError("当前没有网络!");
      return;
    }
    try {
      Response response =
          await new Dio().get(BASEIC_URL + url, queryParameters: params);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      }
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  static void postRequest<T>(
    url, {
    params,
    Function(T t) onSuccess,
    Function(String error) onError,
  }) async {
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      onError("当前没有网络!");
      return;
    }
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   onError("当前网络为wifi!");
    // } else if (connectivityResult == ConnectivityResult.mobile) {
    //   onError("当前为移动网络!");
    // }
    if (params == null) {
      onError("缺少参数!");
      return;
    }
    try {
      Response response = await new Dio().post(BASEIC_URL + url, data: params);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
