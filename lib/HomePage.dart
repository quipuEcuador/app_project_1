import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _count = 0;
  Color screenBack = Colors.white;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addCounter() {
    setState(() {
      _count++;
    });
  }

  void _lessCounter() {
    setState(() {
      _count--;
    });
  }

  void _clean(){
    setState(() {
      _count=0;
    });
  }

  List<Color> colors = [Colors.white, Colors.tealAccent, Colors.amberAccent];

  Color _screenBackColor(int index) {
    return colors.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BootCamp App Flutter'),
      ),
      body: Container(
          color: _screenBackColor(_selectedIndex),
          child: Center(
              child: Stack(
            children: [
              Visibility(
                  visible: _selectedIndex == 0,
                  child: Text(
                      "is simply dummy text of the printing and typesetting industry.\n"
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \n"
                      "when an unknown printer took a galley of type and scrambled \n"
                      "it to make a type specimen book.",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,fontFamily:'Space'),)),
              Visibility(
                visible: _selectedIndex == 1,
                child: Expanded(
                  child: Column(
                    children: [
                      Text(
                        "contador: ${_count}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            elevation: 2,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          _addCounter();
                        },
                        child: Text('Aumenta'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            elevation: 2,
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          _clean();
                        },
                        child: Text('Limpiar'),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _selectedIndex == 2,
                child: Column(
                  children: [
                    Text(
                      "contador: ${_count}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold,fontFamily: 'Space'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 2,
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        _lessCounter();
                      },
                      child: Text('Disminuye'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 2,
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        _clean();
                      },
                      child: Text('Limpiar'),
                    )
                  ],
                ),
              )
            ],
          ))),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: 'Aumenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: 'Disminuye',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
