import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => usuarioService.removerUsuario(),
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario()
          : Center(
              child: Text("No hay usuario"),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.pushNamed(context, "pagina2");
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "General",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text(usuarioService.usuario.nombre),
          ),
          ListTile(
            title: Text(usuarioService.usuario.edad.toString()),
          ),
          Text(
            "Profesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuarioService
              .usuario.profesiones //restructuracion, poniendo widgets
              .map(
                (profesion) => ListTile(
                  title: Text(profesion),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
