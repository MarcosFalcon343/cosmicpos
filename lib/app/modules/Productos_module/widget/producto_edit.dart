import 'dart:io';
import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/models/Productos/producto.dart';
import 'package:cosmicpos/app/modules/Categorias_module/controller_categoria.dart';
import 'package:cosmicpos/app/modules/Productos_module/productos_controller.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/proveedor_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductoEdit extends StatefulWidget {
  const ProductoEdit({super.key, required this.producto});
  final Producto producto;

  @override
  State<ProductoEdit> createState() => _ProductoFormState();
}

class _ProductoFormState extends State<ProductoEdit> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final _picker = ImagePicker();
  List<Categoria> _categorias = [];
  List<Proveedor> _proveedores = [];

  int idCategoria = -1;
  int idProveedor = -1;
  int idTipo = 1;

  TextEditingController skuController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController costoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  ProductoController controller = ProductoController();

  void close() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    skuController.text = widget.producto.sku;
    nombreController.text = widget.producto.nombre;
    precioController.text = widget.producto.precio.toString();
    costoController.text = widget.producto.costo.toString();
    descripcionController.text = widget.producto.descripcion as String;
    _cargar();
  }

  Future<void> _cargar() async {
    _categorias = await CategoriaController().cargarCategorias();
    _proveedores = await ProveedorController().cargarProvedores();
    setState(() {});
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  List<DropdownMenuItem<int>> _buildCategoriasMenuItems() {
    return _categorias
        .map((categoria) => DropdownMenuItem<int>(
            value: categoria.key, child: Text(categoria.nombre)))
        .toList();
  }

  List<DropdownMenuItem<int>> _buildProveedorMenuItems() {
    return _proveedores
        .map((proveedor) => DropdownMenuItem<int>(
            value: proveedor.key,
            child: Text(
                '${proveedor.nombreComercial}: ${proveedor.nombres} ${proveedor.apellidoPaterno}')))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => close(),
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text(
            'Actualizar producto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: skuController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('SKU *'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un sku válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                          label: Text('Nombre *'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un nombre válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: precioController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Precio'),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.attach_money),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El precio es obligatorio';
                          }

                          try {
                            double precio = double.parse(value);
                            if (precio <= 0) {
                              return 'El precio debe ser mayor a 0';
                            }
                          } catch (e) {
                            return 'El precio debe ser un número';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: costoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Costo'),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.attach_money),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El costo es obligatorio';
                          }

                          try {
                            double precio = double.parse(value);
                            if (precio <= 0) {
                              return 'El costo debe ser mayor a 0';
                            }
                          } catch (e) {
                            return 'El costo debe ser un número';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('Pieza'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('Granel'),
                          ),
                        ],
                        onChanged: (value) {},
                        value: 1,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Tipo de producto *')),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField(
                        value: null,
                        items: _buildCategoriasMenuItems(),
                        onChanged: (value) {
                          idCategoria = value as int;
                        },
                        decoration: const InputDecoration(
                          label: Text('Categoria *'),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, ingresa un categoria válida.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField(
                        value: null,
                        items: _buildProveedorMenuItems(),
                        onChanged: (value) {
                          idProveedor = value as int;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Proveedor *')),
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor, ingresa un proveedor válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        width: 150,
                        color: Colors.grey[300],
                        child: _image != null
                            ? Image.file(_image!, fit: BoxFit.cover)
                            : const Text(
                                'Selecciona una imagen',
                                textAlign: TextAlign.center,
                              ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilledButton.icon(
                              onPressed: _openImagePicker,
                              icon: const Icon(Icons.image),
                              label: const Text('Abrir galeria')),
                          const SizedBox(width: 15),
                          IconButton.filled(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: descripcionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          label: Text('Descripcion '),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          FilledButton(
                            child: const Text('Guardar'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.producto.sku = skuController.text;
                                widget.producto.nombre = nombreController.text;
                                widget.producto.precio =
                                    double.parse(precioController.text);
                                widget.producto.costo =
                                    double.parse(costoController.text);
                                widget.producto.estado = 'ACTIVO';
                                widget.producto.descripcion =
                                    descripcionController.text;
                                widget.producto.categoria =
                                    _categorias[idCategoria];
                                widget.producto.proveedor =
                                    _proveedores[idProveedor];
                                controller.actualizarProducto(
                                    widget.producto.key, widget.producto);
                                Navigator.of(context).pop(1);
                              }
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
