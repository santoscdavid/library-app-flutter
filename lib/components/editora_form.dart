import 'package:flutter/material.dart';
import 'package:livraria_mobile/models/editora.dart';
import 'package:livraria_mobile/provider/editora_provider.dart';
import 'package:provider/provider.dart';

class EditoraForm extends StatefulWidget {
  const EditoraForm({Key? key}) : super(key: key);

  @override
  _EditoraFormState createState() => _EditoraFormState();
}

class _EditoraFormState extends State<EditoraForm> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late final String? Function(String? text)? validator;
  late final void Function(String? text)? onSaved;

  late TextEditingController _nomeController;
  late TextEditingController _cidadeController;
  final _cidadeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _cidadeController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final editora = arg as Editora;
        _formData['nome'] = editora.nome;
        _formData['cidade'] = editora.cidade;
      }
    }
  }

  titleChange() {
    if (_formData['id'] != null) {
      return const Text(
        'Editar Editora',
      );
    } else {
      return const Text(
        'Cadastrar Editora',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: titleChange(),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    initialValue: _formData['nome'],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.text_fields_outlined,
                      ),
                      labelText: 'Nome da Editora',
                      // filled: true,
                      isDense: true,
                    ),
                    controller: _nomeController,
                    autocorrect: true,
                    validator: (_nome) {
                      final nome = _nome ?? '';
                      if (nome.trim().isEmpty) {
                        return 'Nome é obrigatório.';
                      }
                      if (nome.trim().length < 3) {
                        return 'O nome precisa no mínimo 3 letras.';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['nome'] = value!,
                    onFieldSubmitted: (_) =>
                        {FocusScope.of(context).requestFocus(_cidadeFocus)},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      initialValue: _formData['cidade'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.location_city,
                        ),
                        labelText: 'Cidade da Editora',
                        // filled: true,
                        isDense: true,
                      ),
                      focusNode: _cidadeFocus,
                      controller: _cidadeController,
                      onSaved: (value) => _formData['cidade'] = value!,
                      textInputAction: TextInputAction.done,
                      validator: (_cidade) {
                        final cidade = _cidade ?? '';
                        if (cidade.trim().isEmpty) {
                          return 'Cidade é obrigatório.';
                        }
                        if (cidade.trim().length < 3) {
                          return 'A cidade precisa no mínimo 3 letras.';
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Provider.of<EditoraProvider>(context, listen: false)
                            .save(Editora(
                                nome: _formData['nome'],
                                cidade: _formData['cidade']));
                        print(_formData['nome']);
                        print(_formData['cidade']);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.save),
                        Text("Cadastrar"),
                      ],
                    ),
                  )
                ],
              ))),
        )));
  }
}
