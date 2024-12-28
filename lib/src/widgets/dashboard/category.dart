import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/state/todo/todo_bloc.dart';
import 'package:todolist_app/src/ui/dashboard.dart';

class CategoryWidget extends StatefulWidget {
  final List<Category> categories;
  final int selectedCategoryId;
  final Function(int) onCategoryChanged;

  const CategoryWidget(
      {super.key,
      required this.categories,
      required this.selectedCategoryId,
      required this.onCategoryChanged});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late final TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  int _getTaskCount(TodoState state, StatusEnum? status) {
    if (status == null) {
      return state.tasks.length;
    } else {
      return state.tasks.where((todo) => todo.status == status.name).length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: _todoBloc,
      listener: (context, state) {
        if (state.status == UIStatusTodo.loaded) {}
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 100,
              children: widget.categories.map((e) {
                final taskCount = _getTaskCount(state, e.status);

                return _buildMenuCard(
                    context,
                    e.id,
                    widget.selectedCategoryId == e.id,
                    e.name,
                    '$taskCount tasks',
                    e.icon,
                    widget.selectedCategoryId == e.id
                        ? e.color.withOpacity(0.7)
                        : e.color);
              }).toList()),
        );
      },
    );
  }

  Widget _buildMenuCard(BuildContext context, int id, bool isSelected,
      String title, String subtitle, IconData icon, Color color) {
    return Card(
      shadowColor: isSelected ? Colors.white : null,
      color: color,
      elevation: 4,
      child: InkWell(
        onTap: () {
          widget.onCategoryChanged(id);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
