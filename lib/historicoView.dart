import 'dart:typed_data';
import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';
import 'package:mockups/paginaInicial.dart';
import './optionsView.dart';
import './PesquisarLetraView.dart';

class HistoricoView extends StatefulWidget {
  HistoricoView({Key key, @required this.numColunas, @required this.setas})
      : super(key: key);

  final bool setas;
  final int numColunas;
  @override
  _HistoricoViewState createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  Iterable<CallLogEntry> historico = [];
  List<Uint8List> fotos_contactos = [];
  List<String> datas_contactos = [];
  List<String> horas_contactos = [];
  int indexList = 0;
  int nloops = 3;
  bool lockRight = false;
  bool lockLeft = true;
  int historicoLeft = 0;
  bool updateHistorico = false;

  @override
  void initState() {
    super.initState();
    getHistorico();
  }

  getHistorico() async {
    Iterable<CallLogEntry> _historico = await CallLog.get();
    List<Uint8List> _fotos_contactos = [];
    List<String> _datas_contactos = [];
    List<String> _horas_contactos = [];
    List<Contact> contacts = (await ContactsService.getContacts()).toList();
    int i = 0, j = 0;
    CallLogEntry aux;
    DateTime data;
    bool temos_foto = false;
    String dataformatada;
    String horaformatada;

    for (i = 0; i < _historico.length; i++) {
      aux = _historico.elementAt(i);
      data = DateTime.fromMillisecondsSinceEpoch(aux.timestamp);
      dataformatada = DateFormat('yyyy-MM-dd').format(data);
      _datas_contactos.add(dataformatada);

      horaformatada = DateFormat('kk:mm').format(data);
      _horas_contactos.add(horaformatada);
      temos_foto = false;
      j = 0;
      while (!temos_foto && j < contacts.length) {
        if (contacts.elementAt(j).phones.first.value == aux.number) {
          temos_foto = true;
          if (contacts.elementAt(j).avatar.toString() == '[]') {
            _fotos_contactos.add(Uint8List(0));
          } else {
            _fotos_contactos.add(contacts.elementAt(j).avatar);
          }
        }
        j++;
      }
    }
    nloops = 3;
    if (_historico.length <= 3) {
      lockRight = true;
      nloops = _historico.length;
    }

    historico = _historico;
    fotos_contactos = _fotos_contactos;
    datas_contactos = _datas_contactos;
    horas_contactos = _horas_contactos;

    setState(() {});
  }

  makeCall(String contact) async {
    await FlutterPhoneDirectCaller.callNumber(contact);

    await getHistorico();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: const Color(0xff0066ff),
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.png'),
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
                              builder: (context) => PaginaInicial(
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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
                            numColunas: 2,
                            setas: widget.setas,
                          ),
                        ),
                      )
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height / 8) -
                          (MediaQuery.of(context).size.height / 9.5) -
                          8,
                      child: widget.setas
                          ? GridView.count(
                              padding: EdgeInsets.zero,
                              childAspectRatio:
                                  ((MediaQuery.of(context).size.width - 8) /
                                      (MediaQuery.of(context).size.width / 2 -
                                          8)),
                              crossAxisCount: 1,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                historico.length > 3
                                    ? nloops
                                    : historico.length,
                                (index) {
                                  CallType type =
                                      historico.elementAt(index).callType;
                                  String imageType = '';
                                  if (type == CallType.missed) {
                                    imageType = 'missed.png';
                                  }
                                  if (type == CallType.incoming) {
                                    imageType = 'incoming.png';
                                  }
                                  if (type == CallType.outgoing) {
                                    imageType = 'outgoing.png';
                                  }
                                  return GestureDetector(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                8,
                                            child: Stack(
                                              children: <Widget>[
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff92c5ff),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/$imageType'),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '${historico.elementAt(index + indexList).name}\n\n${datas_contactos.elementAt(index + indexList)}\n\n${horas_contactos.elementAt(index + indexList)}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            color: const Color(0xff92c5ff),
                                          ),
                                        ),
                                        fotos_contactos
                                                    .elementAt(
                                                        index + indexList)
                                                    .toString() !=
                                                '[]'
                                            ? Image.memory(fotos_contactos
                                                .elementAt(index + indexList))
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff0066ff),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/user.png'),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                              ),
                                      ],
                                    ),
                                    onTap: () => makeCall(historico
                                        .elementAt(index + indexList)
                                        .number),
                                  );
                                },
                              ),
                            )
                          : GridView.count(
                              padding: EdgeInsets.zero,
                              childAspectRatio:
                                  ((MediaQuery.of(context).size.width - 8) /
                                      (MediaQuery.of(context).size.width / 2 -
                                          8)),
                              crossAxisCount: 1,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              physics: ScrollPhysics(),
                              children: List.generate(
                                historico != null ? historico.length : 0,
                                (index) {
                                  CallType type =
                                      historico.elementAt(index).callType;
                                  String imageType = '';
                                  if (type == CallType.missed) {
                                    imageType = 'missed.png';
                                  }
                                  if (type == CallType.incoming) {
                                    imageType = 'incoming.png';
                                  }
                                  if (type == CallType.outgoing) {
                                    imageType = 'outgoing.png';
                                  }
                                  return GestureDetector(
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                8,
                                            child: Stack(
                                              children: <Widget>[
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff92c5ff),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/$imageType'),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '${historico.elementAt(index + indexList).name}\n\n${datas_contactos.elementAt(index + indexList)}\n\n${horas_contactos.elementAt(index + indexList)}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Arial',
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            color: const Color(0xff92c5ff),
                                          ),
                                        ),
                                        fotos_contactos
                                                    .elementAt(
                                                        index + indexList)
                                                    .toString() !=
                                                '[]'
                                            ? Image.memory(fotos_contactos
                                                .elementAt(index + indexList))
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff0066ff),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/user.png'),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                              ),
                                      ],
                                    ),
                                    onTap: () => makeCall(historico
                                        .elementAt(index + indexList)
                                        .number),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                ],
              ),
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
                                    indexList -= 3;
                                    print(indexList);
                                    if (indexList > 0) {
                                      nloops = 3;
                                      lockRight = false;
                                    } else {
                                      lockLeft = true;
                                      lockRight = false;
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
                          /*onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => XDPginaInicial()))
                        }*/
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
                                updateHistorico = false,
                                indexList += 3,
                                historicoLeft = historico.length - indexList,
                                if (historicoLeft >= 3 &&
                                    indexList < historico.length)
                                  {
                                    nloops = 3,
                                    lockLeft = false,
                                    updateHistorico = true,
                                  }
                                else
                                  {
                                    if (historicoLeft > 0)
                                      {
                                        nloops = historicoLeft,
                                        lockLeft = false,
                                        lockRight = true,
                                        updateHistorico = true,
                                      },
                                  },
                                if (updateHistorico)
                                  {
                                    setState(() {}),
                                  }
                                else
                                  {
                                    indexList -= 3,
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
    );
  }
}
