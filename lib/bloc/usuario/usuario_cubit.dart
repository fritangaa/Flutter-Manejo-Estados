import 'package:estadosapp/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesion = [
        ...currentState.usuario.profesiones,
        "Profesion ${currentState.usuario.profesiones.length + 1}"
      ];
      //int tamanioLista = currentState.usuario.profesiones.length;
      //List<String> temp = currentState.usuario.profesiones;
      //temp.add("Profesion ${tamanioLista + 1}");
      final newUser = currentState.usuario.copyWith(profesiones: newProfesion);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
