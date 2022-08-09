import 'package:dtg/dtg.dart';

void main() async {
  final containerName = 'api';
  final command = 'docker ps -a | (read line; echo "\$line"; grep $containerName)';
  final lsHeader = ["CONTAINER ID", "IMAGE", "COMMAND", "CREATED", "STATUS", "PORTS", "NAMES"];
  final display = ["IMAGE", "NAMES", "STATUS", "PORTS"];
  final sh = await dg.sh.table(command: command, lsHeader: lsHeader, display: display);
  dg.print.table(sh);
}
