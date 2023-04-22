import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  AvatarContainer(
      {Key key,
      @required this.contacts,
      @required this.index,
      @required this.numColunas})
      : super(key: key);

  final List<Contact> contacts;
  final index;
  final int numColunas;

  @override
  Widget build(BuildContext context) {
    var contact = contacts.elementAt(index);
    try {
      if (contact.avatar.toString() != '[]') {
        return Image.memory(
          contact.avatar,
          height: 50,
          width: 50,
        );
      } else {
        return Container(
          child: GestureDetector(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              '${contact.givenName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 80 / numColunas),
            ),
          )),
          color: const Color(0xff6bb0ff),
        );
      }
    } catch (e) {
      return Container();
    }
  }
}
