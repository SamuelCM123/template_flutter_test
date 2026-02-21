import 'package:flutter/material.dart';

class NewTicketScreen extends StatefulWidget {

  const NewTicketScreen({super.key});

  @override
  State<NewTicketScreen> createState() => _NewTicketScreenState();
}

class _NewTicketScreenState extends State<NewTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Ticket Screen'),
      ),
      body: const Center(
        child: Text('New Ticket Screen'),
      ),
    );
  }
}