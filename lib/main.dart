import 'package:flutter/material.dart';
import 'DreamFabricPage.dart'; // Importez le fichier contenant la page DreamCreationPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Histoire de Rêve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Eczar',
      ),
      home: HomePage(),
      routes: {
        '/library': (context) => LibraryPage(),
        '/create-dream': (context) => DreamCreationPage(), // Ajoutez la route ici
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Répète l'animation pour un clignotement constant

    _animation = ColorTween(
      begin: Color(0xFF834066),
      end: Color(0xFFFFB08E),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(), // Crée un espace flexible en haut
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Histoire de Rêve',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFFD19700),
                      fontFamily: 'Eczar',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Créez des histoires uniques et captivantes pour vos enfants en quelques clics. '
                    'Chaque soir une nouvelle aventure les attend.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE7DDD0),
                      fontFamily: 'Eczar',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/create-dream'); // Utilisez le nom de la route pour la page DreamCreationPage
                    },
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF834066),
                                Color(0xFF8F4B6A),
                                _animation.value ?? Color(0xFFFFB08E),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          child: Center(
                            child: Text(
                              'Rêver une Histoire ✦',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFE7DDD0),
                                fontSize: 19,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/library');
                    },
                    child: Text(
                      'Bibliothèque de Rêves  -➤',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Eczar',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque de Rêves'),
      ),
      body: Center(
        child: Text(
          'Bibliothèque de Rêves -➤',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
