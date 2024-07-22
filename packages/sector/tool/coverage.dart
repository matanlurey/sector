#!/usr/bin/env dart

import 'package:chore/chore.dart';

/// Generates a coverage report for the project.
void main(List<String> args) async {
  final chore = Chore.withCommands(commands: [Coverage.new]);
  await chore.run(['coverage', ...args]);
}
