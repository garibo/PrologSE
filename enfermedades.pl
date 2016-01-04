esrespuesta('si').
esrespuesta('no').

%RESFRIADO
espregunta('¿Fiebre moderada?',X):-esrespuesta(X).
espregunta('¿Dolores musculares?',X):-esrespuesta(X).
espregunta('¿Dolor de cabeza?',X):-esrespuesta(X).
espregunta('¿Nariz congestionada o que gotea?',X):-esrespuesta(X).
espregunta('¿Tos?',X):-esrespuesta(X).
espregunta('¿Cansancio?',X):-esrespuesta(X).
espregunta('¿Estornudo?',X):-esrespuesta(X).
espregunta('¿Dolor de garganta?',X):-esrespuesta(X).
espregunta('¿Irritacion ocular?',X):-esrespuesta(X).


%GASTRITIS
espregunta('¿Nauseas y vomitos?',X):-esrespuesta(X).
espregunta('¿Inapetencia?',X):-esrespuesta(X).
espregunta('¿Dolor en la parte superior del vientre o el abdomen?',X):-esrespuesta(X).
espregunta('¿Heces negras?',X):-esrespuesta(X).
espregunta('¿Vomitos con sangre o material con aspecto de cafe molido?',X):-esrespuesta(X).


%MIGRANA
espregunta('Ataques de dolor de cabeza que duran entre 4 y 72 hrs',X):-esrespuesta(X).
espregunta('Localizacion unilateral',X):-esrespuesta(X).
espregunta('Pulsatilidad',X):-esrespuesta(X).
espregunta('Intensidad de dolor moderada o grave',X):-esrespuesta(X).
espregunta('Se agraba por la actividad fisica rutinaria',X):-esrespuesta(X).
espregunta('Nauseas, vomitos o ambos',X):-esrespuesta(X).
espregunta('Fonofobia, Fotofobia o ambos',X):-esrespuesta(X).
espregunta('Ves luces manchas o lineas parpadeantes',X):-esrespuesta(X).
espregunta('Hormigueo o ponchazos en la piel, Entumecimiento o adormecimiento',X):-esrespuesta(X).
espregunta('Dificultad para hablar',X):-esrespuesta(X).
espregunta('Tiene sintomas visuales en los dos ojos',X):-esrespuesta(X).
espregunta('Alguno de los sintomas se desarrolla durante 5 o mayor a 5 minutos',X):-esrespuesta(X).
espregunta('Cada sintoma dura entre 5 y 60 minutos',X):-esrespuesta(X).
espregunta('5 ataques',X):-esrespuesta(X).

main:-
  new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(560,450)),
  send(D,colour,colour(red)),
  send(D, append, new(Menu, menu_bar)),     
  send(Menu, append, new(Acerca, popup(acerca))),
  send(Menu, append, new(Ayuda, popup(ayuda))),
  send_list(Acerca, append,
                   [ menu_item(objetivo, message(@display, inform, 'Ayudar mediante un sistema experto a personas comunes a hacerse un test para comprobar si los síntomas de los cuales ellos padecen con cuerda con alguna de las 3 enfermedades que el sistema experto diagnostica, sin necesidad de mucho esfuerzo y recursos la enfermedad de la cual se padece.'))
                   ]),
  send_list(Ayuda, append,
                   [ menu_item(autor, message(@display, inform, 'Kevin Esteban Garibo Bracamontes \nRosa Esperanza Pacheco Ramirez'))
                   ]),
  mostrar('layout/fondo.jpg',D,Menu),
  new(B1,button(salir,and(message(D,destroy)))),
    send(D,append,B1),

    new(B2,button(gastritis,and(message(@prolog,gastri),message(D,destroy)))),
    send(D,append,B2),

    new(B3,button(migrana,and(message(@prolog,migra),message(D,destroy)))),
    send(D,append,B3),

    new(B4,button(resfriado,and(message(@prolog,resfri),message(D,destroy)))),
    send(D,append,B4),
  send(D,open,point(300,200)).


