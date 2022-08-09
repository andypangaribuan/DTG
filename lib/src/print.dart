/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */
part of src;

class _Print {
  _Print._();

  void table(List<List<String>> table, {Function(List<List<String>>)? sort}) {
    if (table.isEmpty) {
      return;
    }

    if (sort != null && table.length > 1) {
      final head = table[0];
      table.removeAt(0);
      sort(table);
      table.insert(0, head);
    }

    List<int> lsMax = List.generate(table[0].length, (index) {
      final cols = {for (var row in table) row[index]};
      final max = cols.fold<int>(0, (prev, e) => e.length > prev ? e.length : prev);
      return max;
    });

    String addSpace(int max, String value) {
      while (true) {
        if (value.length >= max) {
          break;
        }
        value += " ";
      }
      return value;
    }

    List<String> messages = [];
    for (var columns in table) {
      String message = "";
      for (int i = 0; i < columns.length; i++) {
        if (i == columns.length - 1) {
          message += columns[i];
        } else {
          message += addSpace(lsMax[i], columns[i]);
          message += "  ";
        }
      }
      messages.add(message);
    }

    for (var msg in messages) {
      print(msg);
    }
  }
}
