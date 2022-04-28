import '../../services/data_access_service.dart';

abstract class Op<T, S extends DataAccessType> {
  T execute(S service);
}

abstract class WriteOp<T> extends Op<Future<T>, WriteService> {}

abstract class SubscribeOp<T> extends Op<Stream<T>, SubscribeService> {}
