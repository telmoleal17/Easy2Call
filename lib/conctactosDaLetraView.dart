import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:mockups/PesquisarLetraView.dart';
import 'package:mockups/gridViewContainer.dart';
import 'package:mockups/historicoView.dart';
import 'package:mockups/optionsView.dart';

class ContactosDaLetraView extends StatefulWidget {
  ContactosDaLetraView(
      {Key key,
      @required this.letra,
      @required this.numColunas,
      @required this.setas})
      : super(key: key);

  final bool setas;
  final String letra;
  final int numColunas;

  @override
  _ContactosDaLetraViewState createState() => _ContactosDaLetraViewState();
}

class _ContactosDaLetraViewState extends State<ContactosDaLetraView> {
  int indexList = 0;
  int nloops = 6;
  bool lockRight = false;
  bool lockLeft = true;
  int contactosLeft = 0;
  bool updateLista = false;
  List<Contact> contactosLetra = [];
  int numFotos = 0;

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  getContacts() async {
    int index;
    List<Contact> contacts = (await ContactsService.getContacts()).toList();
    for (index = 0; index < contacts.length; index++) {
      if (contacts[index].givenName[0] == widget.letra) {
        contactosLetra.add(contacts[index]);
      }
    }

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
    if (contactosLetra.length <= numFotos) {
      lockRight = true;
      nloops = contactosLetra.length;
    }

    setState(() {});
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
                        print('Get Pesquisar'),
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
                                    setas: widget.setas))),
                      },
                    ),
                  ],
                ),
                contactosLetra != null
                    ? Row(
                        children: <Widget>[
                          Expanded(
                            child: GridViewContainer(
                              contacts: contactosLetra,
                              indexList: indexList,
                              nloops: nloops,
                              numColunas: widget.numColunas,
                              setas: widget.setas,
                            ),
                          ),
                        ],
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
                                  contactosLeft =
                                      contactosLetra.length - indexList,
                                  if (contactosLeft >= numFotos &&
                                      indexList < contactosLetra.length)
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
