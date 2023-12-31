:- dynamic(symptom/1).
symptom(none).

menu :-
    nl, nl, write('1 => add symptom: '),
    nl, write('2 => display symptoms.'),
    nl, write('3 => check symptom.'),
    nl, write('4 => do temperature check *C'),
    nl, write('5 => perform checkup.'),
    nl, nl, write('Enter choice: '), nl, read(Ch),
    (number(Ch) ->
        (Ch =:= 1 -> getsymptom;
         Ch =:= 2 -> dspsymptom;
         Ch =:= 3 -> checksymptom;
         Ch =:= 4 -> tempcheck;
         Ch =:= 5 -> checkup,
                     nl, write('bye'), nl;
         nl, write('Invalid choice'), nl
        ),
        menu
    ;
        nl, write('Invalid input, please enter a number'), nl,
        menu
    ).

getsymptom :-
    nl, write('Enter symptom: '), nl, read(S),
    (symptom(S) -> nl, write('Symptom already recorded');
     assert(symptom(S))), nl, write('Enter another (y/n)'),
    nl, read(Ans), (Ans == 'y' -> getsymptom; menu).

dspsymptom :-
    findall(S, symptom(S), Symptoms),
    print_symptoms(Symptoms),
    menu.

print_symptoms([]).
print_symptoms([S | Rest]) :-
    nl, write('A covid symptom is '), write(S),
    print_symptoms(Rest).

checksymptom :-
    nl, write('Enter your symptom: '), nl, read(S),
    (symptom(S) -> nl, write(S),
                   write(' is a symptom of covid ');
     nl, write(S),
         write(' is not a symptom of covid ')),
    menu.

tempcheck :-
    nl, write('Enter current temperature *C: '), nl, read(C_Temp),
    F_Temp is round((C_Temp * 9 / 5) + 32),  % Convert to Fahrenheit and round
    write('Temperature: '), write(F_Temp), write('*F'),
    (C_Temp >= 38 -> nl, write('Patient has a fever!');
     nl, write('No fever detected')),
    nl, menu.

/* performs patient checkup from predefined Covid database */
checkup :-
    checkFor(Disease),
    nl, write('Processing....'), nl,
    write('System check......patient has: '),
    write(Disease), nl,
    nl, write('**********************System Close**********************'),
    undo.

/* Diseases that are tested based on Rules */
checkFor(covid) :- covid, !.
checkFor(unknown). % accounts for invalid responses during y/n option when performing checkup.

/* Disease Rule */
covid :-
    checkSymptom(headache),
    checkSymptom(fever),
    checkSymptom(dry_cough),
    checkSymptom(body_ache),
    checkSymptom(chest_pain),
    checkSymptom(shortness_of_breath),
    checkSymptom(loss_of_speech_or_movement),
    write('Enter new symptom '), nl, read(Response),
    assert(symptom(Response)),
    checkSymptom(Response),
    write('Advice: '), nl,
    write('_____Short Term:______ .'),
    nl, write('- wear a mask.'),
    nl, write('- drink plenty of fluids.'),
    nl, write('- use hand sanitizer.'), nl,
    nl, write('______Long Term:______ '),
    nl, write('- vaccinate.'),
    nl, write('- self isolate now.'),
    nl, write('- Please contact Disease specialist immediately !'), nl.

:- dynamic(checkSymptom/1).

/* undo all yes, no assertions, clearing the memory */
undo :- retractall(yes(_)), retractall(no(_)).
