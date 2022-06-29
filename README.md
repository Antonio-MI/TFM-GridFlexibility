# Grid Flexibility: HVAC energy consumption & temperature prediction

Este repostitorio contiene el código fuente para el desarrollo del Trabajo Fin de Máster: "Técnicas de aprendizaje profundo para la flexibilidad en demanda energética de edificios inteligentes"

## Descripción

- 01.Fichero_AnalisisDescriptivo: Se leen los conjuntos de datos iniciales, se preparan para su utilización y se realiza un análisis descriptivo.

- 02.Modelo_Temp_Base: Explica el proceso para hacer las predicciones de temperatura.

- 02.Modelo_Temp_(model): Ficheros para hacer las pruebas con cada una de las técnicas estudiadas.

- FunciontesTemp: Definidas las funciones que usan los modelos de temperatura.

- 03.Modelo_Consumo: Explica el proceso para hacer las predicciones de consumo.

- 03.Modelo_Consumo_(model): Ficheros para hacer las pruebas con cada una de las técnicas estudiadas.

- FuncionesCons: Definidas las funciones que usan los modelos de consumo.

- csv con todos los conjuntos de datos. *Hay ficheros que debido a su tamaño no se pueden compartir. Están disponibles bajo petición al autor. Estos son: data-hvac, data-room10T, data-room10T-all, data-roomA-10T, data-roomB-10T, data-roomC-10T y data-sensor.

- PruebasResultados: Código de referencia para hacer las gráficas y tablas que aparecen en la memoria.

- /results: directorio con los csv de los resultados de todas las pruebas.

- /best_models: directorio con los modelos (.h5) con mejor rendimiento en cada caso, de los que se han sacado las gráficas y métricas.

- /modelos: directorio con todos los modelos.

- /prev: ficheros desechados de intentos previos y csv que finalmente no se han usado.

- /pics: imágenes de las gráficas extraídas.
