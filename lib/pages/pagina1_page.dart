import 'package:estadosapp/bloc/usuario/usuario_cubit.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () =>
                BlocProvider.of<UsuarioCubit>(context).borrarUsuario(),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          Navigator.pushNamed(context, "pagina2");
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        // print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(
              child: Text("No hay infromacion"),
            );
            break;

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
            break;

          default:
            return Center(
              child: Text("Estado no reconocido"),
            );
        }
      },
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
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
