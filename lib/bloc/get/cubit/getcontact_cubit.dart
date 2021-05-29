import 'package:bloc/bloc.dart';
import 'package:bloc_api/data/contact_repository.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:equatable/equatable.dart';

part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetcontactState> {
  final ContactRespository _contactRespository;

  GetcontactCubit(this._contactRespository) : super(GetcontactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetcontactInitial());
    _contactRespository
        .getContact()
        .then((value) => emit(GetContactSuccess(value)))
        .catchError((e) => emit(GetContactFail('Error')));
  }
  void deletContac(String id){
    emit(GetcontactInitial());
    _contactRespository.deleteContact(id)
    .then((value) => getContact())
    .catchError((e)=>emit(GetContactFail('Delete Contact fail')));
  }
}
