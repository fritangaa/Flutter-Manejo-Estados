import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : Text("Pagina 2"),
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
                final nuevoUsuario = new Usuario(
                    nombre: "Max",
                    edad: 45,
                    profesiones: ["Fullstack developer", "Gamer experto"]);
                usuarioService.usuario = nuevoUsuario;
              },
            ),
            MaterialButton(
              child: Text(
                "Cambiar edad",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text(
                "Añadir profesion",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => usuarioService.agregarProfesion(),
            )
          ],
        ),
      ),
    );
  }
}
