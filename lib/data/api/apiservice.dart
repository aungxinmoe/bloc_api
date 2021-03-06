
import 'package:bloc_api/data/model/contacts.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: "https://60ac92269e2d6b00174576e5.mockapi.io/api/")
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET("")
  Future<List<Contact>> getContact();
  @POST("")
  Future<Contact> addContact(@Body() Contact contact);
  @PUT("{id}")
  Future<Contact> updateContact(@Path() String id, @Body() Contact contact);
  @DELETE("{id}")
  Future<Contact> deleteContact(@Path() String id);
}
