import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_api/data/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddScreen()));
          if (result != null && result == 'success') {
            BlocProvider.of<GetcontactCubit>(context).getContact();
          }
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<GetcontactCubit, GetcontactState>(
        builder: (context, state) {
          if (state is GetContactSuccess) {
            List<Contact> contacts = state.contacts;
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, position) {
                  return item(contacts[position], context);
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget item(Contact contact, context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EditScreen(contact)));
              if (result != null && result == 'success') {
                BlocProvider.of<GetcontactCubit>(context).getContact();
              }
            }),
      ],
      secondaryActions: [
        IconSlideAction(
            caption: 'Archive',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              BlocProvider.of<GetcontactCubit>(context).deletContac(contact.id);
            }),
      ],
      child: Card(
        child: ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.job),
          trailing: Text(contact.age),
        ),
      ),
    );
  }
}
