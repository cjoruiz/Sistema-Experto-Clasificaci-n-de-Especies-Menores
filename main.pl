% ======================================================
% ARCHIVO: main.pl  —  SISTEMA EXPERTO UNIFICADO
% Clasificacion Taxonomica de Especies Menores
% Produccion Animal — Pequenos Productores
%
% USO:
%   swipl -l main.pl
%   ?- iniciar.
%
% CONSULTAS DIRECTAS (sin menu):
%   ?- jerarquia(cuy).
%   ?- listar_todas(insecta).
%   ?- info(abeja_nativa).
%   ?- parientes(gallina, L).
%   ?- ancestro_comun(rana, sapo, N).
%   ?- pertenece(hormiga_culona, hymenoptera).
%   ?- categoria(caracol, X).
%   ?- todos.
% ======================================================

:- include('hechos_base.pl').
:- include('reglas_consulta.pl').
:- include('reglas_identificacion.pl').

:- dynamic conocido/2.

:- discontiguous padre_taxonomico/2.
:- discontiguous nombre_taxonomico/2.
:- discontiguous identificar/1.
:- discontiguous es_especie/1.
:- discontiguous consumible/3.

% ======================================================
% PUNTO DE ENTRADA
% ======================================================
iniciar :- menu_principal.

menu_principal :-
    nl,
    write('+====================================================+'), nl,
    write('|     SISTEMA EXPERTO: ESPECIES MENORES              |'), nl,
    write('+====================================================+'), nl,
    write('|  1. Identificar un animal (preguntas)              |'), nl,
    write('|  2. Jerarquia taxonomica de una especie            |'), nl,
    write('|  3. Listar especies de una categoria               |'), nl,
    write('|  4. Informacion completa de una especie            |'), nl,
    write('|  5. Ver todas las especies del sistema             |'), nl,
    write('|  6. Buscar parientes (misma familia)               |'), nl,
    write('|  7. Ancestro comun de dos especies                 |'), nl,
    write('|  8. Verificar pertenencia taxonomica               |'), nl,
    write('|  0. Salir                                          |'), nl,
    write('+====================================================+'), nl,
    nl,
    write('Opcion (escribe numero y punto, ej: 1.): '),
    catch(read(Op), _, (write('Entrada invalida.'), nl, menu_principal)),
    ejecutar(Op).

ejecutar(0) :- nl, write('Hasta luego.'), nl.
ejecutar(1) :- modo_identificacion, menu_principal.
ejecutar(2) :-
    write('Especie (ej: cuy.): '), read(A),
    jerarquia(A), menu_principal.
ejecutar(3) :-
    write('Categoria (mammalia/aves/amphibia/reptilia/insecta/mollusca/chondrichthyes.): '),
    read(C), listar_todas(C), menu_principal.
ejecutar(4) :-
    write('Especie (ej: abeja_nativa.): '), read(A),
    info(A), menu_principal.
ejecutar(5) :- todos, menu_principal.
ejecutar(6) :-
    write('Especie (ej: gallina.): '), read(A),
    (parientes(A, Lista) ->
        format("Parientes de ~w (misma familia): ~w~n", [A, Lista])
    ;   write('No se encontraron parientes o especie no valida.'), nl),
    menu_principal.
ejecutar(7) :-
    write('Primera especie  (ej: rana.): '), read(A),
    write('Segunda especie  (ej: sapo.): '), read(B),
    (ancestro_comun(A, B, _) -> true
    ;   write('No se encontro ancestro comun.'), nl),
    menu_principal.
ejecutar(8) :-
    write('Especie   (ej: cuy.): '), read(A),
    write('Categoria (ej: rodentia.): '), read(C),
    (pertenece(A, C) ->
        format("SI: ~w pertenece a ~w~n", [A, C])
    ;   format("NO: ~w no pertenece a ~w~n", [A, C])),
    menu_principal.
ejecutar(_) :-
    write('Opcion no valida.'), nl, menu_principal.

% ======================================================
%  IDENTIFICACION
% ======================================================
modo_identificacion :-
    retractall(conocido(_, _)),
    nl,
    write('+====================================================+'), nl,
    write('|     IDENTIFICACION DE ANIMAL POR PREGUNTAS         |'), nl,
    write('+====================================================+'), nl,
    nl,
    (identificar(Animal) ->
        reporte_final(Animal)
    ;
        nl,
        write('No se pudo identificar el animal.'), nl,
        write('Verifica que tus respuestas sean consistentes.'), nl
    ).

