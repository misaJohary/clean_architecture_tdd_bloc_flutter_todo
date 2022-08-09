// Mocks generated by Mockito 5.3.0 from annotations
// in my_todo_clean/test/features/task/data/data_sources/remote_data_sources_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:convert' as _i5;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_todo_clean/core/base_repository/base_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [BaseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseRepository extends _i1.Mock implements _i3.BaseRepository {
  MockBaseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response> post(String? url,
          {dynamic body,
          Map<String, String>? headers,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#post, [url], {#body: body, #headers: headers, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
                  this,
                  Invocation.method(#post, [
                    url
                  ], {
                    #body: body,
                    #headers: headers,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> get(String? url,
          {dynamic body,
          Map<String, String>? headers,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#get, [url], {#body: body, #headers: headers, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
                  this,
                  Invocation.method(#get, [
                    url
                  ], {
                    #body: body,
                    #headers: headers,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> put(String? url,
          {dynamic body,
          Map<String, String>? headers,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#put, [url], {#body: body, #headers: headers, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
                  this,
                  Invocation.method(#put, [
                    url
                  ], {
                    #body: body,
                    #headers: headers,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> patch(String? url,
          {dynamic body,
          Map<String, String>? headers,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#patch, [url], {#body: body, #headers: headers, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
                  this,
                  Invocation.method(#patch, [
                    url
                  ], {
                    #body: body,
                    #headers: headers,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> delete(String? url,
          {dynamic body,
          Map<String, String>? headers,
          _i5.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#delete, [url], {#body: body, #headers: headers, #encoding: encoding}),
              returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
                  this,
                  Invocation.method(#delete, [
                    url
                  ], {
                    #body: body,
                    #headers: headers,
                    #encoding: encoding
                  })))) as _i4.Future<_i2.Response>);
}
