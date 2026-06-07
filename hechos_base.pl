% ======================================================
% ARCHIVO: hechos_base.pl
% ======================================================

:- discontiguous padre_taxonomico/2.
:- discontiguous nombre_taxonomico/2.

% ============================================================
% SECCION 1 — JERARQUÍA TAXONOMICA
% ============================================================

% --- Filos ---
padre_taxonomico(chordata,           animalia).
padre_taxonomico(arthropoda,         animalia).
padre_taxonomico(mollusca,           animalia).

% --- Clases ---
padre_taxonomico(mammalia,           chordata).
padre_taxonomico(aves,               chordata).
padre_taxonomico(amphibia,           chordata).
padre_taxonomico(reptilia,           chordata).
padre_taxonomico(insecta,            arthropoda).
padre_taxonomico(gastropoda,         mollusca).
padre_taxonomico(bivalvia,           mollusca).
% nuevo
padre_taxonomico(chondrichthyes,     chordata).


% --- Ordenes: Mamíferos ---
padre_taxonomico(artiodactyla,       mammalia).
padre_taxonomico(lagomorpha,         mammalia).
padre_taxonomico(rodentia,           mammalia).
% nuevo
padre_taxonomico(proboscidea,        mammalia).
padre_taxonomico(cetacea,            mammalia).
padre_taxonomico(lamniformes,        chondrichthyes).

% --- Ordenes: Aves ---
padre_taxonomico(galliformes,        aves).
padre_taxonomico(anseriformes,       aves).
padre_taxonomico(columbiformes,      aves).

% --- Ordenes: Anfibios ---
padre_taxonomico(anura,              amphibia).

% --- Ordenes: Reptiles ---
padre_taxonomico(squamata,           reptilia).
padre_taxonomico(testudines,         reptilia).

% --- Ordenes: Insectos ---
padre_taxonomico(hymenoptera,        insecta).
padre_taxonomico(lepidoptera,        insecta).

% --- Ordenes: Moluscos ---
padre_taxonomico(stylommatophora,    gastropoda).
padre_taxonomico(venerida,           bivalvia).

% --- Familias: Mamíferos ---
padre_taxonomico(suidae,             artiodactyla).
padre_taxonomico(bovidae,            artiodactyla).
padre_taxonomico(leporidae,          lagomorpha).
padre_taxonomico(caviidae,           rodentia).
padre_taxonomico(cuniculidae,        rodentia).
% nuevo
padre_taxonomico(elephantidae,       proboscidea).
padre_taxonomico(balaenopteridae,    cetacea).
padre_taxonomico(lamnidae,           lamniformes).
% --- Familias: Aves ---
padre_taxonomico(phasianidae,        galliformes).
padre_taxonomico(numididae,          galliformes).
padre_taxonomico(anatidae,           anseriformes).
padre_taxonomico(columbidae,         columbiformes).

% --- Familias: Anfibios ---
padre_taxonomico(ranidae,            anura).
padre_taxonomico(bufonidae,          anura).

% --- Familias: Reptiles ---
padre_taxonomico(iguanidae,          squamata).  
padre_taxonomico(emydidae,           testudines).

% --- Familias: Insectos ---
padre_taxonomico(apidae,             hymenoptera).
padre_taxonomico(formicidae,         hymenoptera).
padre_taxonomico(nymphalidae,        lepidoptera).

% --- Familias: Moluscos ---
padre_taxonomico(achatinidae,        stylommatophora).
padre_taxonomico(cyrenidae,          venerida).

% --- Generos: Mamíferos ---
padre_taxonomico(sus,                suidae).
padre_taxonomico(capra,              bovidae).
padre_taxonomico(ovis,               bovidae).
padre_taxonomico(oryctolagus,        leporidae).
padre_taxonomico(cavia,              caviidae).
padre_taxonomico(cuniculus,          cuniculidae).
% nuevo
padre_taxonomico(loxodonta,          elephantidae).
padre_taxonomico(balaenoptera,       balaenopteridae).
padre_taxonomico(carcharodon,        lamnidae).

% --- Generos: Aves ---
padre_taxonomico(gallus,             phasianidae).
padre_taxonomico(meleagris,          phasianidae).
padre_taxonomico(coturnix,           phasianidae).
padre_taxonomico(numida,             numididae).
padre_taxonomico(anas,               anatidae).
padre_taxonomico(columba,            columbidae).

% --- Generos: Anfibios ---

padre_taxonomico(lithobates,         ranidae).
padre_taxonomico(rhinella,           bufonidae).

% --- Generos: Reptiles ---
padre_taxonomico(trachemys,          emydidae).

% --- Generos: Insectos ---
padre_taxonomico(apis,               apidae).
padre_taxonomico(melipona,           apidae).
padre_taxonomico(atta,               formicidae).
padre_taxonomico(heliconius,         nymphalidae).

