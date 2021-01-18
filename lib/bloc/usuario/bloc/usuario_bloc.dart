import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print(event);

    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      final listaProfesiones = [...state.usuario.profesiones, event.profesion];
      yield state.copyWith(
          usuario: state.usuario.copyWith(profesiones: listaProfesiones));
    } else if (event is BorrarUsuario) {
      yield state.estadoInicial();
    }
  }
}