mostrar(V,D,M):- new(I, image(V)),
    new(B, bitmap(I)),
    new(F2, figure),
    send(F2, display, B),
    new(D1, device),
    send(D1, display, F2),
    send(D, display, D1),
    send(D1,below(M)).


mostrar(V,D):- new(I, image(V)),
    new(B, bitmap(I)),
    new(F2, figure),
    send(F2, display, B),
    new(D1, device),
    send(D1, display, F2),
    send(D, display, D1).

resfri:-new(D,dialog('Resfriado Comun')),
    send(D, append(label(n,'************ Elige SI o NO segun sea tu sintoma ***********'))),

    new(Pre1,menu('¿Fiebre moderada?')),
    send_list(Pre1,append,[si , no]),

    new(Pre2,menu('¿Dolores musculares?')),
    send_list(Pre2,append,[si,no]),

    new(Pre3,menu('¿Dolor de cabeza?')),
    send_list(Pre3,append,[si,no]),

    new(Pre4,menu('¿Nariz congestionada o que gotea?')),
    send_list(Pre4,append,[si,no]),

    new(Pre5,menu('¿Tos?')),
    send_list(Pre5,append,[si,no]),

    new(Pre6,menu('¿Cansancio?')),
    send_list(Pre6,append,[si , no]),

    new(Pre7,menu('¿Estornudo?')),
    send_list(Pre7,append,[si,no]),

    new(Pre8,menu('¿Dolor de garganta?')),
    send_list(Pre8,append,[si,no]),

    new(Pre9,menu('¿Irritacion ocular?')),
    send_list(Pre9,append,[si,no]),
 
   send(D,append(Pre1)),
   send(D,append,Pre2),
   send(D,append,Pre3),
   send(D,append,Pre4),
   send(D,append,Pre5),
   send(D,append(Pre6)),
   send(D,append,Pre7),
   send(D,append,Pre8),
   send(D,append,Pre9),
   new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
   new(B,button(siguiente,and(message(@prolog,resfriado,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection,Pre8?selection,Pre9?selection),message(D,destroy)))),
   send(D,append,B1),
   send(D,append,B),
   send(D,open,point(300,200)).


  %%%%%%%%%%%%%%%% NO HAY RESFRIADO %%%%%%%%%%%%%%%%%%%%%%%
  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='no',
  espregunta('¿Dolores musculares?',P2),P2='no',
  espregunta('¿Dolor de cabeza?',P3),P3='no',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='no',
  espregunta('¿Tos?',P5),P5='no',
  espregunta('¿Cansancio?',P6),P6='no',
  espregunta('¿Estornudo?',P7),P7='no',
  espregunta('¿Dolor de garganta?',P8),P8='no',
  espregunta('¿Irritacion ocular?',P9),P9='no',
  diagnoresfri.
  


  %%%%%%%%%%%%%%%% RESFRIADO %%%%%%%%%%%%%%%%%%%%%%%  
  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='si',
  espregunta('¿Dolores musculares?',P2),P2='si',
  espregunta('¿Dolor de cabeza?',P3),P3='si',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='si',
  espregunta('¿Tos?',P5),P5='si',
  espregunta('¿Cansancio?',P6),P6='si',
  espregunta('¿Estornudo?',P7),P7='si',
  espregunta('¿Dolor de garganta?',P8),P8='si',
  espregunta('¿Irritacion ocular?',P9),P9='si',
  diagresfri.


  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='si',
  espregunta('¿Dolores musculares?',P2),P2='no',
  espregunta('¿Dolor de cabeza?',P3),P3='no',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='si',
  espregunta('¿Tos?',P5),P5='si',
  espregunta('¿Cansancio?',P6),P6='si',
  espregunta('¿Estornudo?',P7),P7='si',
  espregunta('¿Dolor de garganta?',P8),P8='si',
  espregunta('¿Irritacion ocular?',P9),P9='no',
  diagresfri.

  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='si',
  espregunta('¿Dolores musculares?',P2),P2='si',
  espregunta('¿Dolor de cabeza?',P3),P3='no',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='si',
  espregunta('¿Tos?',P5),P5='si',
  espregunta('¿Cansancio?',P6),P6='si',
  espregunta('¿Estornudo?',P7),P7='si',
  espregunta('¿Dolor de garganta?',P8),P8='si',
  espregunta('¿Irritacion ocular?',P9),P9='no',
  diagresfri.

  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='si',
  espregunta('¿Dolores musculares?',P2),P2='no',
  espregunta('¿Dolor de cabeza?',P3),P3='si',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='si',
  espregunta('¿Tos?',P5),P5='si',
  espregunta('¿Cansancio?',P6),P6='si',
  espregunta('¿Estornudo?',P7),P7='si',
  espregunta('¿Dolor de garganta?',P8),P8='si',
  espregunta('¿Irritacion ocular?',P9),P9='no',
  diagresfri.

  resfriado(P1,P2,P3,P4,P5,P6,P7,P8,P9):-
  espregunta('¿Fiebre moderada?',P1),P1='si',
  espregunta('¿Dolores musculares?',P2),P2='no',
  espregunta('¿Dolor de cabeza?',P3),P3='no',
  espregunta('¿Nariz congestionada o que gotea?',P4),P4='si',
  espregunta('¿Tos?',P5),P5='si',
  espregunta('¿Cansancio?',P6),P6='si',
  espregunta('¿Estornudo?',P7),P7='si',
  espregunta('¿Dolor de garganta?',P8),P8='si',
  espregunta('¿Irritacion ocular?',P9),P9='si',
  diagresfri.

  resfriado(_,_,_,_,_,_,_,_,_):- desconocido.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gastri:-new(D,dialog('Gastritis')),
    send(D, append(label(n,'*************************** Elige SI o NO segun sea tu sintoma **************************'))),

    new(Pre1,menu('¿Nauseas y vomitos?')),
    send_list(Pre1,append,[si , no]),

    new(Pre2,menu('¿Vomitos con sangre o material con aspecto de cafe molido?')),
    send_list(Pre2,append,[si,no]),

    new(Pre3,menu('¿Inapetencia?')),
    send_list(Pre3,append,[si,no]),

    new(Pre4,menu('¿Dolor en la parte superior del vientre o el abdomen?')),
    send_list(Pre4,append,[si,no]),

    new(Pre5,menu('¿Heces negras?')),
    send_list(Pre5,append,[si,no]),

   send(D,append(Pre1)),
   send(D,append,Pre2),
   send(D,append,Pre3),
   send(D,append,Pre4),
   send(D,append,Pre5),
   new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
   new(B,button(siguiente,and(message(@prolog,gastritis,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection),message(D,destroy)))),
   send(D,append,B1),
   send(D,append,B),
   send(D,open,point(300,200)).

  %%%%%%%%%%%%%%%% NO HAY GASTRITIS %%%%%%%%%%%%%%%%%%%%%%%
  gastritis(P1,P2,P3,P4,P5):-
  espregunta('¿Nauseas y vomitos?',P1),P1='no',
  espregunta('¿Vomitos con sangre o material con aspecto de cafe molido?',P2),P2='no',
  espregunta('¿Inapetencia?',P3),P3='no',
  espregunta('¿Dolor en la parte superior del vientre o el abdomen?',P4),P4='no',
  espregunta('¿Heces negras?',P5),P5='no',
  diagnogastri.

  %%%%%%%%%%%%%%%% GASTRITS %%%%%%%%%%%%%%%%%%%%%%%
  gastritis(P1,P2,P3,P4,P5):-
  espregunta('¿Nauseas y vomitos?',P1),P1='si',
  espregunta('¿Vomitos con sangre o material con aspecto de cafe molido?',P2),P2='si',
  espregunta('¿Inapetencia?',P3),P3='si',
  espregunta('¿Dolor en la parte superior del vientre o el abdomen?',P4),P4='si',
  espregunta('¿Heces negras?',P5),P5='si',
  diaggastri.

  %%%%%%%%%%%%%%%% POSIBLE GASTRITS %%%%%%%%%%%%%%%%%%%%%%%
  gastritis(P1,P2,P3,P4,P5):-
  espregunta('¿Nauseas y vomitos?',P1),P1='si',
  espregunta('¿Vomitos con sangre o material con aspecto de cafe molido?',P2),P2='no',
  espregunta('¿Inapetencia?',P3),P3='si',
  espregunta('¿Dolor en la parte superior del vientre o el abdomen?',P4),P4='si',
  espregunta('¿Heces negras?',P5),P5='no',
  diaggastri.

  gastritis(_,_,_,_,_):- desconocido.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
