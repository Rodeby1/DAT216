import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:lab1/model/task_handler.dart'; // Import TaskHandler
import 'package:lab1/widgets/status_icon.dart';
import 'package:lab1/widgets/delete_button.dart';
import 'package:lab1/widgets/title_text.dart';

class TaskList extends StatelessWidget {
   const TaskList({super.key});

    @override
    Widget build(BuildContext context) {

        var taskHandler = context.watch<TaskHandler>();
        var tasks = taskHandler.activeTasks; 

        return ListView(children: [
            for (final task in tasks)
                ListTile(
                    leading: StatusIcon(task),
                    title: TitleText(task),
                    onTap: () {
                    taskHandler.toggleTask(task);
                    },
                    trailing: DeleteButton(
                        onPressed: () {
                        taskHandler.deleteTask(task);
                        },
                    ),
                ),
            ]);
    }
}
