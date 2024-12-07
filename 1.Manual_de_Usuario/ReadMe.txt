# Proyecto Arroz

Este proyecto está enfocado en el análisis, procesamiento y modelado de datos relacionados con distintos tipos de arroz. Utiliza técnicas de aprendizaje automático como Redes Neuronales Artificiales (ANN) y Random Forest (RF) para tareas de clasificación.

## Estructura del Proyecto

El proyecto está organizado en las siguientes carpetas:

### 1. Manual_de_Usuario
- Contiene documentos de referencia y manuales que explican cómo usar los scripts y modelos del proyecto.
- Archivos esperados:
  - `ReadMe.txt`: Manual de usuario con instrucciones detalladas.

### 2. Base_de_datos
- Contiene las bases de datos utilizadas en el proyecto.
- Subcarpeta principal:
  - `Train_data/`: Conjunto de datos para entrenamiento y pruebas.

### 3. Scripts
- Incluye los scripts y modelos necesarios para ejecutar el análisis y las predicciones.
- Archivos principales:
  - `ANN_Arroz.m`: Implementación de una red neuronal artificial.
  - `Extraccion_caracteristicas.m`: Extracción de características del conjunto de datos.
  - `PreAnalisis_Segm_Morfologia.m`: Script para análisis previo y segmentación.
  - `RF_Arroz.m`: Implementación del modelo de Random Forest.
  - `ANN_model89.mat`: Modelo entrenado para la red neuronal.
  - `RF_model97.mat`: Modelo entrenado para Random Forest.

### 4. Presentación
- Incluye la documentación visual del proyecto, como diapositivas de presentación.
- Archivos esperados:
  - `Diapositivas.pdf`: Presentación con detalles sobre los objetivos, metodología, resultados y conclusiones del proyecto.

---

## Requisitos

Para ejecutar este proyecto necesitas:
- **MATLAB**: Herramienta principal para ejecutar los scripts y modelos.
- Bases de datos organizadas en la carpeta `2.Base_de_datos/Train_data`.
- Un entorno con capacidad para manejar archivos `.m` y `.mat`.

---

## Instrucciones

1. **Preprocesamiento**:
   - Usa `PreAnalisis_Segm_Morfologia.m` para realizar el análisis inicial y segmentación de datos.

2. **Extracción de Características**:
   - Corre el script `Extraccion_caracteristicas.m` para generar las variables relevantes del modelo.

3. **Entrenamiento y Evaluación**:
   - Usa `ANN_Arroz.m` para entrenar y evaluar la red neuronal.
   - Usa `RF_Arroz.m` para entrenar y evaluar el modelo de Random Forest.

4. **Presentación**:
   - Revisa `4.Presentación/Diapositivas.pdf` para un resumen visual del proyecto.

---

## Enlaces Clave

- [Manual de Usuario](./1.Manual_de_Usuario/)
- [Base de Datos](./2.Base_de_datos/)
- [Scripts](./3.Scripts/)
- [Presentación](./4.Presentación/)

---## Contacto

Para consultas o soporte relacionado con este proyecto, por favor contacta a:  
**Nombres:** Alex Salgado Flórez, Natalia Morelo Castro  
**Email:** asalgado.0523@gmail.com, nmorelocastro@gmail.com
