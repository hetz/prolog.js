"""
Einstein's Puzzle

Expecting:
  
 ?- zebra(Who,HS).
 
 HS = [h(yellow,norwegian,cats,water,dunhill),h(blue,dane,horse,tea,blend),h(red,brit,birds,milk,pallmall),h(green,german,zebra,coffee,prince),h(white,swede,dog,beer,bluemaster)]
 Who = german
"""
select([A|As],S):- select(A,S,S1),select(As,S1).
select([],_). 

left_of(A,B,C):- append(_,[A,B|_],C).  
next_to(A,B,C):- left_of(A,B,C) ; left_of(B,A,C).

%// house: color,nation,pet,drink,smokes)
zebra(Owns, HS):- 
  HS   = [ h(_,norwegian,_,_,_),    h(blue,_,_,_,_),   h(_,_,_,milk,_), _, _], 
  select([ h(red,brit,_,_,_),       h(_,swede,dog,_,_), 
           h(_,dane,_,tea,_),       h(_,german,_,_,prince)], HS),
  select([ h(_,_,birds,_,pallmall), h(yellow,_,_,_,dunhill),
           h(_,_,_,beer,bluemaster)],                        HS), 
  left_of( h(green,_,_,coffee,_),   h(white,_,_,_,_),        HS),
  next_to( h(_,_,_,_,dunhill),      h(_,_,horse,_,_),        HS),
  next_to( h(_,_,_,_,blend),        h(_,_,cats, _,_),        HS),
  next_to( h(_,_,_,_,blend),        h(_,_,_,water,_),        HS),
  member(  h(_,Owns,zebra,_,_),                              HS).
  