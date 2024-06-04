import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';
import 'package:project/data/datasources/local/interfaces/I_report_local_datasource.dart';
import 'package:project/data/models/report_db.dart';
import 'package:project/domain/entities/report.dart';

class ReportLocalDataSource implements IReportLocalDataSource {
  @override
  Future<void> addOfflineReport(Report report) async {
    logInfo("Adding Offline Reports");
    await Hive.box('reportsDBOffline').add(ReportDB(
        id: report.id!,
        date: report.date,
        rating: report.rating,
        status: report.status,
        endTime: report.endTime,
        startTime: report.startTime,
        clientID: report.clientID,
        description: report.description,
        supportID: report.supportID));
    logInfo("addOfflineReport ${Hive.box('reportsDBOffline').values.length}");
  }

  @override
  Future<void> cacheReports(List<Report> reports) async {
    logInfo('pre-cache Reportss ${Hive.box('reportsDB').values.length}');
    await Hive.box('reportsDB').clear();
    logInfo('pre-cache reports ${Hive.box('reportsDB').values.length}');

    for (var report in reports) {
      await Hive.box('reportsDB').add(ReportDB(
          id: report.id!,
          date: report.date,
          rating: report.rating,
          status: report.status,
          endTime: report.endTime,
          startTime: report.startTime,
          clientID: report.clientID,
          description: report.description,
          supportID: report.supportID));
    }

    logInfo('cache reports ${Hive.box('reportsDB').values.length}');
  }

  @override
  Future<void> clearOfflineReports() async {
    Hive.box('reportsDBOffline');
  }

  @override
  Future<List<Report>> getCachedReports(
      String clientID, String SupportID) async {
    logInfo('get cached reports ${Hive.box('reportsDB').values.length}');
    return Hive.box('reportsDB')
        .values
        .map((entry) => Report(
            id: entry.key,
            date: entry.date,
            rating: entry.rating,
            status: entry.status,
            endTime: entry.endTime,
            startTime: entry.startTime,
            clientID: entry.clientID,
            description: entry.description,
            supportID: entry.supportID))
        .toList();
  }

  @override
  Future<List<Report>> getOfflineReports() async {
    logInfo(
        'get offline reports ${Hive.box('reportsDBOffline').values.length}');
    return Hive.box('reportsDBOffline')
        .values
        .map((entry) => Report(
            id: entry.key,
            date: entry.date,
            rating: entry.rating,
            status: entry.status,
            endTime: entry.endTime,
            startTime: entry.startTime,
            clientID: entry.clientID,
            description: entry.description,
            supportID: entry.supportID))
        .toList();
  }
}
