part of 'postcontact_cubit.dart';

abstract class PostcontactState extends Equatable {
  const PostcontactState();

  @override
  List<Object> get props => [];
}

class PostcontactInitial extends PostcontactState {}

class PostcontactLoading extends PostcontactState {}

class PostcontactSuccess extends PostcontactState {}

class PostcontactFail extends PostcontactState {
  final String Error;

  PostcontactFail(this.Error);
 @override
  // TODO: implement props
  List<Object> get props => [Error];
}