migra:-new(D,dialog('Migraña')),
    send(D, append(label(n,'Ha sentido usted en el ultimo mes:'))),

    new(Pre1,menu('Ataques de dolor de cabeza que duran entre 4 y 72 hrs')),
    send_list(Pre1,append,[si , no]),


   send(D,append(Pre1)),
   new(B1,button(atras,and(message(@prolog,main),message(D,destroy)))),
   new(B,button(siguiente,and(message(@prolog,migrana,Pre1?selection),message(D,destroy)))),
   send(D,append,B1),
   send(D,append,B),
   send(D,open,point(300,200)).

  migrana(P1):-
  espregunta('Ataques de dolor de cabeza que duran entre 4 y 72 hrs',P1),P1='si',
  migrados.

  migrana(P1):-
  espregunta('Ataques de dolor de cabeza que duran entre 4 y 72 hrs',P1),P1='no',
  nouno.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  migrados:-new(D,dialog('Migraña - sintomas')),
  send(D, append(label(n,'Los sintomas van acompñados de:'))),

  new(Pre1,menu('Localizacion unilateral')),
  send_list(Pre1,append,[si , no]),

  new(Pre2,menu('Pulsatilidad')),
  send_list(Pre2,append,[si,no]),

  new(Pre3,menu('Intensidad de dolor moderada o grave')),
  send_list(Pre3,append,[si,no]),

  new(Pre4,menu('Se agraba por la actividad fisica rutinaria')),
  send_list(Pre4,append,[si,no]),

 send(D,append(Pre1)),
 send(D,append,Pre2),
 send(D,append,Pre3),
 send(D,append,Pre4),
 new(B1,button(atras,and(message(@prolog,migra),message(D,destroy)))),
 new(B,button(siguiente,and(message(@prolog,migradoseval,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection),message(D,destroy)))),
 send(D,append,B1),
 send(D,append,B),
 send(D,open,point(300,200)).

  migradoseval(P1,P2,P3,P4):-
  espregunta('Localizacion unilateral',P1),P1='si',
  espregunta('Pulsatilidad',P2),P2='no',
  espregunta('Intensidad de dolor moderada o grave',P3),P3='no',
  espregunta('Se agraba por la actividad fisica rutinaria',P4),P4='no',
  nodos.

  migradoseval(P1,P2,P3,P4):-
  espregunta('Localizacion unilateral',P1),P1='no',
  espregunta('Pulsatilidad',P2),P2='si',
  espregunta('Intensidad de dolor moderada o grave',P3),P3='no',
  espregunta('Se agraba por la actividad fisica rutinaria',P4),P4='no',
  nodos.

  migradoseval(P1,P2,P3,P4):-
  espregunta('Localizacion unilateral',P1),P1='no',
  espregunta('Pulsatilidad',P2),P2='no',
  espregunta('Intensidad de dolor moderada o grave',P3),P3='si',
  espregunta('Se agraba por la actividad fisica rutinaria',P4),P4='no',
  nodos.

  migradoseval(P1,P2,P3,P4):-
  espregunta('Localizacion unilateral',P1),P1='no',
  espregunta('Pulsatilidad',P2),P2='no',
  espregunta('Intensidad de dolor moderada o grave',P3),P3='no',
  espregunta('Se agraba por la actividad fisica rutinaria',P4),P4='si',
  nodos.

  migradoseval(P1,P2,P3,P4):-
  espregunta('Localizacion unilateral',P1),P1='no',
  espregunta('Pulsatilidad',P2),P2='no',
  espregunta('Intensidad de dolor moderada o grave',P3),P3='no',
  espregunta('Se agraba por la actividad fisica rutinaria',P4),P4='no',
  nodos.

  migradoseval(_,_,_,_):- migratres.

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  migratres:-new(D,dialog('Migraña - sintomas')),
  send(D, append(label(n,'Durante el dolor de cabeza usted siente:'))),

  new(Pre1,menu('Nauseas, vomitos o ambos')),
  send_list(Pre1,append,[si , no]),

  new(Pre2,menu('Fonofobia, Fotofobia o ambos')),
  send_list(Pre2,append,[si,no]),

 send(D,append(Pre1)),
 send(D,append,Pre2),
 new(B1,button(atras,and(message(@prolog,migrados),message(D,destroy)))),
 new(B,button(siguiente,and(message(@prolog,migratreseval,Pre1?selection,Pre2?selection),message(D,destroy)))),
 send(D,append,B1),
 send(D,append,B),
 send(D,open,point(300,200)).

 migratreseval(P1,P2):-
 espregunta('Nauseas, vomitos o ambos',P1),P1='no',
 espregunta('Fonofobia, Fotofobia o ambos',P2),P2='no',
 notres.

 migratreseval(_,_):- ataques.
 
 %%%migratreseval(_,_):- new(D,dialog('ERROR')),
 %%%new(L,label(l,'USTED TIENE MIGRANA SIN AURA',font('times','roman',16))),
 %%%send(D,append,L),
 %%%send(D,open,point(350,350)).

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  ataques:-new(D,dialog('Migraña - sintomas')),
  send(D, append(label(n,'En ell ultimo mes ha usted tenido almenos: '))),

  new(Pre1,menu('5 ataques')),
  send_list(Pre1,append,[si , no]),

 send(D,append(Pre1)),
 new(B1,button(atras,and(message(@prolog,migratres),message(D,destroy)))),
 new(B,button(siguiente,and(message(@prolog,ataqueseval,Pre1?selection),message(D,destroy)))),
 send(D,append,B1),
 send(D,append,B),
 send(D,open,point(300,200)).

 ataqueseval(P1):-
 espregunta('5 ataques',P1),P1='no',
 nocuatro.

 ataqueseval(P1):-
 espregunta('5 ataques',P1),P1='si',
 migracuatro.
 
 %%%ataqueseval(_,_):- new(D,dialog('ERROR')),
 %%%new(L,label(l,'USTED TIENE MIGRANA SIN AURA',font('times','roman',16))),
 %%%send(D,append,L),
 %%%send(D,open,point(350,350)).


  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  migracuatro:-new(D,dialog('Migraña - sintomas')),
  send(D, append(label(n,'Los dolores de cabeza son acompañados de:'))),

  new(Pre1,menu('Ves luces manchas o lineas parpadeantes')),
  send_list(Pre1,append,[si , no]),

  new(Pre2,menu('Hormigueo o ponchazos en la piel, Entumecimiento o adormecimiento')),
  send_list(Pre2,append,[si,no]),

  new(Pre3,menu('Dificultad para hablar')),
  send_list(Pre3,append,[si,no]),


  send(D,append(Pre1)),
  send(D,append,Pre2),
  send(D,append,Pre3),
  new(B1,button(atras,and(message(@prolog,ataques),message(D,destroy)))),
  new(B,button(siguiente,and(message(@prolog,migracuatroeval,Pre1?selection,Pre2?selection,Pre3?selection),message(D,destroy)))),
  send(D,append,B1),
  send(D,append,B),
  send(D,open,point(300,200)).

  migracuatroeval(P1,P2,P3):-
  espregunta('Ves luces manchas o lineas parpadeantes',P1),P1='no',
  espregunta('Hormigueo o ponchazos en la piel, Entumecimiento o adormecimiento',P2),P2='no',
  espregunta('Dificultad para hablar',P3),P3='no',
  sinaura.

  migracuatroeval(_,_,_):- migracinco.


  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  migracinco:-new(D,dialog('Migraña - sintomas')),

  new(Pre1,menu('Tiene sintomas visuales en los dos ojos')),
  send_list(Pre1,append,[si , no]),

  new(Pre2,menu('Alguno de los sintomas se desarrolla durante 5 o mayor a 5 minutos')),
  send_list(Pre2,append,[si,no]),

  new(Pre3,menu('Cada sintoma dura entre 5 y 60 minutos')),
  send_list(Pre3,append,[si,no]),


  send(D,append(Pre1)),
  send(D,append,Pre2),
  send(D,append,Pre3),
  new(B1,button(atras,and(message(@prolog,migracuatro),message(D,destroy)))),
  new(B,button(siguiente,and(message(@prolog,migracincoeval,Pre1?selection,Pre2?selection,Pre3?selection),message(D,destroy)))),
  send(D,append,B1),
  send(D,append,B),
  send(D,open,point(300,200)).

  migracincoeval(P1,P2,P3):-
  espregunta('Tiene sintomas visuales en los dos ojos',P1),P1='no',
  espregunta('Alguno de los sintomas se desarrolla durante 5 o mayor a 5 minutos',P2),P2='no',
  espregunta('Cada sintoma dura entre 5 y 60 minutos',P3),P3='no',
  sinaura.

  migracincoeval(_,_,_):- conaura.


  pf1(X):-new(D,dialog('DIAGNOSTICO')),
    mostrar(X,D,5,5),
   send(D,open).

   mostrar(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  nouno:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(300,195)),
  send(D,colour,colour(red)),
  mostrar('layout/no.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  new(B3,button(volver,and(message(@prolog,migra),message(D,destroy)))),
  send(D,append,B3),
  send(D,open,point(300,200)).

  nodos:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(300,195)),
  send(D,colour,colour(red)),
  mostrar('layout/no.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  new(B3,button(volver,and(message(@prolog,migrados),message(D,destroy)))),
  send(D,append,B3),
  send(D,open,point(300,200)).

  notres:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(300,195)),
  send(D,colour,colour(red)),
  mostrar('layout/no.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  new(B3,button(volver,and(message(@prolog,migratres),message(D,destroy)))),
  send(D,append,B3),
  send(D,open,point(300,200)).

  nocuatro:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(300,195)),
  send(D,colour,colour(red)),
  mostrar('layout/no.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  new(B3,button(volver,and(message(@prolog,ataques),message(D,destroy)))),
  send(D,append,B3),
  send(D,open,point(300,200)).

  sinaura:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(380,330)),
  send(D,colour,colour(red)),
  mostrar('layout/sinaura.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  conaura:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(390,330)),
  send(D,colour,colour(red)),
  mostrar('layout/conaura.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  diagresfri:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(450,230)),
  send(D,colour,colour(red)),
  mostrar('layout/resfriado.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  diagnoresfri:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(490,150)),
  send(D,colour,colour(red)),
  mostrar('layout/noresfriado.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  diaggastri:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(400,250)),
  send(D,colour,colour(red)),
  mostrar('layout/gastritis.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  diagnogastri:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(350,160)),
  send(D,colour,colour(red)),
  mostrar('layout/nogastritis.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).

  desconocido:- new(D,dialog('Diagnostico de enfermedades como migraña, resfriado común y gastritis.')),
  send(D,size,size(350,140)),
  send(D,colour,colour(red)),
  mostrar('layout/desconocido.jpg',D),
  new(B1,button(salir,and(message(@prolog,main),message(D,destroy)))),
  send(D,append,B1),
  send(D,open,point(300,200)).