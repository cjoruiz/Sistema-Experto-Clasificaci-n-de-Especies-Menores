% ======================================================
% ARCHIVO: reglas_consulta.pl
% Consultas taxonómicas — Sistema Experto Especies Menores
% ======================================================

:- discontiguous es_especie/1.

% ============================================================
% REGISTRO DE ESPECIES VÁLIDAS (22 especies)
% ============================================================
es_especie(cerdo).          es_especie(cabra).
es_especie(oveja).          es_especie(conejo).
es_especie(cuy).            es_especie(tepezcuintle).
es_especie(gallina).        es_especie(pavo).
es_especie(codorniz).       es_especie(gallina_guinea).
es_especie(pato).           es_especie(paloma).
es_especie(rana).           es_especie(sapo).
es_especie(iguana).         es_especie(tortuga_agua).
es_especie(abeja).          es_especie(abeja_nativa).
es_especie(hormiga_culona). es_especie(mariposa).
es_especie(caracol).        es_especie(almeja).
es_especie(ballena).
es_especie(tiburon).
es_especie(elefante).
% ============================================================
% 1. VERIFICAR PERTENENCIA A UN NIVEL TAXONÓMICO
%    ?- pertenece(cuy, rodentia).
%    ?- pertenece(abeja, arthropoda).
% ============================================================
pertenece(Animal, Taxon) :-
    padre_taxonomico(Animal, Taxon).
pertenece(Animal, Taxon) :-
    padre_taxonomico(Animal, Inter),
    pertenece(Inter, Taxon).

% ============================================================
% 2. LISTAR ESPECIES DE UNA CATEGORÍA
%    ?- listar_todas(insecta).
%    Categorías: mammalia, aves, amphibia, reptilia, insecta, mollusca
% ============================================================
listar_todas(Categoria) :-
    nl,
    write('Especies en: '), write(Categoria), nl,
    write('--------------------------------------'), nl,
    forall(
        (es_especie(A), pertenece(A, Categoria)),
        (nombre_taxonomico(A, N), write('  - '), write(N), nl)
    ),
    write('--------------------------------------'), nl.

% ============================================================
% 3. JERARQUÍA TAXONÓMICA COMPLETA
%    ?- jerarquia(caracol).
%    ?- jerarquia(hormiga_culona).
% ============================================================
jerarquia(Animal) :-
    (es_especie(Animal) ->
        nl,
        write('======================================================'), nl,
        write('  Jerarquia taxonomica: '), write(Animal), nl,
        write('======================================================'), nl,
        obtener_taxonomia(Animal, Linea),
        imprimir_linea(Linea),
        write('======================================================'), nl
    ;
        write('Especie no encontrada: '), write(Animal), nl,
        write('Usa ?- todos. para ver las disponibles.'), nl
    ).

% ============================================================
% 4. CATEGORÍA PRINCIPAL DE UN ANIMAL
%    ?- categoria(abeja, X).
%    ?- categoria(almeja, X).
% ============================================================
categoria(Animal, 'Mammalia  (Mamifero)')  :- pertenece(Animal, mammalia).
categoria(Animal, 'Aves      (Ave)')       :- pertenece(Animal, aves).
categoria(Animal, 'Amphibia  (Anfibio)')   :- pertenece(Animal, amphibia).
categoria(Animal, 'Reptilia  (Reptil)')    :- pertenece(Animal, reptilia).
categoria(Animal, 'Insecta   (Insecto)')   :- pertenece(Animal, insecta).
categoria(Animal, 'Mollusca  (Molusco)')   :- pertenece(Animal, mollusca).
categoria(Animal, 'Chondrichthyes (Pez cartilaginoso)') :- pertenece(Animal, chondrichthyes).

% ============================================================
% 5. INFORMACIÓN COMPLETA DE UNA ESPECIE
%    ?- info(abeja_nativa).
%    ?- info(hormiga_culona).
% ============================================================
info(Animal) :-
    (es_especie(Animal) ->
        nl,
        write('======================================================'), nl,
        write('  INFO: '), write(Animal), nl,
        write('======================================================'), nl,
        nombre_taxonomico(Animal, NC), write('  Nombre cientifico : '), write(NC), nl,
        categoria(Animal, Cat),        write('  Categoria         : '), write(Cat), nl,
        habitat(Animal, H),            write('  Habitat           : '), write(H), nl,
        dieta(Animal, D),              write('  Dieta             : '), write(D), nl,
        nl,
        write('  Utilidad para pequenos productores:'), nl,
        utilidad(Animal, U), write('    '), write(U), nl,
        nl,
        write('  Clasificacion taxonomica completa:'), nl,
        obtener_taxonomia(Animal, Linea),
        imprimir_linea(Linea),
        write('======================================================'), nl
    ;
        nl, write('Especie no encontrada: '), write(Animal), nl,
        write('Usa ?- todos. para ver las disponibles.'), nl
    ).

% ============================================================
% 6. LISTAR TODAS LAS ESPECIES DEL SISTEMA
%    ?- todos.
% ============================================================
todos :-
    nl,
    write('======================================================'), nl,
    write('           ESPECIES DEL SISTEMA (25)                  '), nl,
    write('======================================================'), nl,
    forall(
        member(Cat, [mammalia, aves, amphibia, reptilia, insecta, mollusca, chondrichthyes]),
        (
            write('  '), write(Cat), write(':'), nl,
            forall(
                (es_especie(A), pertenece(A, Cat)),
                (write('    - '), write(A), nl)
            ),
            nl
        )
    ),
    write('======================================================'), nl.

% ============================================================
% 7. PARIENTES (misma familia taxonómica)
%    ?- parientes(abeja, Lista).
%    ?- parientes(gallina, Lista).
% ============================================================
parientes(Animal, Lista) :-
    es_especie(Animal),
    padre_taxonomico(Animal, Genero),
    padre_taxonomico(Genero, Familia),
    findall(P,
        (es_especie(P),
         P \= Animal,
         padre_taxonomico(P, G2),
         padre_taxonomico(G2, Familia)),
        Lista).

parientes(Animal, Lista) :-
    es_especie(Animal),
    padre_taxonomico(Animal, Familia),
    \+ padre_taxonomico(Familia, _Genero2),
    findall(P,
        (es_especie(P),
         P \= Animal,
         padre_taxonomico(P, Familia)),
        Lista).

% ============================================================
% 8. ANCESTRO COMÚN MÁS CERCANO ENTRE DOS ESPECIES
%    ?- ancestro_comun(rana, sapo, Nivel).
%    ?- ancestro_comun(abeja, hormiga_culona, Nivel).
%    ?- ancestro_comun(cuy, conejo, Nivel).
% ============================================================
ancestro_comun(A, B, Nivel) :-
    obtener_taxonomia(A, LineaA),
    obtener_taxonomia(B, LineaB),
    member(Nivel, LineaA),
    member(Nivel, LineaB),      
    Nivel \= A,
    Nivel \= B, !,
    (nombre_taxonomico(Nivel, NomNivel) ->
        format("Ancestro comun de ~w y ~w: ~w~n", [A, B, NomNivel])
    ;
        format("Ancestro comun de ~w y ~w: ~w~n", [A, B, Nivel])
    ).

% ============================================================
% imprime cadena taxonómica con flechas
% ============================================================
imprimir_linea([]).
imprimir_linea([X | Xs]) :-
    (nombre_taxonomico(X, N) ->
        write('    -> '), write(N)
    ;
        write('    -> '), write(X)
    ),
    nl,
    imprimir_linea(Xs).
