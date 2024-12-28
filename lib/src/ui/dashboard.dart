import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/common/app_spacing.dart';
import 'package:todolist_app/src/common/app_themes.dart';
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/database/appdatabase.dart';
import 'package:todolist_app/src/router/app_router.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/auth/auth_bloc.dart';
import 'package:todolist_app/src/state/todo/todo_bloc.dart';
import 'package:todolist_app/src/widgets/dashboard/category.dart';
import 'package:todolist_app/src/widgets/dashboard/floating_navbar.dart';
import 'package:todolist_app/src/widgets/dashboard/welcome.dart';
import 'package:todolist_app/src/widgets/error.dart';

class DashboardPage extends StatefulWidget {
  final String title;

  const DashboardPage({super.key, required this.title});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late final ApplicationBloc _appBloc;
  late final AuthBloc _authBloc;
  late final TodoBloc _todoBloc;

  late int _selectedCategoryId;
  late int _currentPage;

  final List<Category> categories = [
    Category(
        id: 0,
        name: 'All Tasks',
        status: null,
        icon: Icons.list_alt,
        color: const Color.fromRGBO(86, 148, 242, 1)),
    Category(
        id: 1,
        name: 'Pending',
        status: StatusEnum.pending,
        icon: Icons.list_alt,
        color: const Color.fromRGBO(254, 195, 71, 1)),
    Category(
        id: 2,
        name: 'In Progress',
        status: StatusEnum.inProgress,
        icon: Icons.list_alt,
        color: const Color.fromRGBO(83, 194, 197, 1)),
    Category(
        id: 3,
        name: 'Completed',
        status: StatusEnum.completed,
        icon: Icons.list_alt,
        color: const Color.fromRGBO(242, 110, 86, 1)),
  ];

  List<TaskData> tasksLists = [];
  List<TaskData> filteredTasks = [];

  bool seemore_vsb = true;

  late final AnimationController _animController;

  final double initialChildSize = 0.5;
  final double maxScrollHeight = 0.9;
  final double minScrollHeight = 0.5;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  final TextEditingController _searchController = TextEditingController();

