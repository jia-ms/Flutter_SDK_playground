import 'package:flutter/material.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoHomeScreen> {
  final TextEditingController taskcontroller = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  List<String> task = [];
  List<String> notes = [];

  void addTask() {
    if (taskcontroller.text.trim().isNotEmpty) {
      setState(() {
        task.add(taskcontroller.text.trim());
        notes.add(notesController.text.trim());

        taskcontroller.clear();
        notesController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      task.removeAt(index);
      notes.removeAt(index);
    });
  }

  @override
  void dispose() {
    taskcontroller.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextField(
            controller: taskcontroller,
            decoration: const InputDecoration(
              labelText: "Enter your task",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: notesController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Enter Notes",
              hintText: "Optional notes...",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(onPressed: addTask, child: Text("Add Task")),
          SizedBox(height: 4),
          Divider(thickness: 1.2),
          SizedBox(height: 32),
          Text("You pending tasks"),
          SizedBox(height: 8),

          Expanded(
            child: task.isEmpty
                ? const Center(child: Text("No tasks yet!"))
                : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.tag),
                    title: Text(task[index]),
                    subtitle: Text(notes[index].isEmpty ? "No notes added" : notes[index],),
                    trailing: IconButton(
                      onPressed: () {
                        deleteTask(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}