% Motor memoizado: no repite preguntas ya respondidas
tiene(Atributo, Valor) :-
    conocido(Atributo, Valor), !.
tiene(Atributo, _) :-
    conocido(Atributo, _), !, fail.
tiene(Atributo, Valor) :-
    preguntar(Atributo, Respuesta),
    assertz(conocido(Atributo, Respuesta)),
    Respuesta == Valor.

preguntar(Atributo, Respuesta) :-
    pregunta(Atributo, Texto),
    write(Texto), nl,
    write('> '),
    catch(
        read(Respuesta),
        _,
        (write('Entrada invalida. Escribe la respuesta seguida de punto. Ej: si.'), nl, fail)
    ).

% ======================================================
% REPORTE FINAL DEL AKINATOR
% ======================================================
reporte_final(Animal) :-
    nl,
    write('+======================================================+'), nl,
    write('|              ESPECIE IDENTIFICADA                    |'), nl,
    write('+======================================================+'), nl,
    nombre_taxonomico(Animal, NC),
    write('  '), write(NC), nl,
    write('+------------------------------------------------------+'), nl,
    write('  CLASIFICACION TAXONOMICA:'), nl,
    obtener_taxonomia(Animal, Linea),
    imprimir_linea(Linea),
    write('+------------------------------------------------------+'), nl,
    write('  PERFIL ECOLOGICO:'), nl,
    habitat(Animal, H), write('    Habitat  : '), write(H), nl,
    dieta(Animal,   D), write('    Dieta    : '), write(D), nl,
    write('+------------------------------------------------------+'), nl,
    write('+------------------------------------------------------+'), nl,
    write('  UTILIDAD PARA PEQUENOS PRODUCTORES:'), nl,
    utilidad(Animal, U), write('    '), write(U), nl,
    write('+======================================================+'), nl.

% ======================================================
% BANCO DE PREGUNTAS
% ======================================================
pregunta(vertebrado,
    'Tiene columna vertebral (esqueleto interno)?              (si/no)').
pregunta(tegumento,
    'Que cubre su cuerpo?       (pelaje/plumas/piel_humeda/escamas)').
pregunta(orejas_largas,
    'Sus orejas son mas largas que su propia cabeza?           (si/no)').
pregunta(muy_pequeno,
    'Cabe facilmente en ambas manos (mas pequeno que un gato)? (si/no)').
pregunta(hocico_disco,
    'Tiene hocico redondeado en forma de disco, como un cerdo? (si/no)').
pregunta(cuernos_o_barba,
    'Tiene cuernos o barba colgante prominente?                (si/no)').
pregunta(lana_densa,
    'Tiene lana densa y rizada (vellon)?                       (si/no)').
pregunta(nada,
    'Nada habitualmente y tiene pico ancho y plano?            (si/no)').
pregunta(ave_pequena,
    'El ave es pequeña, similar a un puno cerrado?             (si/no)').
pregunta(cuello_iridiscente,
    'Su cuello tiene reflejos iridiscentes (brillos de color)? (si/no)').
pregunta(puntos_blancos,
    'Tiene plumaje oscuro cubierto de multiples puntos blancos?(si/no)').
pregunta(cola_abanico,
    'Puede desplegar la cola en abanico vistoso?               (si/no)').
pregunta(piel_lisa,
    'Su piel es completamente lisa (sin verrugas ni bultos)?   (si/no)').
pregunta(tiene_caparazon,
    'Tiene caparazon duro que protege su cuerpo?               (si/no)').
pregunta(seis_patas,
    'Tiene exactamente seis patas (insecto)?                   (si/no)').
pregunta(vuela,
    'Puede volar con alas?                                     (si/no)').
pregunta(produce_miel,
    'Produce miel en colmenas o nidos?                         (si/no)').
pregunta(tiene_aguijon,
    'Tiene aguijon y puede picar con el?                       (si/no)').
pregunta(tiene_concha,
    'Tiene concha o valva externa?                             (si/no)').
pregunta(concha_espiral,
    'La concha es en espiral (una sola pieza enrollada)?       (si/no)').
pregunta(vive_en_agua,
    'Vive y se desplaza principalmente dentro del agua?        (si/no)').
pregunta(tiene_trompa,
    'Tiene trompa larga y flexible?                            (si/no)').