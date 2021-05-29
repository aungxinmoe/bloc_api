import 'package:bloc_api/bloc/get/put/cubit/editcontact_cubit.dart';
import 'package:bloc_api/bloc/get/put/delete/post/cubit/postcontact_cubit.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module.dart';

class EditScreen extends StatelessWidget {
  final Contact _contact;
  EditScreen(this._contact);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditcontactCubit>(
      create: (context) => EditcontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Screen'),
        ),
        body: BlocBuilder<EditcontactCubit,EditcontactState>(
          builder: (context, state) {
            if (state is EditcontactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EditcontactSuccess) {
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
            } else if (state is EditcontactFail) {
              return Text(state.Error);
            }
            return ContactForm(this._contact);
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contact _contact;
  ContactForm(this._contact);
  @override
  _ContactFormState createState() => _ContactFormState(_contact);
}

class _ContactFormState extends State<ContactForm> {
  final Contact _contact;
  _ContactFormState(this._contact);
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
              initialValue: _contact.name,
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
            initialValue: _contact.job,
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
            initialValue: _contact.age,
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
                      Contact(id: _contact.id, name: _name!, job: _job!, age: _age!);
                  BlocProvider.of<EditcontactCubit>(context)
                      .updateContact(_contact.id,contact);
                }
              },
              child: Text('Edit Contact'))
        ],
      ),
    );
  }
}
