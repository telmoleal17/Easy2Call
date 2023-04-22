import 'package:flutter/material.dart';
import 'package:mockups/PesquisarLetraView.dart';
import 'package:mockups/historicoView.dart';
import 'package:mockups/paginaInicial.dart';

class OptionsView extends StatefulWidget {
  OptionsView({Key key, @required this.numColunas, @required this.setas})
      : super(key: key);

  bool setas;
  int numColunas;

  @override
  _OptionsViewState createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  sincronizarContactosView() {
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
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 8,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.width / 4) -
                        10,
                    color: const Color(0xff6bb0ff),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'SINCRONIZAR CONTACTOS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/whatsapp.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            /* onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaginaInicial()))
                                },*/
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                //color: const Color(0xff0066ff),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            /* onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaginaInicial()))
                                },*/
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/instagram.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.all(2),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            /* onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaginaInicial()))
                                },*/
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  configurarTabelaView() {
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
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 8,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.width / 4) -
                        10,
                    color: const Color(0xff6bb0ff),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Configurar Tabela de Apresentação\nSelecione o Número',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          20,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.numColunas = 1,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: 1,
                                                setas: widget.setas,
                                              )))
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          20,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.numColunas = 2,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: 2,
                                                setas: widget.setas,
                                              )))
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          20,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.numColunas = 3,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: 3,
                                                setas: widget.setas,
                                              )))
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          20,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.numColunas = 4,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: 4,
                                                setas: widget.setas,
                                              )))
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          20,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.numColunas = 5,
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OptionsView(
                                        numColunas: 5,
                                        setas: widget.setas,
                                      ),
                                    ),
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  setasScrollView() {
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
                          ),
                        ),
                      ),
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 8,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.width / 4) -
                        10,
                    color: const Color(0xff6bb0ff),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Setas ou Srcoll?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          10,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Setas',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.setas = true,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: widget.numColunas,
                                                setas: true,
                                              )))
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 4 -
                                          10,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Scroll',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  widget.setas = false,
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsView(
                                                numColunas: widget.numColunas,
                                                setas: false,
                                              )))
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
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
                      margin: const EdgeInsets.all(2),
                      color: const Color(0xff0066ff),
                      width: MediaQuery.of(context).size.width / 4,
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
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 8,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.width / 4) -
                        10,
                    color: const Color(0xff6bb0ff),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'CONFIGURAÇÕES',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 3,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sincronizar Contactos',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              sincronizarContactosView()))
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 3,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Setas / Scroll',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              setasScrollView()))
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 3,
                                  color: const Color(0xff0066ff),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Configurar Tabela de Apresentação',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              configurarTabelaView()))
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 4,
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
