import 'package:estadosapp/bloc/usuario/bloc/usuario_bloc.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                "Establecer Usuario",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                    nombre: "Max",
                    edad: 40,
                    profesiones: ["Flutter daveloper", "Gamer"]);
                usuarioBloc.add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child: Text(
                "Cambiar edad",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(CambiarEdad(10));
              },
            ),
            MaterialButton(
              child: Text(
                "Añadir profesion",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AgregarProfesion("Nueva profesion"));
              },
            )
          ],
        ),
      ),
    );
  }
}
