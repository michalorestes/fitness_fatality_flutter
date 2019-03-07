enum MuscleGroupsType {
  QUADRICEPS,
  HAMSTRINGS,
  CALVES,
  CHEST,
  BACK,
  SHOULDERS,
  TRICEPS,
  BICEPS,
  FOREARMS,
  TRAPEZIUS,
  ABS
}

class MuscleGroups {
  MuscleGroupsType primaryGroup;
  List<MuscleGroupsType> secondaryGroups;

  MuscleGroups({this.primaryGroup, this.secondaryGroups});
}
