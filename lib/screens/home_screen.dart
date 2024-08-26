import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import 'add_task_screen.dart';
import '../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tareas'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Pendientes'),
              Tab(text: 'Completadas'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Opciones'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Todas las Tareas'),
                onTap: () {
                  // Acción para todas las tareas
                },
              ),
              ListTile(
                title: Text('Tareas de Hoy'),
                onTap: () {
                  // Acción para tareas de hoy
                },
              ),
              ListTile(
                title: Text('Configuración'),
                onTap: () {
                  // Acción para configuración
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            TaskList(isCompleted: false),
            TaskList(isCompleted: true),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
        ),
      ),
    );
  }
}
