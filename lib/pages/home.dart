import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todolist_practice/models/task_model.dart';

class HomePage extends StatefulWidget {
  final String user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = TaskModel.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            const SizedBox(height: 50),
            todaysTask(),
            const SizedBox(height: 35),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    title: Text(
                      task.taskName,
                      style: TextStyle(
                        color: task.textColor,
                        fontSize: 16,
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: Checkbox(
                      value: task.isDone,
                      onChanged: (value) {
                        setState(() {
                          task.isDone = value!;
                        });
                      },
                    ),
                    onLongPress: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Padding todaysTask() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "TODAY'S TASKS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const Icon(
            FontAwesomeIcons.checkDouble,
            color: Colors.grey,
            size: 24,
          ),
        ],
      ),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.lightBlueAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const Icon(Icons.add),
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20),
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: "What's up, ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: widget.user,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const TextSpan(
              text: "!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
          iconSize: 32,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            iconSize: 32,
          ),
        ),
      ],
    );
  }
}