% --- Generos: Moluscos ---
padre_taxonomico(achatina,           achatinidae).
padre_taxonomico(corbicula,          cyrenidae).

% --- Especies (nombre comun -> genero) ---
padre_taxonomico(cerdo,              sus).
padre_taxonomico(cabra,              capra).
padre_taxonomico(oveja,              ovis).
padre_taxonomico(conejo,             oryctolagus).
padre_taxonomico(cuy,                cavia).
padre_taxonomico(tepezcuintle,       cuniculus).

padre_taxonomico(gallina,            gallus).
padre_taxonomico(pavo,               meleagris).
padre_taxonomico(codorniz,           coturnix).
padre_taxonomico(gallina_guinea,     numida).
padre_taxonomico(pato,               anas).
padre_taxonomico(paloma,             columba).

padre_taxonomico(rana,               lithobates).
padre_taxonomico(sapo,               rhinella).

padre_taxonomico(iguana,             iguanidae).
padre_taxonomico(tortuga_agua,       trachemys).

padre_taxonomico(abeja,              apis).
padre_taxonomico(abeja_nativa,       melipona).
padre_taxonomico(hormiga_culona,     atta).
padre_taxonomico(mariposa,           heliconius).

padre_taxonomico(caracol,            achatina).
padre_taxonomico(almeja,             corbicula).

% nuevo
padre_taxonomico(elefante,           loxodonta).
padre_taxonomico(ballena,            balaenoptera).
padre_taxonomico(tiburon,            carcharodon).

% ============================================================
% SECCION 2 — NOMBRES TAXONOMICOS LEGIBLES
% ============================================================

nombre_taxonomico(animalia,          'Animalia                (Reino)').
nombre_taxonomico(chordata,          'Chordata                (Filo)').
nombre_taxonomico(arthropoda,        'Arthropoda              (Filo)').
nombre_taxonomico(mollusca,          'Mollusca                (Filo)').

nombre_taxonomico(mammalia,          'Mammalia                (Clase)').
nombre_taxonomico(aves,              'Aves                    (Clase)').
nombre_taxonomico(amphibia,          'Amphibia                (Clase)').
nombre_taxonomico(reptilia,          'Reptilia                (Clase)').
nombre_taxonomico(insecta,           'Insecta                 (Clase)').
nombre_taxonomico(gastropoda,        'Gastropoda              (Clase)').
nombre_taxonomico(bivalvia,          'Bivalvia                (Clase)').
% nuevo
nombre_taxonomico(chondrichthyes,    'Chondrichthyes          (Clase)').

nombre_taxonomico(artiodactyla,      'Artiodactyla            (Orden)').
nombre_taxonomico(lagomorpha,        'Lagomorpha              (Orden)').
nombre_taxonomico(rodentia,          'Rodentia                (Orden)').
nombre_taxonomico(galliformes,       'Galliformes             (Orden)').
nombre_taxonomico(anseriformes,      'Anseriformes            (Orden)').
nombre_taxonomico(columbiformes,     'Columbiformes           (Orden)').
nombre_taxonomico(anura,             'Anura                   (Orden)').
nombre_taxonomico(squamata,          'Squamata                (Orden)').
nombre_taxonomico(testudines,        'Testudines              (Orden)').
nombre_taxonomico(hymenoptera,       'Hymenoptera             (Orden)').
nombre_taxonomico(lepidoptera,       'Lepidoptera             (Orden)').
nombre_taxonomico(stylommatophora,   'Stylommatophora         (Orden)').
nombre_taxonomico(venerida,          'Venerida                (Orden)').
% nuevo
nombre_taxonomico(proboscidea,       'Proboscidea             (Orden)').
nombre_taxonomico(cetacea,           'Cetacea                 (Orden)').
nombre_taxonomico(lamniformes,       'Lamniformes             (Orden)').

nombre_taxonomico(suidae,            'Suidae                  (Familia)').
nombre_taxonomico(bovidae,           'Bovidae                 (Familia)').
nombre_taxonomico(leporidae,         'Leporidae               (Familia)').
nombre_taxonomico(caviidae,          'Caviidae                (Familia)').
nombre_taxonomico(cuniculidae,       'Cuniculidae             (Familia)').
nombre_taxonomico(phasianidae,       'Phasianidae             (Familia)').
nombre_taxonomico(numididae,         'Numididae               (Familia)').
nombre_taxonomico(anatidae,          'Anatidae                (Familia)').
nombre_taxonomico(columbidae,        'Columbidae              (Familia)').
nombre_taxonomico(ranidae,           'Ranidae                 (Familia)').
nombre_taxonomico(bufonidae,         'Bufonidae               (Familia)').
nombre_taxonomico(iguanidae,         'Iguanidae               (Familia)').
nombre_taxonomico(emydidae,          'Emydidae                (Familia)').
nombre_taxonomico(apidae,            'Apidae                  (Familia)').
nombre_taxonomico(formicidae,        'Formicidae              (Familia)').
nombre_taxonomico(nymphalidae,       'Nymphalidae             (Familia)').
nombre_taxonomico(achatinidae,       'Achatinidae             (Familia)').
nombre_taxonomico(cyrenidae,         'Cyrenidae               (Familia)').
% nuevo
nombre_taxonomico(elephantidae,      'Elephantidae            (Familia)').
nombre_taxonomico(balaenopteridae,   'Balaenopteridae         (Familia)').
nombre_taxonomico(lamnidae,          'Lamnidae                (Familia)').

