import 'package:bloc_api/bloc/get/put/delete/post/cubit/postcontact_cubit.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostcontactCubit>(
      create: (context) => PostcontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Screen'),
        ),
        body: BlocBuilder<PostcontactCubit, PostcontactState>(
          builder: (context, state) {
            if (state is PostcontactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostcontactSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Success'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'success');
                        },
                        child: Text('Go Home'))
                  ],
                ),
              );
            } else if (state is PostcontactFail) {
              return Text(state.Error);
            }
            return ContactForm();
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formkey = GlobalKey<FormState>();
  String? _name, _job, _age;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (value) {
                this._name = value;
              }),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Job'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Job';
              }
              return null;
            },
            onSaved: (value) {
              this._job = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Age'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Age';
              }
              return null;
            },
            onSaved: (value) {
              this._age = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  Contact contact =
                      Contact(id: "", name: _name!, job: _job!, age: _age!);
                  BlocProvider.of<PostcontactCubit>(context)
                      .addContact(contact);
                }
              },
              child: Text('Add Contact'))
        ],
      ),
    );
  }
}
