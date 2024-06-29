# Prueba Tecnica netforemost

## Descripción
Este proyecto es una aplicación Flutter que gestiona artículos. Incluye funcionalidades para obtener artículos desde una API en MongoDB Atlas y mostrarlos en una lista

## Características
- Obtención de artículos desde un endpoint de API.
- Visualización de artículos en una lista usando `ListView.builder`.
- Implementación de funcionalidad de búsqueda para filtrar artículos por título.
- Uso de `RefreshIndicator` para actualizar la lista de artículos al hacer pull-to-refresh.
- Uso de TypeScript para asegurar tipos estáticos durante el desarrollo.
- Integración con MongoDB Atlas para almacenamiento de datos.
- la url de Mongo es la siguiente (al ser una prueba es mas practico ponerlo aqui) : mongodb+srv://brianlopezmedina12:dsg4LEX3N9Pp4t2v@clusternetforemostpt.yanr1vb.mongodb.net/?appName=ClusterNetForemostPT
- Utilice 'npm i' para instalar las dependencias necesarias

- Para correr el proyecto en flutter debe configurar el archivo 'common.dart' ubicado en lib/config y tener el API corriendo en su maquina 'npm run dev' (especificar puerto a utilizar en el .env que debe ser creado)

- Se integraron test en Flutter, se encuentran en la carpeta de test y pueden ser ejecutados con 'flutter test'

- ESTA APLICACION SE PROBO EN UN DISPOSITIVO VIRTUAL PIXEL 6 PRO

- Para correr el proyecto de flutter ubiquese en lib/main.dart y ejecute el archivo, o use flutter run

## Tecnologías Utilizadas
- **Flutter**: Framework para construir aplicaciones multiplataforma.
- **Dart**: Lenguaje de programación usado con Flutter.
- **Node.js**: Entorno de ejecución para JavaScript.
- **Express.js**: Framework web para Node.js utilizado en la API.
- **TypeScript**: Superset de JavaScript que proporciona tipos estáticos.
- **MongoDB Atlas**: Servicio de base de datos en la nube utilizada para almacenar los artículos.
- **Mongoose**: ODM (Object-Document Mapper) para MongoDB y Node.js.
- **Paquete HTTP**: Para realizar peticiones HTTP y obtener datos.
- **Serialización JSON**: Convertir datos JSON a objetos Dart.
- **Multer**: Middleware para Node.js que facilita el manejo de archivos en aplicaciones web basadas en Express.js

## Estructura del Proyecto FLUTTER 
- `lib/`
  - `app/controllers/home_controller.dart`: Contiene la lógica para obtener artículos.
  - `resources/pages/home/`
    - `bloc/home_bloc.dart`: Gestiona el estado para la página principal.
    - `home_page.dart`: Interfaz y lógica principal para mostrar artículos y la funcionalidad de búsqueda.
   
## Estructura del Proyecto NODEJS
- `src/`
  - `index.ts`: Archivo principal de la aplicación que configura el servidor Express y define los endpoints de la API.
  - `models/`: Contiene los modelos de Mongoose para los artículos.
  - `routes/`: Define las rutas de la API para los artículos.
  - `services/`: Contiene la lógica de servicios para gestionar las operaciones de los artículos.


## Empezando
1. Clona el repositorio:
   ```bash
   git clone <url_del_repositorio>
