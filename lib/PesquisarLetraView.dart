import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:mockups/conctactosDaLetraView.dart';
import 'package:mockups/historicoView.dart';
import 'package:mockups/optionsView.dart';
import 'package:mockups/paginaInicial.dart';

class PesquisarLetraView extends StatefulWidget {
  PesquisarLetraView({Key key, @required this.numColunas, @required this.setas})
      : super(key: key);
  final int numColunas;
  final bool setas;
  @override
  _State createState() => _State();
}

class _State extends State<PesquisarLetraView> {
  List<String> iniciais = [];
  int indexList = 0;
  int nloops = 6;
  bool lockRight = false;
  bool lockLeft = true;
  int letrasLeft = 0;
  bool updateLista = false;
  int numFotos = 0;

  @override
  void initState() {
    super.initState();
    buscarIniciais();
  }

  buscarIniciais() async {
    List<Contact> contacts = (await ContactsService.getContacts()).toList();
    List<String> _iniciais = [];
    int i = 0;
    int j;
    String aux;
    bool ja_existe = false;
    for (i = 0; i < contacts.length; i++) {
      j = 0;
      ja_existe = false;
      aux = contacts[i].givenName[0];
      while (!ja_existe && j < _iniciais.length) {
        if (_iniciais[j] == aux) {
          ja_existe = true;
        }
        j++;
      }
      if (!ja_existe) {
        // print('${aux}');
        _iniciais.add(aux);
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
    if (_iniciais.length <= numFotos) {
      lockRight = true;
      nloops = _iniciais.length;
    }
    print('${_iniciais.length}');
    print('$numFotos');

    setState(() {
      iniciais = _iniciais;
    });
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
                          }),
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
                          }),
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height / 8) -
                          (MediaQuery.of(context).size.height / 9.5) -
                          8,
                      padding: EdgeInsets.fromLTRB(4, 8, 5, 8),
                      child: widget.setas
                          ? GridView.count(
                              padding: EdgeInsets.zero,
                              crossAxisCount: widget.numColunas,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                iniciais.length > nloops
                                    ? nloops
                                    : iniciais.length,
                                (index) {
                                  return GestureDetector(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${iniciais[index + indexList]}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 240 / widget.numColunas,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      color: const Color(0xff6bb0ff),
                                    ),
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactosDaLetraView(
                                                    letra: iniciais[
                                                        index + indexList],
                                                    numColunas:
                                                        widget.numColunas,
                                                    setas: widget.setas,
                                                  )))
                                    },
                                  );
                                },
                              ),
                            )
                          : GridView.count(
                              padding: EdgeInsets.zero,
                              crossAxisCount: widget.numColunas,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              physics: ScrollPhysics(),
                              children: List.generate(
                                iniciais != null ? iniciais.length : 0,
                                (index) {
                                  return GestureDetector(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${iniciais[index + indexList]}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 240 / widget.numColunas,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      color: const Color(0xff6bb0ff),
                                    ),
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactosDaLetraView(
                                                    letra: iniciais[
                                                        index + indexList],
                                                    numColunas:
                                                        widget.numColunas,
                                                    setas: widget.setas,
                                                  )))
                                    },
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
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff0066ff),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/left.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(2),
                                  width:
                                      MediaQuery.of(context).size.width / 2.8,
                                  height:
                                      MediaQuery.of(context).size.height / 9.5,
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
                                            nloops = numFotos;
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
                                      image:
                                          AssetImage('assets/images/micro.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(2),
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 9.5,
                                ),
                                onTap: () => {},
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff0066ff),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/right.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(2),
                                  width:
                                      MediaQuery.of(context).size.width / 2.8,
                                  height:
                                      MediaQuery.of(context).size.height / 9.5,
                                ),
                                onTap: () => {
                                  if (!lockRight)
                                    {
                                      print('numFotos = $numFotos'),
                                      print('!lockRight'),
                                      updateLista = false,
                                      indexList += numFotos,
                                      print('indexList = $indexList'),
                                      letrasLeft = iniciais.length - indexList,
                                      print('letrasLeft = $letrasLeft'),
                                      if (letrasLeft >= numFotos &&
                                          indexList < iniciais.length)
                                        {
                                          print(
                                              'letrasLeft >= numFotos && indexList < iniciais.length'),
                                          nloops = 6,
                                          lockLeft = false,
                                          updateLista = true,
                                        }
                                      else
                                        {
                                          if (letrasLeft > 0)
                                            {
                                              nloops = letrasLeft,
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
                          ),
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
