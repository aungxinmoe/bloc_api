part of 'getcontact_cubit.dart';

abstract class GetcontactState extends Equatable {
  const GetcontactState();

  @override
  List<Object> get props => [];
}

class GetcontactInitial extends GetcontactState {}

class GetContactSuccess extends GetcontactState {
  final List<Contact> contacts;

  GetContactSuccess(this.contacts);

  @override
  // TODO: implement props
  List<Object> get props => [contacts];
}

class GetContactFail extends GetcontactState {
  final String error;

  GetContactFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];

}
