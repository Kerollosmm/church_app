import 'package:flutter_test/flutter_test.dart';
import 'package:csms/core/models/app_user.dart';

void main() {
  group('AppUser', () {
    test('supports value equality', () {
      const user1 = AppUser(
        uid: '123',
        email: 'test@test.com',
        name: 'Test',
        role: UserRole.admin,
        linkedId: 'admin1',
      );
      const user2 = AppUser(
        uid: '123',
        email: 'test@test.com',
        name: 'Test',
        role: UserRole.admin,
        linkedId: 'admin1',
      );
      expect(user1, equals(user2));
    });

    test('fromJson works correctly', () {
      final json = {
        'uid': '123',
        'email': 'test@test.com',
        'name': 'Test',
        'role': 'admin',
        'linkedId': 'admin1',
      };

      final user = AppUser.fromJson(json);
      expect(user.uid, '123');
      expect(user.role, UserRole.admin);
    });
  });
}
