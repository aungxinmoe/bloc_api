import 'package:bloc/bloc.dart';
import 'package:bloc_api/data/contact_repository.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:equatable/equatable.dart';

part 'editcontact_state.dart';

class EditcontactCubit extends Cubit<EditcontactState> {
  ContactRespository _contactRespository;
  EditcontactCubit(this._contactRespository) : super(EditcontactInitial());

  void updateContact(String id, Contact contact) {
    emit(EditcontactLoading());
    _contactRespository
        .updateContact(id, contact)
        .then((value) => emit(EditcontactSuccess()))
        .catchError((e) => emit(EditcontactFail('Error')));
  }
}
