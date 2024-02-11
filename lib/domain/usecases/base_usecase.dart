import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/api_result_model.dart';

abstract class BaseParamsUseCase<Type, Request> {
  Future<ApiResultModel<Type>> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}