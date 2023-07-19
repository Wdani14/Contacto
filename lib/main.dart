import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacto'),
        ),
        body: ContactPage(),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContactAvatar(name: 'Pascualillo'),
          SizedBox(height: 20),
          ContactOptions(),
          SizedBox(height: 20),
          Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              child: ContactInformation(
                phoneNumber: '+504 9902-9311',
                whatsapp: '+504 9902-9311',
                telegram: '+504 9902-9311',
              )),
        ],
      ),
    );
  }
}

class ContactAvatar extends StatelessWidget {
  final String name;

  ContactAvatar({required this.name});

  @override
  Widget build(BuildContext context) {
    String initials = name.isEmpty
        ? ''
        : name.trim().split(' ').map((name) => name[0]).take(2).join();

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: Text(
            initials,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ContactOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContactOption(icon: Icons.call, label: 'Llamar'),
        ContactOption(icon: Icons.message, label: 'Mensaje de Texto'),
        ContactOption(icon: Icons.videocam, label: 'Video'),
      ],
    );
  }
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;

  ContactOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

class ContactInformation extends StatelessWidget {
  final String phoneNumber;
  final String whatsapp;
  final String telegram;

  ContactInformation({
    required this.phoneNumber,
    required this.whatsapp,
    required this.telegram,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactInfoRow(label: 'Celular', value: phoneNumber, icon: Icons.call),
        ContactInfoRow(
            label: 'Enviar Mensaje a', value: whatsapp, icon: Icons.whatshot),
        ContactInfoRow(
            label: 'Llamar a', value: whatsapp, icon: Icons.whatshot),
        ContactInfoRow(
            label: 'Videollamar a', value: whatsapp, icon: Icons.whatshot),
        ContactInfoRow(label: 'Mensaje al', value: telegram, icon: Icons.send),
        ContactInfoRow(
            label: 'Llamada de voz', value: telegram, icon: Icons.send),
        ContactInfoRow(
            label: 'Videollamada al', value: telegram, icon: Icons.send),
      ],
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  ContactInfoRow({required this.label, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Icon(
            icon,
            size: 16,
          ),
        SizedBox(width: 15),
        SizedBox(height: 35),
        Text(
          label + ': ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
