part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;

  User(this.id, this.email, {this.name, this.profilePicture});

  @override
  List<Object> get props => throw UnimplementedError();
}
