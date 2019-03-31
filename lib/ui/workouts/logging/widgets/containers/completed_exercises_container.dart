import 'package:fitness_fatality_flutter/data/entities/logs/exercise_log.dart';
import 'package:fitness_fatality_flutter/data/entities/workout/workout_exercise.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_component.dart';
import 'package:fitness_fatality_flutter/ui/workouts/logging/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedExercisesContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CompletedExercisesContainerState();
}

class CompletedExercisesContainerState
    extends State<CompletedExercisesContainer> {
  List<ExpansionPanel> panels = List();
  BlocComponent bloc;
  int currentExerciseIndex;
  ScrollController scrollController = ScrollController();
  double scrollOffset;
  int previousExerciseIndex = 0; //TODO: should be coming from the state

  initState() {
    super.initState();
    bloc = BlocProvider.of<BlocComponent>(context);
    _buildExpansionPanel();
    scrollOffset = 0.0;
  }

  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _postUiBuildProcess());
    _updatePanels();

    return SingleChildScrollView(
      controller: scrollController,
      child: ExpansionPanelList(
        children: panels,
        expansionCallback: (int index, bool isExpanded) {
          panels[index] = ExpansionPanel(
            headerBuilder: panels[index].headerBuilder,
            body: panels[index].body,
            isExpanded: !isExpanded,
          );
        },
      ),
    );
  }

  List<ExpansionPanel> _buildExpansionPanel() {
    for (var i = 0; i < bloc.exercises.length; i++) {
      var exercise = bloc.exercises[i];
      panels.add(ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Text(exercise.exercise.name);
        },
        body: Center(child: Text("No sets completed yet")),
        isExpanded: (bloc.currentState.currentExerciseIndex == i),
      ));
    }

    return panels;
  }

  void _updatePanels() {
    BlocState state = bloc.currentState;

    for (int i = 0; i < panels.length; i++) {
      //expand current index
      if (state.currentExerciseIndex == i && !panels[i].isExpanded) {
        panels[i] = _expandPanel(panels[i], true);
      } else if (state.currentExerciseIndex != i &&
          panels[i].isExpanded &&
          state.currentContainer != Containers.TIMER) {
        //colapse not current index only when rest timer is complete and panel is expanded
        panels[i] = _expandPanel(panels[i], false);
      }

      //update list of sets for current exercise only
      if (state.currentExerciseIndex == i) {
        panels[i] = _updateDisplayedSets(i);
      }
    }
  }

  ExpansionPanel _expandPanel(ExpansionPanel panel, bool isExpanded) {
    return ExpansionPanel(
      headerBuilder: panel.headerBuilder,
      body: panel.body,
      isExpanded: isExpanded,
    );
  }

  //TODO: Need to update how logs values are displayed
  ExpansionPanel _updateDisplayedSets(int index) {
    List<Text> setsWidget = List();
    
    Widget body;
    if (setsWidget.length == 0) {
      body = Text("No sets completed yet");
    } else {
      body = Column(
        children: setsWidget,
      );
    }

    return ExpansionPanel(
      headerBuilder: panels[index].headerBuilder,
      body: body,
      isExpanded: panels[index].isExpanded,
    );
  }

  void _postUiBuildProcess() {
    _calculateScrollPosition();
    previousExerciseIndex = bloc.currentState.currentExerciseIndex;
  }

  void _calculateScrollPosition() async {
    int newOffset = _getNextScrollOffset();
    double destinationOffset = scrollOffset += newOffset;

    //TODO: BUG => if scrolled down when doing the first exercise, the list won't scroll back up because this condition returns true
    if (_reachedMaxScrollLimit(destinationOffset) || newOffset == 0 || previousExerciseIndex == bloc.currentState.currentExerciseIndex) {
      return;
    }

    _scrollToPosition(destinationOffset);
  }

  bool _reachedMaxScrollLimit(double destinationOffset) {
    return destinationOffset >= scrollController.position.maxScrollExtent &&
        destinationOffset != scrollController.offset;
  }

  int _getNextScrollOffset() {
    BlocState state = bloc.currentState;
    WorkoutExercise exercise =
        bloc.currentState.exercises[bloc.currentState.currentExerciseIndex];

    int newOffset = 0;
    if (state.currentExerciseIndex != 0 &&
        (state.currentContainer == Containers.CONTROLS)) {
      newOffset += 57;
    }

    return newOffset;
  }

  void _scrollToPosition(double destinationOffset) {
    scrollController.animateTo(
      destinationOffset,
      duration: new Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}
