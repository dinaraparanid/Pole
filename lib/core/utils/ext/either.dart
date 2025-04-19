import 'package:fpdart/fpdart.dart';

extension EitherFutureExt<E, R> on Either<E, Future<R>> {
  Future<Either<E, R>> get sequence => fold(
    (e) => Future.value(Either.left(e)),
    (f) async => Either.right(await f),
  );
}