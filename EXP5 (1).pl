/* Problem statement: 

At a small company, parking spaces are reserved for the top executives: CEO, president, vice president, secretary, and treasurer with the spaces lined up in that order. The parking lot guard can tell at a glance if the cars are parked correctly by looking at the color of the cars. The cars are yellow, green, purple, red, and blue, and the executives' names are Alice, Bert, Cheryl, David, and Enid.

 Known facts:

 * The car in the first space is red.
* A blue car is parked between the red car and the green car.
* The car in the last space is purple.
* The secretary drives a yellow car.
* Alice's car is parked next to David's.
* Enid drives a green car.
* Bert's car is parked between Cheryl's and Enid's.
* David's car is parked in the last space.  

 

Questions:

Who is the secretary?

Who is the CEO ?

What color is the vice president's car?


*/

:- use_rendering(table,
		 [header(h('Designation', 'Name', 'Colour', 'Position'))]).

secretary(Ans) :-
    list(P),
    member(h(secretary,Ans,_,_), P).

ceo(Ans) :-
    list(P),
    member(h(ceo,Ans,_,_), P).


vp_car(Colour) :- 
    list(P),
    member(h(vp,_,Colour,_), P).

list(P) :-
	length(P, 5),  
    
	member(h(_,_,red,1), P),                       
	next(h(_,_,red,_), h(_,_,blue,_), P),             
	next(h(_,_,blue,_), h(_,_,green,_), P),             
	member(h(_,_,purple,5), P),                         
	member(h(secretary,_,yellow,_), P),                        
	member(h(_,david,_,5), P),      
	next(h(_,alice,_,_), h(_,david,_,_), P),             
	member(h(_,enid,green,_), P),                      
	next(h(_,bert,_,_), h(_,enid,_,_), P),        
	next(h(_,cheryl,_,_), h(_,bert,_,_), P),              
    
    

	next(h(ceo,_,_,1), h(president,_,_,2), P),
    next(h(president,_,_,2), h(vp,_,_,3), P),
    next(h(vp,_,_,3), h(secretary,_,_,4), P),
    next(h(secretary,_,_,4), h(treasurer,_,_,5), P).

    

next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).
