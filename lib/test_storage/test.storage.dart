import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../app.style.dart';
import '../size.config.dart';

class TestStorage extends StatefulWidget {
  const TestStorage({super.key});

  @override
  State<TestStorage> createState() => _TestStorageState();
}

class _TestStorageState extends State<TestStorage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;

  @override
  void initState() {
    loadImages();
    super.initState();
  }

  loadImages() async{
    //usar a ref salva no firebase firestore
    // refs = (await storage.ref('images').listAll()).items;
    refs.add(await storage.ref().child('images/thumb_zQwMGCy4RIO8UoXXWNXP0LwwGix2.jpg'));
    
    for(var ref in refs){
      arquivos.add(await ref.getDownloadURL());
    }
    setState(() {
      loading = false;
    });
  }

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(await snapshot.ref);
          setState(() => uploading = false);
        }
      });
    } else {
      print('erro ao pegar caminho da imagem');
    }
  }

  deleteImage(int index) async {
    var ref = refs[index].fullPath;
    await storage.ref(ref).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kLightWhite,
        appBar: AppBar(
          title: uploading
                      ? Text('${total.round()}% enviado')
                      : const Text('Selecione um arquivo à ser enviado'),
          actions: [
            Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                    child: uploading
                        ? CircularProgressIndicator()
                        : IconButton(
                            icon: Icon(Icons.upload, size: 40),
                            onPressed: pickAndUploadImage,
                          )),
              ),
          ],
        ),
        body: SafeArea(
          child: loading ? Center(child: CircularProgressIndicator()) : Padding(padding: EdgeInsets.all(24),child: 
          arquivos.isEmpty ?
          Center(child: Text('Não ha arquivos a serem exibidos')) :  
          ListView.builder(itemBuilder: (BuildContext context,int index) {
            return ListTile(leading: SizedBox(
              width: 60,
              height: 40,
              child: Image.network(arquivos[index],
              fit: BoxFit.cover,
              ),
            ),
            title: Text(refs[index].fullPath),
            trailing: IconButton(onPressed: () => deleteImage(index), icon: Icon(Icons.delete)),
            );
          },
          itemCount: arquivos.length,
          )
          ,)
        ));
  }
}
