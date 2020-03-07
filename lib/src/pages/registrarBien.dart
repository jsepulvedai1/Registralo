import 'package:flutter/material.dart';
import 'package:image_form_field/image_form_field.dart';
import 'utils/upload_button.dart';
import 'utils/image_input_adapter.dart';
import 'utils/bien_image_model.dart';

class _RegristrarBien extends StatefulWidget {
  _RegristrarBien(
    this.existingImages
  );

  final List<BlogImage> existingImages;

  @override
  State<StatefulWidget> createState() => _RegistrarBienState();
}

class _RegistrarBienState extends State<_RegristrarBien> {
  final _formKey = GlobalKey<FormState>();
  List<ImageInputAdapter> _images;

  void submit() {
    if( _formKey.currentState.validate() ) {
      _formKey.currentState.save();
      var snackbarText = "Upload successful";

      try {
        // New images
        _images
          ?.where((i) => i.isFile)
          ?.forEach((i) async {
            final photo = await i.save();

            BlogImage(
              storagePath: photo.refPath,
              originalUrl: photo.originalUrl,
              bucketName: photo.bucketName
            ).create();
          });

        // Removed images
        widget.existingImages
          ?.where((r) =>
            !_images.any((m) => m.url == r.originalUrl)
          )
          ?.forEach((i) {
            BlogImage.fromUrl(i.originalUrl).then((b) => b?.delete());
          });

      } catch(e) {
        print(e);
        snackbarText = "Couldn't save. Please try again later.";
      } finally {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarText)
          )
        );
      }
    }
  }

  
  @override
  Widget build(BuildContext context) {
    final bool shouldAllowMultiple = true;
    return Scaffold(
        backgroundColor: Color.fromRGBO(140, 208, 242, 1),
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/registrarBien.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Color.fromRGBO(140, 208, 242, 1),
        ),
        body: Container(
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                ImageFormField<ImageInputAdapter>(
                  shouldAllowMultiple: shouldAllowMultiple,
                  onSaved: (val) => _images = val,
                  initialValue: widget.existingImages.map((i) => ImageInputAdapter(url: i.originalUrl)).toList().cast<ImageInputAdapter>(),
                  initializeFileAsImage: (file) =>
                    ImageInputAdapter(file: UploadableImage(file, storagePath: "appImages")),
                  buttonBuilder: (_, count) =>
                    PhotoUploadButton(
                      count: count,
                      shouldAllowMultiple: shouldAllowMultiple
                    ),
                  previewImageBuilder: (_, image) => image.widgetize()
                )
                // Add TextFormFields and RaisedButton here.
              ])),
        ));
  }
}
