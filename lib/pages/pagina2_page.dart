import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usuarioService.usuarioStream,
      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
        return (snapshot.hasData)
            ? PantallaCompleta(snapshot.data.nombre)
            : PantallaCompleta("Pagina 2");
      },
    );
  }
}

class PantallaCompleta extends StatelessWidget {
  final String titulo;

  const PantallaCompleta(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titulo),
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
                final nuevoUsuario = new Usuario(nombre: "Max", edad: 24);
                usuarioService.cargarUsuario(nuevoUsuario);
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
