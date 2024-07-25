import 'package:flutter/material.dart';

class DreamCreationPage extends StatefulWidget {
  @override
  _DreamCreationPageState createState() => _DreamCreationPageState();
}

class _DreamCreationPageState extends State<DreamCreationPage>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  String _selectedLanguage = 'Français';
  String _selectedGender = 'Garçon';
  String _selectedTheme = 'Aventures Spatiales';
  String _selectedLocation = 'Pays Imaginaire';

  final List<String> _languages = ['Français', 'Anglais', 'Espagnol'];
  final List<String> _genders = ['Garçon', 'Fille'];
  final List<String> _themes = [
    'Aventures Spatiales',
    'Contes de Fées',
    'Aventures Animalières',
    'Mystères et Enquêtes',
    'Voyages dans le Temps',
    'Magie et Sorcellerie',
    'Voyages Imaginaires',
    'Aventures de Super-Héros',
    'Explorations Naturelles',
    'Histoires de Famille et Amitié',
    'Histoires de Pirates et Trésors',
    'Légendes et Mythes',
    'Histoires de Créateurs et Inventeurs',
    'Rêves et Imagination'
  ];

  final List<String> _locations = [
    'Pays Imaginaire',
    'Plage',
    'Forêt Enchantée',
    'Espace',
    'Château',
  ];

  final Map<String, List<String>> _themeDetails = {
    'Aventures Spatiales': [
      'Exploration de planètes',
      'Rencontres avec des extraterrestres',
      'Missions interstellaires'
    ],
    'Contes de Fées': [
      'Princesses et châteaux',
      'Magie et potions enchantées',
      'Créatures fantastiques comme les dragons et les fées'
    ],
    // Ajoutez ici les autres thèmes avec leurs détails
  };

  List<String> _characters = [];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF414056),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Fabrique ton rêve',
          style: TextStyle(
            fontFamily: 'Eczar',
            color: Color(0xFFD19700),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF414056),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Prénom de l'enfant:",
                        style: TextStyle(
                          color: Color(0xFFE7DDD0),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 125, 125, 125),
                              fontFamily: 'Roboto'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Genre :',
                        style: TextStyle(
                          color: Color(0xFFE7DDD0),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: _genders.map((gender) {
                          bool isSelected = _selectedGender == gender;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = gender;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xFFFFA500)
                                    : Colors.grey[700],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                gender,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Langue :',
                        style: TextStyle(
                          color: Color(0xFFE7DDD0),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLanguage = newValue!;
                          });
                        },
                        items: _languages.map((language) {
                          return DropdownMenuItem(
                            value: language,
                            child: Text(
                              language,
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 125, 125, 125),
                              fontFamily: 'Roboto'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Thème de l’histoire:',
                        style: TextStyle(
                          color: Color(0xFFE7DDD0),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedTheme,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTheme = newValue!;
                          });
                        },
                        items: _themes.map((theme) {
                          return DropdownMenuItem(
                            value: theme,
                            child: Text(
                              theme,
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Color(0xFFE7DDD0), fontFamily: 'Roboto'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Lieu de l’histoire:',
              style: TextStyle(
                color: Color(0xFFE7DDD0),
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue!;
                });
              },
              items: _locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(
                    location,
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Color(0xFFE7DDD0), fontFamily: 'Roboto'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Personnages :',
              style: TextStyle(
                color: Color(0xFFE7DDD0),
                fontFamily: 'Roboto',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _characters.map((character) {
                return Chip(
                  label: Text(character),
                  onDeleted: () {
                    setState(() {
                      _characters.remove(character);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ajouter un personnage',
                labelStyle: TextStyle(
                    color: Color(0xFF7D7D7D), fontFamily: 'Roboto'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onSubmitted: (value) {
                setState(() {
                  _characters.add(value);
                });
              },
            ),
            SizedBox(height: 20),
            if (_themeDetails.containsKey(_selectedTheme))
              Expanded(
                child: ListView(
                  children: _themeDetails[_selectedTheme]!.map((detail) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      title: Text(
                        detail,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Roboto'),
                      ),
                      tileColor: Colors.grey[800],
                    );
                  }).toList(),
                ),
              ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Logique pour lancer le rêve
              },
              child: ScaleTransition(
                scale: _animation,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF834066),
                        Color(0xFF8F4B6A),
                        Color(0xFFFFB08E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Center(
                    child: Text(
                      'Lance ton rêve ✦',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE7DDD0),
                        fontSize: 19,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
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
        title: Text(
          'Bibliothèque de Rêves',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: Center(
        child: Text(
          'Bibliothèque de Rêves -➤',
          style: TextStyle(fontSize: 24, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
