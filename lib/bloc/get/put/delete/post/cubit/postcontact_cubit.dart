import 'package:bloc/bloc.dart';
import 'package:bloc_api/data/contact_repository.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:equatable/equatable.dart';

part 'postcontact_state.dart';

class PostcontactCubit extends Cubit<PostcontactState> {
  ContactRespository _contactRespository;
  PostcontactCubit(this._contactRespository) : super(PostcontactInitial());
  void addContact(Contact contact) {
    emit(PostcontactLoading());
    _contactRespository
        .addContact(contact)
        .then((value) => emit(PostcontactSuccess()))
        .catchError((e) => emit(PostcontactFail('Error')));
  }
}