nombre_taxonomico(sus,               'Sus                     (Genero)').
nombre_taxonomico(capra,             'Capra                   (Genero)').
nombre_taxonomico(ovis,              'Ovis                    (Genero)').
nombre_taxonomico(oryctolagus,       'Oryctolagus             (Genero)').
nombre_taxonomico(cavia,             'Cavia                   (Genero)').
nombre_taxonomico(cuniculus,         'Cuniculus               (Genero)').
nombre_taxonomico(gallus,            'Gallus                  (Genero)').
nombre_taxonomico(meleagris,         'Meleagris               (Genero)').
nombre_taxonomico(coturnix,          'Coturnix                (Genero)').
nombre_taxonomico(numida,            'Numida                  (Genero)').
nombre_taxonomico(anas,              'Anas                    (Genero)').
nombre_taxonomico(columba,           'Columba                 (Genero)').
nombre_taxonomico(lithobates,        'Lithobates              (Genero)').
nombre_taxonomico(rhinella,          'Rhinella                (Genero)').
nombre_taxonomico(trachemys,         'Trachemys               (Genero)').
nombre_taxonomico(apis,              'Apis                    (Genero)').
nombre_taxonomico(melipona,          'Melipona                (Genero)').
nombre_taxonomico(atta,              'Atta                    (Genero)').
nombre_taxonomico(heliconius,        'Heliconius              (Genero)').
nombre_taxonomico(achatina,          'Achatina                (Genero)').
nombre_taxonomico(corbicula,         'Corbicula               (Genero)').
% nuevo
nombre_taxonomico(loxodonta,         'Loxodonta               (Genero)').
nombre_taxonomico(balaenoptera,      'Balaenoptera            (Genero)').
nombre_taxonomico(carcharodon,       'Carcharodon             (Genero)').

nombre_taxonomico(cerdo,             'Sus scrofa domesticus            (Especie)').
nombre_taxonomico(cabra,             'Capra aegagrus hircus            (Especie)').
nombre_taxonomico(oveja,             'Ovis aries                       (Especie)').
nombre_taxonomico(conejo,            'Oryctolagus cuniculus            (Especie)').
nombre_taxonomico(cuy,               'Cavia porcellus                  (Especie)').
nombre_taxonomico(tepezcuintle,      'Cuniculus paca                   (Especie)').
nombre_taxonomico(gallina,           'Gallus gallus domesticus         (Especie)').
nombre_taxonomico(pavo,              'Meleagris gallopavo              (Especie)').
nombre_taxonomico(codorniz,          'Coturnix coturnix                (Especie)').
nombre_taxonomico(gallina_guinea,    'Numida meleagris                 (Especie)').
nombre_taxonomico(pato,              'Anas platyrhynchos               (Especie)').
nombre_taxonomico(paloma,            'Columba livia                    (Especie)').
nombre_taxonomico(rana,              'Lithobates catesbeianus          (Especie)').
nombre_taxonomico(sapo,              'Rhinella marina                  (Especie)').
nombre_taxonomico(iguana,            'Iguana iguana                    (Especie)').
nombre_taxonomico(tortuga_agua,      'Trachemys scripta                (Especie)').
nombre_taxonomico(abeja,             'Apis mellifera                   (Especie)').
nombre_taxonomico(abeja_nativa,      'Melipona beecheii                (Especie)').
nombre_taxonomico(hormiga_culona,    'Atta cephalotes                  (Especie)').
nombre_taxonomico(mariposa,          'Heliconius melpomene             (Especie)').
nombre_taxonomico(caracol,           'Achatina fulica                  (Especie)').
nombre_taxonomico(almeja,            'Corbicula fluminea               (Especie)').
% nuevo
nombre_taxonomico(elefante,          'Loxodonta africana               (Especie)').
nombre_taxonomico(ballena,           'Balaenoptera musculus            (Especie)').
nombre_taxonomico(tiburon,           'Carcharodon carcharias           (Especie)').
% ============================================================
% SECCION 3 — ATRIBUTOS ECOLOGICOS Y PRODUCTIVOS
% ============================================================

