import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import './avatarContainer.dart';

class GridViewContainer extends StatelessWidget {
  const GridViewContainer(
      {Key key,
      @required this.contacts,
      @required this.indexList,
      @required this.nloops,
      @required this.numColunas,
      @required this.setas})
      : super(key: key);

  final List<Contact> contacts;
  final int indexList;
  final int nloops;
  final int numColunas;
  final bool setas;

  makeCall(Contact contact) async {
    await FlutterPhoneDirectCaller.callNumber(contact.phones.first.value);
  }

  @override
  Widget build(BuildContext context) {
    int _indexList = indexList;
    double _height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height / 8) -
        (MediaQuery.of(context).size.height / 9.5) -
        8;
    int numFotos = 0;
    switch (numColunas) {
      case 1:
        numFotos = 1;
        break;
      case 2:
        numFotos = 6;
        break;
      case 3:
        numFotos = 12;
        break;
      case 4:
        numFotos = 20;
        break;
      case 5:
        numFotos = 30;
        break;
    }
    return Container(
      padding: EdgeInsets.all(4),
      height: _height,
      child: setas
          ? GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //physics: ScrollPhysics(),
              crossAxisCount: numColunas,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(
                contacts.length > nloops ? nloops : contacts.length,
                (index) {
                  return GestureDetector(
                    child: AvatarContainer(
                        contacts: contacts,
                        index: index + _indexList,
                        numColunas: numColunas),
                    onTap: () =>
                        makeCall(contacts.elementAt(index + _indexList)),
                  );
                },
              ),
            )
          : GridView.count(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
              crossAxisCount: numColunas,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(
                contacts.length != null ? contacts.length : 0,
                (index) {
                  return GestureDetector(
                    child: AvatarContainer(
                        contacts: contacts,
                        index: index + _indexList,
                        numColunas: numColunas),
                    onTap: () =>
                        makeCall(contacts.elementAt(index + _indexList)),
                  );
                },
              ),
            ),
    );
  }
}
