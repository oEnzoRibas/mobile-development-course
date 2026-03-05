import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[

            // Logotipo
            // 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'Doodle',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]
                  )
                ),
              ),

            ),
          // Atalhos como ícones circulares
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Column(
          children: <Widget>[
          CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF1F3F4),
          child: Icon(Icons.auto_awesome, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text('Modo IA', style: TextStyle(fontSize: 12)),
          ],
          ),
          Column(
          children: <Widget>[
          CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF1F3F4),
          child: Icon(Icons.visibility_off, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text('Anônimo', style: TextStyle(fontSize: 12)),
          ],
          ),
          Column(
          children: <Widget>[
          CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF1F3F4),
          child: Icon(Icons.history, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text('Histórico', style: TextStyle(fontSize: 12)),
          ],
          ),
          Column(
          children: <Widget>[
          CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF1F3F4),
          child: Icon(Icons.download, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          const Text('Downloads', style: TextStyle(fontSize: 12)),
          ],
          ),
          ],
          ),
          const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: const Icon(Icons.star, size: 48),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Notícia 1: O Flutter usa Widgets para tudo.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
