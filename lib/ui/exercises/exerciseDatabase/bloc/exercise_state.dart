import 'package:fitness_fatality_flutter/data/entities/exercise/exercise.dart';
import 'package:fitness_fatality_flutter/data/entities/exercise/muscle_groups.dart';

class ExerciseState {
  final List<Exercise> exercises = List();

  ExerciseState() {
    Exercise e = Exercise(
      id: 0,
      name: "Push ups",
      exerciseType: ExerciseType.BODY_WEIGHT,
      availableLoggingTypes: <ExerciseLoggingType>[
        ExerciseLoggingType.REPS,
        ExerciseLoggingType.DURATION
      ],
      muscleGroups: MuscleGroups(primaryGroup: MuscleGroupsType.CHEST, secondaryGroups: [MuscleGroupsType.TRICEPS]),
      defaultLoggingType: ExerciseLoggingType.REPS,
      isCustom: false
    );

    Exercise e2 = Exercise(
        id: 0,
        name: "Push ups",
        exerciseType: ExerciseType.BODY_WEIGHT,
        availableLoggingTypes: <ExerciseLoggingType>[
          ExerciseLoggingType.REPS,
          ExerciseLoggingType.DURATION
        ],
        muscleGroups: MuscleGroups(primaryGroup: MuscleGroupsType.CHEST, secondaryGroups: [MuscleGroupsType.TRICEPS]),
        defaultLoggingType: ExerciseLoggingType.REPS,
        isCustom: false
    );

    Exercise e3 = Exercise(
        id: 0,
        name: "Push ups",
        exerciseType: ExerciseType.BODY_WEIGHT,
        availableLoggingTypes: <ExerciseLoggingType>[
          ExerciseLoggingType.REPS,
          ExerciseLoggingType.DURATION
        ],
        muscleGroups: MuscleGroups(primaryGroup: MuscleGroupsType.CHEST, secondaryGroups: [MuscleGroupsType.TRICEPS]),
        defaultLoggingType: ExerciseLoggingType.REPS,
        isCustom: false
    );

    Exercise e4 = Exercise(
        id: 0,
        name: "Push ups",
        exerciseType: ExerciseType.BODY_WEIGHT,
        availableLoggingTypes: <ExerciseLoggingType>[
          ExerciseLoggingType.REPS,
          ExerciseLoggingType.DURATION
        ],
        muscleGroups: MuscleGroups(primaryGroup: MuscleGroupsType.CHEST, secondaryGroups: [MuscleGroupsType.TRICEPS]),
        defaultLoggingType: ExerciseLoggingType.REPS,
        isCustom: false
    );

    Exercise e5 = Exercise(
        id: 0,
        name: "Push ups",
        exerciseType: ExerciseType.BODY_WEIGHT,
        availableLoggingTypes: <ExerciseLoggingType>[
          ExerciseLoggingType.REPS,
          ExerciseLoggingType.DURATION
        ],
        muscleGroups: MuscleGroups(primaryGroup: MuscleGroupsType.CHEST, secondaryGroups: [MuscleGroupsType.TRICEPS]),
        defaultLoggingType: ExerciseLoggingType.REPS,
        isCustom: false
    );

    exercises.add(e);
    exercises.add(e2);
    exercises.add(e3);
    exercises.add(e4);
    exercises.add(e5);

  }

  factory ExerciseState.initial () => ExerciseState();
}