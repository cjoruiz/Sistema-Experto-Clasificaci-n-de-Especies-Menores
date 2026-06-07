# Sistema Experto: Clasificación de Especies Menores

Sistema experto desarrollado en **SWI-Prolog** para la clasificación taxonómica e identificación de especies menores de interés en producción animal para pequeños productores.

## Requisitos

- [SWI-Prolog](https://www.swi-prolog.org/) (probado con version 8.x+)

## Uso

```bash
swipl -l main.pl
```

Una vez cargado, ejecutar:

```prolog
?– iniciar.
```

Esto despliega un menú interactivo con las siguientes opciones:

1. Identificar un animal (mediante preguntas)
2. Ver jerarquía taxonómica de una especie
3. Listar especies de una categoría
4. Información completa de una especie
5. Ver todas las especies del sistema
6. Buscar parientes (misma familia)
7. Ancestro común de dos especies
8. Verificar pertenencia taxonómica

### Consultas directas (sin menú)

```prolog
?– jerarquia(cuy).
?– listar_todas(insecta).
?– info(abeja_nativa).
?– parientes(gallina, L).
?– ancestro_comun(rana, sapo, N).
?– pertenece(hormiga_culona, hymenoptera).
?– categoria(caracol, X).
?– todos.
```

## Estructura del proyecto

| Archivo | Descripción |
|---|---|
| `main.pl` | Punto de entrada, menú interactivo, motor de preguntas e identificación |
| `hechos_base.pl` | Base de conocimiento: jerarquía taxonómica, nombres científicos, atributos ecológicos y productivos |
| `reglas_consulta.pl` | Reglas de consulta: pertenencia, listado, jerarquía, información, parientes, ancestro común |
| `reglas_identificacion.pl` | Reglas de identificación por atributos físicos para cada especie |

## Especies incluidas (25)

**Mamíferos:** cerdo, cabra, oveja, conejo, cuy, tepezcuintle, elefante, ballena

**Aves:** gallina, pavo, codorniz, gallina de guinea, pato, paloma

**Anfibios:** rana, sapo

**Reptiles:** iguana, tortuga de agua

**Insectos:** abeja, abeja nativa, hormiga culona, mariposa

**Moluscos:** caracol, almeja

**Condrictios:** tiburón

## Taxonomía representada

Para cada especie se almacena su clasificación completa: Reino → Filo → Clase → Orden → Familia → Género → Especie.

Además, cada especie incluye:

- **Nombre científico**
- **Habitat** (terrestre, semiacuático, acuático, arbóreo)
- **Dieta** (herbívoro, omnívoro, granívoro, insectívoro, polinizador, filtrador, carnívoro)
- **Utilidad** para pequeños productores (carne, leche, huevos, miel, control biológico, etc.)
