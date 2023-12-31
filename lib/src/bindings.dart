import 'dart:ffi';
import 'dart:io';
import "./openal_generated_bindings.dart";

const String _libName = 'openal';

/// The dynamic library in which the symbols for [OpenALBindings ] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('soft_oal.framework/soft_oal');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('${_libName}32.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final OpenALBindings bindings = OpenALBindings(_dylib);
