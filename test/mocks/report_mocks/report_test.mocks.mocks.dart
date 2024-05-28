// Mocks generated by Mockito 5.4.4 from annotations
// in project/test/mocks/report_mocks/report_test.mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:project/data/datasources/remote/interfaces/I_report_datasource.dart'
    as _i2;
import 'package:project/domain/entities/report.dart' as _i4;
import 'package:project/domain/repositories/interfaces/I_report_repository.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [IReportDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIReportDataSource extends _i1.Mock implements _i2.IReportDataSource {
  MockIReportDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Report>> getAllReports() => (super.noSuchMethod(
        Invocation.method(
          #getAllReports,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Report>>.value(<_i4.Report>[]),
      ) as _i3.Future<List<_i4.Report>>);

  @override
  _i3.Future<List<_i4.Report>> getReports(
    String? clientID,
    String? supportID,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReports,
          [
            clientID,
            supportID,
          ],
        ),
        returnValue: _i3.Future<List<_i4.Report>>.value(<_i4.Report>[]),
      ) as _i3.Future<List<_i4.Report>>);

  @override
  _i3.Future<bool> addReport(_i4.Report? report) => (super.noSuchMethod(
        Invocation.method(
          #addReport,
          [report],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> updateReport(_i4.Report? report) => (super.noSuchMethod(
        Invocation.method(
          #updateReport,
          [report],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> deleteReport(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteReport,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}

/// A class which mocks [IReportRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIReportRepository extends _i1.Mock implements _i5.IReportRepository {
  MockIReportRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Report>> getAllReports() => (super.noSuchMethod(
        Invocation.method(
          #getAllReports,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Report>>.value(<_i4.Report>[]),
      ) as _i3.Future<List<_i4.Report>>);

  @override
  _i3.Future<List<_i4.Report>> getReports(
    String? clientID,
    String? supportID,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReports,
          [
            clientID,
            supportID,
          ],
        ),
        returnValue: _i3.Future<List<_i4.Report>>.value(<_i4.Report>[]),
      ) as _i3.Future<List<_i4.Report>>);

  @override
  _i3.Future<bool> addReport(_i4.Report? report) => (super.noSuchMethod(
        Invocation.method(
          #addReport,
          [report],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> updateReport(_i4.Report? report) => (super.noSuchMethod(
        Invocation.method(
          #updateReport,
          [report],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> deleteReport(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteReport,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
