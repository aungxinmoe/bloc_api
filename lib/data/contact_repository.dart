import 'package:bloc_api/data/api/apiservice.dart';

import 'model/contacts.dart';

class ContactRespository {
  final ApiService _apiService;

  ContactRespository(this._apiService);
  Future<List<Contact>> getContact() => _apiService.getContact();

  Future<Contact> addContact(Contact contact) =>
      _apiService.addContact(contact);

  Future<Contact> updateContact(String id, Contact contact) =>
      _apiService.updateContact(id, contact);

  Future<Contact> deleteContact(String id) => _apiService.deleteContact(id);
}
