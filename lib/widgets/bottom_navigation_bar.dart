// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:my_calendar/controller/datetime_controller.dart';
import 'package:my_calendar/screens/assignments.dart';
import 'package:my_calendar/screens/schedule.dart';
import 'package:my_calendar/screens/settings.dart';
import 'package:my_calendar/screens/today.dart';
import 'package:intl/intl.dart';

class BottomNavigationBarExample extends ConsumerStatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends ConsumerState<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Today(),
    Schedule(),
    Assignments(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dateTimeControllerProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateTimeChoose = ref.watch(dateTimeControllerProvider);
    const backgroundColorTab = Color(0xFF2D344B);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMEd("vi-VN").format(dateTimeChoose),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: 'Today',
            backgroundColor: backgroundColorTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
            backgroundColor: backgroundColorTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Task',
            backgroundColor: backgroundColorTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: backgroundColorTab,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.surface,
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.surface),
        onTap: _onItemTapped,
      ),
    );
  }
}
