import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mockups/optionsView.dart';
import 'package:permission_handler/permission_handler.dart';
import './PesquisarLetraView.dart';
import './gridViewContainer.dart';
import './historicoView.dart';

class PaginaInicial extends StatefulWidget {
  PaginaInicial({Key key, @required this.numColunas, @required this.setas})
      : super(key: key);
  final bool setas;
  final int numColunas;

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  List<Contact> contacts = [];
  int indexList = 0;
  int nloops = 6;
  bool lockRight = false;
  bool lockLeft = true;
  int contactosLeft = 0;
  bool updateLista = false;
  int numFotos = 0;

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    handleContactsPermission().then((permissionGranted) {
      if (permissionGranted) {
        getAllContacts();
        //sortContacts();
      } else {
        print('Permission Denied : Access to contacts denied.');
      }
    });
  }

  Future<bool> handleContactsPermission() async {
    PermissionStatus contactsPermissionStatus =
        await _getContactsPermissionStatus();

    if (contactsPermissionStatus == PermissionStatus.granted) {
      // Which means that we have been given the permission to access device storage
      return true;
    } else {
      _handleInvalidPermission(contactsPermissionStatus);
      return false;
    }
  }

  Future<PermissionStatus> _getContactsPermissionStatus() async {
    PermissionStatus permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? Permission.unknown;
    }

    return Permission.unknown.status;
  }

  void _handleInvalidPermission(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    switch (widget.numColunas) {
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

    nloops = numFotos;
    if (_contacts.length <= numFotos) {
      lockRight = true;
      nloops = _contacts.length;
    }

    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffb400ff),
                          image: DecorationImage(
                            image: AssetImage('assets/images/callhistory.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: const EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width / 2.8,
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoricoView(
                                      numColunas: widget.numColunas,
                                      setas: widget.setas,
                                    )))
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: const Color(0xff0066ff),
                        width: MediaQuery.of(context).size.width / 2.8,
                        height: MediaQuery.of(context).size.height / 8,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'A-Z',
                            textAlign: TextAlign.center,
                            textScaleFactor: 4,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PesquisarLetraView(
                                      numColunas: widget.numColunas,
                                      setas: widget.setas,
                                    )))
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff0066ff),
                          image: DecorationImage(
                            image: AssetImage('assets/images/settings.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        margin: const EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OptionsView(
                                      numColunas: widget.numColunas,
                                      setas: widget.setas,
                                    )))
                      },
                    ),
                  ],
                ),
                contacts != null
                    ? Expanded(
                        child: GridViewContainer(
                          numColunas: widget.numColunas,
                          contacts: contacts,
                          indexList: indexList,
                          nloops: nloops,
                          setas: widget.setas,
                        ),
                      )
                    : Container(),
                widget.setas
                    ? Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff0066ff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/left.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 2.8,
                              height: MediaQuery.of(context).size.height / 9.5,
                            ),
                            onTap: () => {
                              if (!lockLeft)
                                {
                                  setState(
                                    () {
                                      indexList -= numFotos;
                                      print(indexList);
                                      if (indexList > 0) {
                                        nloops = numFotos;
                                        lockRight = false;
                                      } else {
                                        lockLeft = true;
                                      }
                                    },
                                  ),
                                },
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff0066ff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/micro.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 9.5,
                            ),
                            onTap: () => {},
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff0066ff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/right.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 2.8,
                              height: MediaQuery.of(context).size.height / 9.5,
                            ),
                            onTap: () => {
                              if (!lockRight)
                                {
                                  updateLista = false,
                                  indexList += numFotos,
                                  contactosLeft = contacts.length - indexList,
                                  if (contactosLeft >= numFotos &&
                                      indexList < contacts.length)
                                    {
                                      nloops = numFotos,
                                      lockLeft = false,
                                      updateLista = true,
                                    }
                                  else
                                    {
                                      if (contactosLeft > 0)
                                        {
                                          nloops = contactosLeft,
                                          lockLeft = false,
                                          lockRight = true,
                                          updateLista = true,
                                        },
                                    },
                                  if (updateLista)
                                    {
                                      setState(() {}),
                                    },
                                },
                            },
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff0066ff),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/micro.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width - 4,
                              height: MediaQuery.of(context).size.height / 9.5,
                            ),
                            onTap: () => {},
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
