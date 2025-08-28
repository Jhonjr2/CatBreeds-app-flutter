# 🐱 Catbreeds - Aplicación Flutter

Una aplicación móvil hermosa y moderna que muestra razas de gatos utilizando The Cat API.

## ✨ Características

### 🎨 **Diseño Moderno y Colorido**
- **Gradientes vibrantes** con colores modernos (azul, púrpura, rosa)
- **Animaciones suaves** y transiciones elegantes
- **Sombras y efectos** para una experiencia visual rica
- **Tipografía moderna** con diferentes pesos y tamaños

### 📱 **4 Pantallas Principales**

#### 1. **Pantalla de Splash** 🌟
- Animaciones de entrada con fade y escala
- Gradiente de fondo multicolor
- Icono de gato estilizado
- Transición automática a la pantalla principal después de 3 segundos

#### 2. **Pantalla de Landing** 🏠
- Header con título "Catbreeds" y subtítulo descriptivo
- Barra de búsqueda integrada con diseño moderno
- Filtros de origen con chips coloridos
- Grid de tarjetas de razas con información detallada
- Pull-to-refresh para actualizar datos

#### 3. **Pantalla de Detalle** 🔍
- Imagen de fondo expandible con SliverAppBar
- Información completa de la raza
- Características destacadas (temperamento, energía, inteligencia)
- Enlace a Wikipedia integrado
- Diseño scrollable solo en la información (imagen fija)

#### 4. **Pantalla de Scroll** 📜
- Scroll solo en la información de la raza
- Imagen principal fija en la parte superior
- Información detallada organizada en secciones

### 🚀 **Funcionalidades Técnicas**

#### **Arquitectura Clean Architecture**
- **Domain Layer**: Entidades, repositorios y casos de uso
- **Data Layer**: Implementación de repositorios y fuentes de datos
- **Presentation Layer**: BLoC pattern para gestión de estado

#### **Gestión de Estado**
- **Flutter BLoC** para manejo de estado reactivo
- **Eventos y Estados** bien definidos para cada operación
- **Filtrado y búsqueda** en tiempo real

#### **Integración con API**
- **The Cat API** para obtener datos de razas
- **Retrofit** para llamadas HTTP tipadas
- **Cached Network Image** para imágenes optimizadas
- **Manejo de errores** robusto

#### **Inyección de Dependencias**
- **GetIt** para gestión de dependencias
- **Injectable** para generación automática de código
- **Configuración automática** de servicios

### 🎯 **Características de UX**

#### **Búsqueda y Filtrado**
- Búsqueda en tiempo real por nombre o descripción
- Filtros por país de origen
- Resultados instantáneos

#### **Navegación Intuitiva**
- Transiciones suaves entre pantallas
- Botones de navegación claros
- Gestos táctiles naturales

#### **Estados de Carga**
- Indicadores de carga atractivos
- Manejo de errores con opciones de reintento
- Estados vacíos informativos

## 🛠️ **Tecnologías Utilizadas**

- **Flutter 3.5+** - Framework de UI
- **Dart** - Lenguaje de programación
- **Flutter BLoC** - Gestión de estado
- **Retrofit** - Cliente HTTP
- **GetIt** - Inyección de dependencias
- **Cached Network Image** - Caché de imágenes
- **Equatable** - Comparación de objetos
- **Dartz** - Programación funcional

## 📱 **Compatibilidad**

- **Android**: API 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Navegadores modernos
- **Desktop**: Windows, macOS, Linux

## 🚀 **Instalación y Ejecución**

### **Prerrequisitos**
- Flutter SDK 3.5.0 o superior
- Dart SDK 3.5.0 o superior
- Android Studio / VS Code
- Emulador Android o dispositivo físico

### **Pasos de Instalación**

1. **Clonar el repositorio**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd prueba_tecnica
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Generar código**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

### **Compilación para Producción**

#### **APK de Android**
```bash
flutter build apk --release
```

#### **App Bundle de Android**
```bash
flutter build appbundle --release
```

#### **iOS**
```bash
flutter build ios --release
```

## 🎨 **Paleta de Colores**

- **Azul Principal**: `#667eea`
- **Púrpura**: `#764ba2`
- **Rosa**: `#f093fb`
- **Amarillo**: `#ffd93d`
- **Violeta**: `#6c5ce7`

## 📋 **Estructura del Proyecto**

```
lib/
├── app.dart                          # Punto de entrada de la aplicación
├── main.dart                         # Configuración principal
├── core/                             # Capa de infraestructura
│   ├── di/                          # Inyección de dependencias
│   ├── errors/                      # Manejo de errores
│   ├── network/                     # Cliente HTTP
│   ├── theme/                       # Temas de la aplicación
│   └── utils/                       # Utilidades
└── features/                         # Características de la aplicación
    └── cat_breeds/                  # Módulo de razas de gatos
        ├── data/                     # Capa de datos
        ├── domain/                   # Capa de dominio
        └── presentation/             # Capa de presentación
            ├── bloc/                 # Gestión de estado
            ├── pages/                # Pantallas
            └── widgets/              # Widgets reutilizables
```

## 🔧 **Configuración de API**

La aplicación utiliza The Cat API. Para configurar tu propia API key:

1. Visita [The Cat API](https://thecatapi.com/)
2. Regístrate para obtener una API key gratuita
3. Reemplaza la API key en `lib/core/network/dio_client.dart`

## 📸 **Capturas de Pantalla**

### **Pantalla de Splash**
- Animación de entrada con gradiente multicolor
- Icono de gato estilizado
- Transición automática

### **Pantalla Principal**
- Header con título y búsqueda
- Filtros de origen
- Grid de tarjetas de razas

### **Pantalla de Detalle**
- Imagen expandible
- Información completa de la raza
- Características destacadas

## 🤝 **Contribución**

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 **Licencia**

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 🙏 **Agradecimientos**

- **The Cat API** por proporcionar datos de razas de gatos
- **Flutter Team** por el framework increíble
- **Comunidad Flutter** por el apoyo y recursos

## 📞 **Contacto**

- **Desarrollador**: [Tu Nombre]
- **Email**: [tu.email@ejemplo.com]
- **Proyecto**: [https://github.com/usuario/prueba_tecnica](https://github.com/usuario/prueba_tecnica)

---

⭐ **¡Dale una estrella al proyecto si te gustó!** ⭐
