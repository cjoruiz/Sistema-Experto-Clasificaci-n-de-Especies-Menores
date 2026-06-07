% ======================================================
% ARCHIVO: reglas_identificacion.pl
% ======================================================

:- discontiguous consumible/3.

% ============================================================
% MAMÍFEROS
% ============================================================
identificar(conejo) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     si).

identificar(cuy) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       si).

identificar(cerdo) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      si).

identificar(cabra) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      no),
    tiene(cuernos_o_barba,   si).

identificar(oveja) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      no),
    tiene(cuernos_o_barba,   no),
    tiene(lana_densa,        si).

identificar(tepezcuintle) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      no),
    tiene(cuernos_o_barba,   no),
    tiene(lana_densa,        no),
    tiene(vive_en_agua,      no),
    tiene(tiene_trompa,      no).

% ============================================================
% AVES
% ============================================================
identificar(pato) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              si).

identificar(codorniz) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              no),
    tiene(ave_pequena,       si),
    tiene(cuello_iridiscente,no).

identificar(paloma) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              no),
    tiene(ave_pequena,       si),
    tiene(cuello_iridiscente,si).

identificar(gallina_guinea) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              no),
    tiene(ave_pequena,       no),
    tiene(puntos_blancos,    si).

identificar(pavo) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              no),
    tiene(ave_pequena,       no),
    tiene(puntos_blancos,    no),
    tiene(cola_abanico,      si).

identificar(gallina) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         plumas),
    tiene(nada,              no),
    tiene(ave_pequena,       no),
    tiene(puntos_blancos,    no),
    tiene(cola_abanico,      no).

% ============================================================
% ANFIBIOS
% ============================================================
identificar(rana) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         piel_humeda),
    tiene(piel_lisa,         si).

identificar(sapo) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         piel_humeda),
    tiene(piel_lisa,         no).

% ============================================================
% REPTILES
% ============================================================
identificar(tortuga_agua) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         escamas),
    tiene(tiene_caparazon,   si).

identificar(iguana) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         escamas),
    tiene(tiene_caparazon,   no),
    tiene(vive_en_agua,      no).
% ============================================================
% INSECTOS
% ============================================================
identificar(abeja) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        si),
    tiene(vuela,             si),
    tiene(produce_miel,      si),
    tiene(tiene_aguijon,     si).

identificar(abeja_nativa) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        si),
    tiene(vuela,             si),
    tiene(produce_miel,      si),
    tiene(tiene_aguijon,     no).

identificar(mariposa) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        si),
    tiene(vuela,             si),
    tiene(produce_miel,      no).

identificar(hormiga_culona) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        si),
    tiene(vuela,             no).

% ============================================================
% MOLUSCOS
% ============================================================
identificar(caracol) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        no),
    tiene(tiene_concha,      si),
    tiene(concha_espiral,    si).

identificar(almeja) :-
    tiene(vertebrado,        no),
    tiene(seis_patas,        no),
    tiene(tiene_concha,      si),
    tiene(concha_espiral,    no).

% Ballena
identificar(ballena) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      no),
    tiene(cuernos_o_barba,   no),
    tiene(lana_densa,        no),
    tiene(vive_en_agua,      si).

% Elefante
identificar(elefante) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         pelaje),
    tiene(orejas_largas,     no),
    tiene(muy_pequeno,       no),
    tiene(hocico_disco,      no),
    tiene(cuernos_o_barba,   no),
    tiene(lana_densa,        no),
    tiene(vive_en_agua,      no),
    tiene(tiene_trompa,      si).

% tiburon
identificar(tiburon) :-
    tiene(vertebrado,        si),
    tiene(tegumento,         escamas),
    tiene(tiene_caparazon,   no),
    tiene(vive_en_agua,      si).