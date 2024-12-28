import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/common/app_themes.dart';
import 'package:todolist_app/src/common/enums.dart';
import 'package:todolist_app/src/common/mixins.dart';
import 'package:todolist_app/src/database/appdatabase.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';
import 'package:todolist_app/src/state/todo/todo_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  final bool isUpdate;
  final TaskData? data;

  const AddTodoScreen({super.key, required this.isUpdate, required this.data});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen>
    with DateFormatAndPicker {
  late final ApplicationBloc _bloc;
  late final TodoBloc _blocTodo;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();

  late String _dropdownValue;
  late DateTime _dueDate;

  @override
  void initState() {
    _bloc = BlocProvider.of<ApplicationBloc>(context);
    _blocTodo = BlocProvider.of<TodoBloc>(context);

    _dueDate = DateTime.now();
    _dropdownValue = 'pending';

    if (widget.data != null) {
      _titleController = TextEditingController(text: widget.data!.title);
      _descController = TextEditingController(text: widget.data!.description);
      _dueDateController =
          TextEditingController(text: getDateDMY(widget.data!.dueDate));

      _dueDate = widget.data!.dueDate;
      _dropdownValue = widget.data!.status;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
                color: !state.isDarkMode
                    ? AppThemes.darkTheme.scaffoldBackgroundColor
                    : const Color.fromRGBO(246, 246, 246, 1)),
            backgroundColor: state.isDarkMode
                ? AppThemes.darkTheme.scaffoldBackgroundColor
                : const Color.fromRGBO(246, 246, 246, 1),
            title: Text('${widget.isUpdate ? 'Update' : 'Add'} Todo',
                style: state.isDarkMode
                    ? AppThemes.darkTheme.textTheme.titleMedium!
                    : AppThemes.lightTheme.textTheme.titleMedium!),
          ),
          body: Container(
            decoration: BoxDecoration(
                color: state.isDarkMode
                    ? AppThemes.darkTheme.scaffoldBackgroundColor
                    : const Color.fromRGBO(246, 246, 246, 1)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: state.isDarkMode
                            ? Colors.black
                            : const Color(0xFFFFFFFF),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1a9E9E9E),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _titleController,
                        maxLength: 50,
                        maxLines: null,
                        style: TextStyle(
                          color: state.isDarkMode
                              ? AppThemes.darkTheme.textTheme.labelSmall!.color
                              : AppThemes.lightTheme.textTheme.labelSmall!.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: state.isDarkMode
                              ? AppThemes.darkTheme.textTheme.labelSmall!
                              : AppThemes.lightTheme.textTheme.labelSmall!,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: state.isDarkMode
                            ? Colors.black
                            : const Color(0xFFFFFFFF),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1a9E9E9E),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _descController,
                        style: TextStyle(
                          color: state.isDarkMode
                              ? AppThemes.darkTheme.textTheme.labelSmall!.color
                              : AppThemes.lightTheme.textTheme.labelSmall!.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: state.isDarkMode
                              ? AppThemes.darkTheme.textTheme.labelSmall!
                              : AppThemes.lightTheme.textTheme.labelSmall!,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    widget.isUpdate
                        ? const SizedBox(height: 16)
                        : const SizedBox.shrink(),
                    widget.isUpdate
                        ? Container(
                            decoration: BoxDecoration(
                              color: state.isDarkMode
                                  ? Colors.black
                                  : const Color(0xFFFFFFFF),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1a9E9E9E),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Theme(
                              data: ThemeData(
                                dropdownMenuTheme: state.isDarkMode
                                    ? AppThemes.darkTheme.dropdownMenuTheme
                                    : AppThemes.lightTheme.dropdownMenuTheme,
                              ),
                              child: DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: state.isDarkMode
                                      ? Colors.black
                                      : const Color(0XFFEFFAF0),
                                  alignment: Alignment.centerLeft,
                                  value: _dropdownValue,
                                  items: StatusEnum.values
                                      .map<DropdownMenuItem<String>>(
                                          (StatusEnum item) =>
                                              DropdownMenuItem<String>(
                                                value: item.name,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                  child: Text(
                                                    item.name,
                                                    textAlign: TextAlign.start,
                                                    style: state.isDarkMode
                                                        ? AppThemes.darkTheme
                                                            .textTheme.labelSmall!
                                                        : AppThemes
                                                            .lightTheme
                                                            .textTheme
                                                            .labelSmall!,
                                                  ),
                                                ),
                                              ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _dropdownValue = value ?? 'pending';
                                    });
                                  }),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        BottomPicker.date(
                          backgroundColor: state.isDarkMode
                              ? Colors.white70
                              : const Color(0xFFFFFFFF),
                          pickerTitle: Text(
                            'Set Due Date',
                            style: state.isDarkMode
                                ? AppThemes.darkTheme.textTheme.labelMedium!
                                    .copyWith(color: Colors.black)
                                : AppThemes.lightTheme.textTheme.labelMedium,
                          ),
                          dateOrder: DatePickerDateOrder.dmy,
                          initialDateTime: DateTime.now(),
                          maxDateTime: DateTime(2154),
                          minDateTime: DateTime(1980),
                          pickerTextStyle: TextStyle(
                            fontSize: 14,
                            color: state.isDarkMode
                                ? Colors.black
                                : const Color.fromRGBO(242, 110, 86, 1),
                          ),
                          buttonWidth: MediaQuery.of(context).size.width - 80,
                          buttonStyle: BoxDecoration(
                            color: state.isDarkMode
                                ? Colors.black
                                : const Color.fromRGBO(242, 110, 86, 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1a9E9E9E),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          onSubmit: (value) {
                            setState(() {
                              _dueDate = value;
                              _dueDateController.text = getDateDMY(value);
                            });
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                        ).show(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.isDarkMode
                              ? Colors.black
                              : const Color(0xFFFFFFFF),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1a9E9E9E),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: AbsorbPointer(
                          absorbing: true,
                          child: TextFormField(
                            enabled: false,
                            controller: _dueDateController,
                            style: TextStyle(
                              color: state.isDarkMode
                                  ? AppThemes
                                      .darkTheme.textTheme.labelSmall!.color
                                  : AppThemes
                                      .lightTheme.textTheme.labelSmall!.color,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a due date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Due Date',
                              labelStyle: state.isDarkMode
                                  ? AppThemes.darkTheme.textTheme.labelSmall!
                                  : AppThemes.lightTheme.textTheme.labelSmall!,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocProvider(
                      create: (context) => _blocTodo,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Theme(
                          data: ThemeData(
                            elevatedButtonTheme: state.isDarkMode
                                ? AppThemes.darkTheme.elevatedButtonTheme
                                : AppThemes.lightTheme.elevatedButtonTheme,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (widget.isUpdate) {
                                  _blocTodo.add(TodoEvent.update(
                                      id: widget.data!.id,
                                      title: _titleController.text,
                                      description: _descController.text,
                                      status: _dropdownValue,
                                      dueDate: _dueDate));
                                } else {
                                  _blocTodo.add(TodoEvent.add(
                                      title: _titleController.text,
                                      description: _descController.text,
                                      status: 'pending',
                                      dueDate: DateTime.now()));
                                }
                                context.pop();
                                setState(() {});
                              }
                            },
                            child: Text(widget.isUpdate ? 'Update' : 'Add',
                                style:
                                    AppThemes.lightTheme.textTheme.labelMedium!.copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
