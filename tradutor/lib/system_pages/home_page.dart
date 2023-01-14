//Tela onde vai ficar direcionador dicionario ou tradutor
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/pages/dict_home_page.dart';
import 'package:tradutor/system_pages/login_page.dart';

//Tela Para escolher Dicionario OU Tradutor
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    //Chamar dicionario
    callDict() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DictHomePage(),
          ));
    }

    //Deslogar do sistema
    logout() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,

        //Welcome text
        title: const Text("Bem Vindo(a)"),
        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
      ),

      //Side Bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Icon(Icons.home),
            ),

            //SideBar Buttons
            TextButton.icon(
              onPressed: callDict,
              icon: const Icon(
                Icons.menu_book_rounded,
              ),
              label: const Text('Dicionario'),
            ),
            TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.translate_rounded,
              ),
              label: const Text('Tradutor'),
            ),
            TextButton.icon(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
              ),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),

      //App Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Ink(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[900],
                shape: BoxShape.rectangle,
              ),

              //Botão central chamar dicionario
              child: InkWell(
                onTap: callDict,
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //Botão Central Tradutor
            Ink(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
              ),
              child: const InkWell(
                onTap: null,
                child: Icon(
                  Icons.translate_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}