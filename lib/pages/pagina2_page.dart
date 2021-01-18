import 'package:estadosapp/bloc/usuario/usuario_cubit.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);

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
                    edad: 30,
                    profesiones: ["fullstack developer", "gamer profesional"]);

                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child: Text(
                "Cambiar edad",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(15);
              },
            ),
            MaterialButton(
              child: Text(
                "Añadir profesion",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            )
          ],
        ),
      ),
    );
  }
}
