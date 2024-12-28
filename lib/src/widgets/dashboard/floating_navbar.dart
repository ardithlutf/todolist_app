import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_app/src/router/app_router.dart';
import 'package:todolist_app/src/state/app/application_bloc.dart';

class FloatingNavbar extends StatefulWidget {
  const FloatingNavbar({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
    required this.toggleDragSheet,
    required this.refreshToDo,
  });

  final Function(int) onPageChanged;
  final Function(bool?) toggleDragSheet;
  final Function() refreshToDo;
  final int currentPage;

  @override
  State<FloatingNavbar> createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar>
    with TickerProviderStateMixin {
  late final ApplicationBloc _bloc;

  late TabController tabController;

  @override
  void initState() {
    _bloc = BlocProvider.of<ApplicationBloc>(context);
    tabController =
        TabController(length: 3, initialIndex: widget.currentPage, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging && mounted) {
        widget.onPageChanged(tabController.index);
        widget.toggleDragSheet(tabController.index == 1);
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(FloatingNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      tabController.animateTo(widget.currentPage);
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Colors.grey;

    return BlocBuilder<ApplicationBloc, ApplicationState>(
      bloc: _bloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
          child: SizedBox(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: BottomBar(
                      fit: StackFit.expand,
                      icon: (width, height) => Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_upward_rounded,
                            color: unselectedColor,
                            size: width,
                          ),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(500),
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                      showIcon: true,
                      width: MediaQuery.of(context).size.width * 0.8,
                      barColor:
                          state.isDarkMode ? Colors.black54 : Colors.white,
                      start: 2,
                      end: 0,
                      offset: 10,
                      barAlignment: Alignment.bottomCenter,
                      iconHeight: 45,
                      iconWidth: 45,
                      reverse: false,
                      hideOnScroll: true,
                      scrollOpposite: false,
                      onBottomBarHidden: () {},
                      onBottomBarShown: () {},
                      body: (context, controller) => Container(height: 0),
                      child: TabBar(
                        splashBorderRadius: BorderRadius.circular(500),
                        dividerColor: Colors.transparent,
                        controller: tabController,
                        indicator: const UnderlineTabIndicator(
                            borderRadius: BorderRadius.zero,
                            insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
                            borderSide: BorderSide(color: Colors.transparent)),
                        tabs: [
                          SizedBox(
                            child: Center(
                                child: Icon(
                              Icons.home,
                              color: widget.currentPage == 0
                                  ? Colors.green
                                  : unselectedColor,
                            )),
                          ),
                          SizedBox(
                            child: Center(
                                child: Icon(
                              Icons.search,
                              color: widget.currentPage == 1
                                  ? Colors.green
                                  : unselectedColor,
                            )),
                          ),
                          SizedBox(
                            child: Center(
                                child: Icon(
                              Icons.notifications_none,
                              color: widget.currentPage == 2
                                  ? Colors.green
                                  : unselectedColor,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: BottomBar(
                      fit: StackFit.expand,
                      borderRadius: BorderRadius.circular(900),
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                      showIcon: true,
                      width: MediaQuery.of(context).size.width * 0.8,
                      barColor:
                          state.isDarkMode ? Colors.black54 : Colors.white,
                      start: 2,
                      end: 0,
                      offset: 10,
                      barAlignment: Alignment.bottomCenter,
                      iconHeight: 45,
                      iconWidth: 45,
                      reverse: false,
                      hideOnScroll: true,
                      scrollOpposite: false,
                      body: (context, controller) => Container(height: 0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(900),
                        onTap: () {
                          context.pushNamed(AppRouter.addTodo, extra: {
                            'isUpdate': false,
                            'data': null,
                          }).then((e) {
                            widget.refreshToDo();
                          });
                        },
                        child: SizedBox(
                          child: Center(
                              child: Icon(
                            Icons.add,
                            color: widget.currentPage == 4
                                ? Colors.green
                                : unselectedColor,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
