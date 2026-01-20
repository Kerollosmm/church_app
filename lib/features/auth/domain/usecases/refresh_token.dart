import '../repositories/auth_repository.dart';

class RefreshToken {
  const RefreshToken(this._repository);

  final AuthRepository _repository;

  Future<void> call() async {}
}
