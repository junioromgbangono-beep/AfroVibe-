import 'package:flutter/material.dart';

void main() {
  runApp(const AfroVibeApp());
}

class AfroVibeApp extends StatelessWidget {
  const AfroVibeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AfroVibe',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101014),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF3D81),
          secondary: Color(0xFFFF8A35),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool liked = false;
  int likes = 1250;

  final List<Map<String, String>> videos = [
    {
      'user': 'AfroStar',
      'description': 'Bienvenue sur AfroVibe ! 🔥',
      'music': 'Son original • AfroVibe',
      'emoji': '🌍',
    },
    {
      'user': 'QueenAfrica',
      'description': 'La culture africaine est notre richesse ❤️',
      'music': 'Afrobeat • Original',
      'emoji': '💃🏾',
    },
    {
      'user': 'Business237',
      'description': 'Crois en tes rêves et travaille dur ! 💪',
      'music': 'Motivation • Original',
      'emoji': '🚀',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            buildFeed(),
            buildDiscover(),
            buildPublish(),
            buildMessages(),
            buildProfile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF19191F),
        selectedItemColor: const Color(0xFFFF3D81),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Découvrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 32),
            label: 'Publier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget buildFeed() {
    final video = videos[0];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.play_circle_fill,
                color: Color(0xFFFF3D81),
                size: 35,
              ),
              const SizedBox(width: 8),
              const Text(
                'AfroVibe',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF54265F),
                  Color(0xFF22223A),
                  Color(0xFF111116),
                ],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '🌍',
                        style: TextStyle(fontSize: 90),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'L’Afrique en mouvement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Partage tes moments avec le monde',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      const Icon(
                        Icons.play_circle_outline,
                        size: 65,
                        color: Color(0xFFFF3D81),
                      ),
                      const SizedBox(height: 8),
                      const Text('Aperçu de la communauté'),
                    ],
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 80,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 23,
                        backgroundColor: Color(0xFFFF3D81),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(height: 18),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                            likes += liked ? 1 : -1;
                          });
                        },
                        icon: Icon(
                          liked ? Icons.favorite : Icons.favorite_border,
                          color: liked ? Colors.red : Colors.white,
                          size: 34,
                        ),
                      ),
                      Text('${likes}'),
                      const SizedBox(height: 12),
                      IconButton(
                        onPressed: () => showComments(),
                        icon: const Icon(
                          Icons.comment,
                          size: 30,
                        ),
                      ),
                      const Text('Commenter'),
                      const SizedBox(height: 12),
                      const Icon(Icons.share, size: 30),
                      const Text('Partager'),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 100,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@${video['user']}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(video['description']!),
                      const SizedBox(height: 6),
                      Text(
                        '♫ ${video['music']}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDiscover() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Découvrir 🌍',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Explore les tendances de la communauté.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 22),
        TextField(
          decoration: InputDecoration(
            hintText: 'Rechercher des vidéos ou des créateurs',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xFF22222A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Tendances du moment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        for (final item in [
          ['🔥', 'Afrobeat'],
          ['💃🏾', 'Danse africaine'],
          ['😂', 'Humour'],
          ['💼', 'Business
