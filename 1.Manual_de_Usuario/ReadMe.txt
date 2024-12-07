# Proyecto Arroz: Análisis y Modelos Predictivos

Este proyecto utiliza técnicas de análisis de datos y aprendizaje automático para realizar predicciones relacionadas con el cultivo de arroz. Incluye scripts, modelos entrenados, y datos de prueba organizados de manera estructurada.

## Estructura del Proyecto

El proyecto está organizado en las siguientes carpetas:

### 1. **Base_de_datos**
   - Contiene los datos utilizados para entrenar y probar los modelos.
   - Subcarpeta:
     - `Train_data/`: Base de datos de entrenamiento.

### 2. **Presentación**
   - Incluye las diapositivas que explican el desarrollo y resultados del proyecto.
   - Archivo:
     - `Diapositivas.pdf`

### 3. **Scripts**
   - Contiene los códigos fuente y modelos entrenados:
     - `ANN_Arroz.m`: Implementación de una red neuronal para predicción.
     - `Extraccion_caracteristicas.m`: Código para extracción de características del conjunto de datos.
     - `PreAnalisis_Segm_Morfologia.m`: Script para análisis previo y segmentación morfológica.
     - `RF_Arroz.m`: Implementación de un modelo de Random Forest.
     - `ANN_model89.mat`: Modelo entrenado para la red neuronal.
     - `RF_model97.mat`: Modelo entrenado para Random Forest.

### 4. **Manual_de_Usuario**
   - Documentación para guiar el uso de los scripts y modelos.
   - Archivo:
     - `ReadMe.txt`: Manual de usuario con instrucciones detalladas.

---

## Requisitos

Para ejecutar este proyecto, asegúrate de tener los siguientes componentes instalados:

- **MATLAB**: Versión compatible con los scripts provistos.
- Librerías adicionales según sea necesario (detalladas en los scripts).

---

## Uso

1. **Base de Datos**:
   - Asegúrate de que los datos estén en la carpeta `Base_de_datos/Train_data/`.
   - Los datos deben seguir el formato especificado en los scripts.

2. **Ejecutar Scripts**:
   - Abre MATLAB y navega a la carpeta `Scripts/`.
   - Corre los scripts en el orden indicado según la funcionalidad deseada:
     - Preprocesamiento: `PreAnalisis_Segm_Morfologia.m`
     - Extracción de características: `Extraccion_caracteristicas.m`
     - Modelos predictivos: `ANN_Arroz.m`, `RF_Arroz.m`.

3. **Resultados**:
   - Los resultados se generarán en el espacio de trabajo de MATLAB y, en algunos casos, se guardarán en archivos de salida.

---

## Enlaces Útiles

- [Base de Datos](https://github.com/usuario/repositorio/tree/main/Base_de_datos)
- [Scripts](https://github.com/usuario/repositorio/tree/main/Scripts)
- [Presentación](https://github.com/usuario/repositorio/tree/main/Presentacion)
- [Manual de Usuario](https://github.com/usuario/repositorio/tree/main/Manual_de_Usuario)

---

## Contacto

Para consultas o soporte relacionado con este proyecto, por favor contacta a:  
**Nombres:** Alex Salgado Flórez, Natalia Morelo Castro  
**Email:** asalgado.0523@gmail.com, nmorelocastro@gmail.com