% habitat(Especie, Habitat)
habitat(cerdo,           terrestre).
habitat(cabra,           terrestre).
habitat(oveja,           terrestre).
habitat(conejo,          terrestre).
habitat(cuy,             terrestre).
habitat(tepezcuintle,    semiacuatico).
habitat(gallina,         terrestre).
habitat(pavo,            terrestre).
habitat(codorniz,        terrestre).
habitat(gallina_guinea,  terrestre).
habitat(pato,            semiacuatico).
habitat(paloma,          terrestre).
habitat(rana,            semiacuatico).
habitat(sapo,            terrestre).
habitat(iguana,          arboreo).
habitat(tortuga_agua,    semiacuatico).
habitat(abeja,           terrestre).
habitat(abeja_nativa,    terrestre).
habitat(hormiga_culona,  terrestre).
habitat(mariposa,        terrestre).
habitat(caracol,         terrestre).
habitat(almeja,          acuatico).
% nuevo
habitat(elefante,        terrestre).
habitat(ballena,         acuatico).
habitat(tiburon,         acuatico).

% dieta(Especie, TipoDieta)
dieta(cerdo,             omnivoro).
dieta(cabra,             herbivoro).
dieta(oveja,             herbivoro).
dieta(conejo,            herbivoro).
dieta(cuy,               herbivoro).
dieta(tepezcuintle,      herbivoro).
dieta(gallina,           omnivoro).
dieta(pavo,              omnivoro).
dieta(codorniz,          granivoro).
dieta(gallina_guinea,    omnivoro).
dieta(pato,              omnivoro).
dieta(paloma,            granivoro).
dieta(rana,              insectivoro).
dieta(sapo,              insectivoro).
dieta(iguana,            herbivoro).
dieta(tortuga_agua,      omnivoro).
dieta(abeja,             polinizador).
dieta(abeja_nativa,      polinizador).
dieta(hormiga_culona,    herbivoro).
dieta(mariposa,          polinizador).
dieta(caracol,           herbivoro).
dieta(almeja,            filtrador).
% nuevo
dieta(elefante,          herbivoro).
dieta(ballena,           carnivoro).
dieta(tiburon,           carnivoro).

% utilidad(Especie, Descripcion)
utilidad(cerdo,          'Carne, embutidos y manteca. Ciclo corto, alto retorno.').
utilidad(cabra,          'Carne, leche y queso. Ideal para zonas aridas y tropicales.').
utilidad(oveja,          'Carne, lana y leche. Rustica, bajo costo inicial.').
utilidad(conejo,         'Carne y piel. Alta prolificidad, poco espacio requerido.').
utilidad(cuy,            'Carne de alto valor nutritivo. Arraigado en los Andes.').
utilidad(tepezcuintle,   'Carne muy valorada. Viable en sistemas agroforestales.').
utilidad(gallina,        'Carne y huevos. Especie ancla de la economia campesina.').
utilidad(pavo,           'Carne. Alta demanda estacional (fiestas, ferias).').
utilidad(codorniz,       'Huevos y carne. Ciclo muy rapido, minimo espacio.').
utilidad(gallina_guinea, 'Carne. Muy rustica; control biologico natural de insectos.').
utilidad(pato,           'Carne, huevos e higado. Aprovecha zonas humedas.').
utilidad(paloma,         'Carne. Palomares de bajo mantenimiento.').
utilidad(rana,           'Carne (ancas) y piel. Mercado especializado, buen precio.').
utilidad(sapo,           'No apto para consumo. Control biologico de plagas agricolas.').
utilidad(iguana,         'Carne y piel. Alta demanda; requiere manejo ambiental.').
utilidad(tortuga_agua,   'Carne y huevos. Requiere permiso ANLA/CAR en Colombia.').
utilidad(abeja,          'Miel, cera, propoleo, jalea real. Beneficia cultivos (polinizacion).').
utilidad(abeja_nativa,   'Miel medicinal de alto valor. Nativa, adaptada al tropico colombiano.').
utilidad(hormiga_culona, 'Consumo humano (Santander). Nicho exportacion artesanal.').
utilidad(mariposa,       'Bioindicador ambiental, turismo ecologico, mariposarios.').
utilidad(caracol,        'Carne (helicicultura). Alta conversion, poco espacio.').
utilidad(almeja,         'Carne. Filtradora: mejora calidad del agua en policultivos.').
utilidad(elefante,       'No apta para produccion.').
utilidad(ballena,        'No apta para produccion.').
utilidad(tiburon,        'No apta para produccion.').
% ============================================================
% SECCION 4 — REGLA: OBTENER CADENA TAXONOMICA COMPLETA
% ============================================================
obtener_taxonomia(Taxon, [Taxon | Resto]) :-
    padre_taxonomico(Taxon, Padre), !,
    obtener_taxonomia(Padre, Resto).
obtener_taxonomia(Taxon, [Taxon]).