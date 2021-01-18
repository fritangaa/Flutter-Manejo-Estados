import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(usuarioService.usuario)
              : Center(
                  child: Text("No hay informacion"),
                );
        },
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
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
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
            title: Text(usuario.nombre),
          ),
          ListTile(
            title: Text(usuario.edad.toString()),
          ),
          Text(
            "Profesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text("Profesion 1"),
          ),
          ListTile(
            title: Text("Profesion 2"),
          ),
        ],
      ),
    );
  }
}