  void _filterTasks() {
    setState(() {
      if (_searchController.text.isEmpty) {
        filteredTasks = List.from(tasksLists);
      } else {
        filteredTasks = tasksLists
            .where((task) => task.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    _appBloc = BlocProvider.of<ApplicationBloc>(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _todoBloc = BlocProvider.of<TodoBloc>(context);

    _refreshToDo();

    _selectedCategoryId = 0;
    _currentPage = 0;

    _animController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _searchController.addListener(_filterTasks);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleCategoryChanged(int categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;

      _todoBloc.add(TodoEvent.load(
          filterStatus: categories
              .where((e) => e.id == _selectedCategoryId)
              .first
              .status));

      _searchController.clear();
    });
  }

  void _handlePageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
      _searchController.clear();
    });
  }

  void animateDragOnTap(double height) {
    _controller.animateTo(
      height,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _refreshToDo() {
    _todoBloc.add(const TodoEvent.load());
  }

  void toggleDragSheet(bool? isOpen) {
    if (isOpen != null) {
      if (isOpen) {
        animateDragOnTap(maxScrollHeight);
      } else {
        animateDragOnTap(minScrollHeight);
      }
    } else {
      if (_controller.size == maxScrollHeight) {
        setState(() {
          seemore_vsb = true;
        });
        animateDragOnTap(minScrollHeight);
      } else {
        setState(() {
          seemore_vsb = false;
        });
        animateDragOnTap(maxScrollHeight);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isAttached) {
      _controller.addListener(() {
        final newSize = _controller.size;

        final scrollPosition =
            ((newSize - minScrollHeight) / (maxScrollHeight - minScrollHeight))
                .clamp(0.0, 1.0);

        _animController.animateTo(scrollPosition, duration: Duration.zero);
      });
    }

    return Scaffold(
      body: BlocBuilder<ApplicationBloc, ApplicationState>(
        bloc: _appBloc,
        builder: (context, state) {
          return SizedBox(
            child: NotificationListener<DraggableScrollableNotification>(
                onNotification:
                    (DraggableScrollableNotification DSNotification) {
                  if (seemore_vsb && DSNotification.extent > 0.5) {
                    setState(() {
                      seemore_vsb = false;
                    });
                  } else if (!seemore_vsb && DSNotification.extent == 0.5) {
                    setState(() {
                      seemore_vsb = true;
                    });
                  }
                  return seemore_vsb;
                },
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppSpacing.verticalSpacing48,
                        AppSpacing.verticalSpacing48,
                        Welcome(bloc: _appBloc, authBloc: _authBloc),
                        CategoryWidget(
                            categories: categories,
                            selectedCategoryId: _selectedCategoryId,
                            onCategoryChanged: _handleCategoryChanged),
                      ],
                    ),
                    BlocProvider(
                      create: (context) => _todoBloc,
                      child: BlocListener<TodoBloc, TodoState>(
                        listener: (context, stateTodo) {
                          if (stateTodo.status == UIStatusTodo.loaded) {
                            setState(() {
                              tasksLists = stateTodo.tasks;
                              filteredTasks = tasksLists
                                  .where((task) => task.title
                                      .toLowerCase()
                                      .contains(_searchController.text
                                          .toLowerCase()))
                                  .toList();

                              if (tasksLists.isEmpty &&
                                  _controller.isAttached) {
                                _controller.reset();
                              }
                            });
                          }
                          if (stateTodo.status == UIStatusTodo.loadedFiltered) {
                            setState(() {
                              tasksLists = stateTodo.tasksFiltered;
                              filteredTasks = tasksLists
                                  .where((task) => task.title
                                      .toLowerCase()
                                      .contains(_searchController.text
                                          .toLowerCase()))
                                  .toList();

                              if (tasksLists.isEmpty &&
                                  _controller.isAttached) {
                                _controller.reset();
                              }
                            });
                          }
                        },
                        bloc: _todoBloc,
                        child: DraggableScrollableSheet(
                            controller: _controller,
                            expand: true,
                            minChildSize: minScrollHeight,
                            maxChildSize: maxScrollHeight,
                            initialChildSize: initialChildSize,
                            builder:
                                (BuildContext context, scrollController) {
                              if (tasksLists.isEmpty) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      AppSpacing.verticalSpacing48,
                                      AppSpacing.verticalSpacing48,
                                      TextErrorWidget(
                                          errorMsg: 'No todos yet. Add some!',
                                          style: state.isDarkMode
                                              ? AppThemes.darkTheme.textTheme
                                                  .bodyMedium!
                                              : AppThemes.lightTheme.textTheme
                                                  .bodyMedium!),
                                    ],
                                  ),
                                );
                              }
                              return Center(
                                child: ClipPath(
                                  clipper: CurvedTopClipper(),
                                  child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: state.isDarkMode
                                            ? AppThemes.darkTheme
                                                .scaffoldBackgroundColor
                                            : const Color.fromRGBO(
                                                246, 246, 246, 1),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        ),
                                      ),
                                      child: CustomScrollView(
                                        controller: scrollController,
                                        slivers: [
                                          SliverToBoxAdapter(
                                            child: _currentPage == 1
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        16, 16, 16, 8),
                                                    child: TextField(
                                                      controller:
                                                          _searchController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Search tasks...',
                                                        hintStyle: state
                                                                .isDarkMode
                                                            ? AppThemes
                                                                .darkTheme
                                                                .textTheme
                                                                .bodyMedium!
                                                            : AppThemes
                                                                .lightTheme
                                                                .textTheme
                                                                .bodyMedium!,
                                                        prefixIcon: Icon(
                                                            Icons.search,
                                                            color: !state
                                                                    .isDarkMode
                                                                ? AppThemes
                                                                    .darkTheme
                                                                    .scaffoldBackgroundColor
                                                                : const Color
                                                                    .fromRGBO(
                                                                    246,
                                                                    246,
                                                                    246,
                                                                    1)),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: state
                                                                    .isDarkMode
                                                                ? Colors.grey[
                                                                    700]!
                                                                : Colors.grey[
                                                                    300]!,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12),
                                                          borderSide:
                                                              BorderSide(
                                                            color: state
                                                                    .isDarkMode
                                                                ? Colors.grey[
                                                                    700]!
                                                                : Colors.grey[
                                                                    300]!,
                                                          ),
                                                        ),
                                                        filled: true,
                                                        fillColor: state
                                                                .isDarkMode
                                                            ? Colors.grey[800]
                                                            : Colors
                                                                .grey[100],
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16,
                                                          vertical: 12,
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                        color: state
                                                                .isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          SliverList.builder(
                                              itemCount: 1,
                                              itemBuilder: (context, i) =>
                                                  ListTile(
                                                      title: Text(
                                                          'Recent Task',
                                                          style: state
                                                                  .isDarkMode
                                                              ? AppThemes
                                                                  .darkTheme
                                                                  .textTheme
                                                                  .titleSmall
                                                              : AppThemes
                                                                  .lightTheme
                                                                  .textTheme
                                                                  .titleSmall))),
                                          SliverList.builder(
                                              itemCount: _searchController
                                                      .text.isEmpty
                                                  ? (tasksLists.length > 3
                                                      ? !seemore_vsb
                                                          ? tasksLists.length
                                                          : 3
                                                      : tasksLists.length)
                                                  : filteredTasks.length,
                                              itemBuilder: (context, index) {
                                                final todo = _searchController
                                                        .text.isEmpty
                                                    ? tasksLists[index]
                                                    : filteredTasks[index];

                                                return Dismissible(
                                                  key: UniqueKey(),
                                                  onDismissed: (_) {
                                                    _todoBloc.add(
                                                        TodoEvent.delete(
                                                            id: todo.id));
                                                  },
                                                  background: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.red
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(Radius
                                                                    .circular(
                                                                        20))),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16),
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      child: Icon(
                                                          Icons.delete,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                  ),
                                                  child: ListTile(
                                                    leading: Checkbox(
                                                      value: todo.status ==
                                                          StatusEnum
                                                              .completed.name,
                                                      onChanged: (_) {
                                                        _todoBloc.add(
                                                            TodoEvent.toggle(
                                                                task: todo,
                                                                status: StatusEnum
                                                                    .completed));
                                                      },
                                                    ),
                                                    trailing: IconButton(
                                                        iconSize: 18,
                                                        icon: const Icon(
                                                            Icons.edit),
                                                        onPressed: () {
                                                          context.pushNamed(
                                                              AppRouter
                                                                  .addTodo,
                                                              extra: {
                                                                'isUpdate':
                                                                    true,
                                                                'data': todo,
                                                              });
                                                        },
                                                        color: state
                                                                .isDarkMode
                                                            ? AppThemes
                                                                .darkTheme
                                                                .textTheme
                                                                .titleMedium!
                                                                .color
                                                            : AppThemes
                                                                .lightTheme
                                                                .textTheme
                                                                .titleMedium!
                                                                .color),
                                                    title: Text(
                                                      todo.title,
                                                      style: TextStyle(
                                                        color: state
                                                                .isDarkMode
                                                            ? AppThemes
                                                                .darkTheme
                                                                .textTheme
                                                                .titleSmall!
                                                                .color
                                                            : AppThemes
                                                                .lightTheme
                                                                .textTheme
                                                                .titleSmall!
                                                                .color,
                                                        decoration: todo
                                                                    .status ==
                                                                StatusEnum
                                                                    .completed
                                                                    .name
                                                            ? TextDecoration
                                                                .lineThrough
                                                            : null,
                                                      ),
                                                    ),
                                                    subtitle: todo.status ==
                                                            StatusEnum
                                                                .inProgress
                                                                .name
                                                        ? Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .pending_actions,
                                                                  size: 12,
                                                                  color: !state.isDarkMode
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .white),
                                                              Text(
                                                                ' in progress',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11,
                                                                  // fontStyle: FontStyle.italic,
                                                                  color: state.isDarkMode
                                                                      ? AppThemes
                                                                          .darkTheme
                                                                          .textTheme
                                                                          .labelSmall!
                                                                          .color
                                                                      : AppThemes
                                                                          .lightTheme
                                                                          .textTheme
                                                                          .labelSmall!
                                                                          .color,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : null,
                                                  ),
                                                );
                                              }),
                                          SliverList.builder(
                                              itemCount: 1,
                                              itemBuilder: (context, i) {
                                                if (seemore_vsb &&
                                                    tasksLists.length > 3) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      toggleDragSheet(null);
                                                    },
                                                    child: Center(
                                                        child: Text(
                                                            'see more',
                                                            style: state
                                                                    .isDarkMode
                                                                ? AppThemes
                                                                    .darkTheme
                                                                    .textTheme
                                                                    .labelMedium!
                                                                : AppThemes
                                                                    .lightTheme
                                                                    .textTheme
                                                                    .labelMedium!)),
                                                  );
                                                }
                                                return const SizedBox
                                                    .shrink();
                                              }),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
      floatingActionButton: FloatingNavbar(
        currentPage: _currentPage,
        onPageChanged: _handlePageChanged,
        toggleDragSheet: toggleDragSheet,
        refreshToDo: _refreshToDo,
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  final StatusEnum? status;
  final IconData icon;
  final Color color;

  Category(
      {required this.id,
      required this.name,
      required this.status,
      required this.icon,
      required this.color});
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start from bottom-left
    path.lineTo(size.width, size.height); // Draw line to bottom-right
    path.lineTo(size.width, 0); // Draw line to top-right

    // Create the curved top
    path.quadraticBezierTo(
      size.width / 2, // Control point x
      -50, // Control point y (negative value creates upward curve)
      0, // End point x
      0, // End point y
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
