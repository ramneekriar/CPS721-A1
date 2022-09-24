% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Karanvir Heer
%%%%% NAME: Ramneek Riar
%%%%% NAME: Shruti Sharma
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section
clockwise(east, north).
clockwise(south, east).
clockwise(west, south).
clockwise(north, west).

%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterclockwise(west, north).
counterclockwise(south, west).
counterclockwise(east, south).
counterclockwise(north, east).

%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(north, south).
reverseDirection(south, north).
reverseDirection(west, east).
reverseDirection(east, west).

%%%%% ATOMIC: facing
% Add the atomic propositions for facing (part b) in this section
facing(toyota, south).
facing(nissan, north).
facing(chevrolet, east).

%%%%% ATOMIC: lightColour
% Add the atomic propositions for lightColour (part b) in this section
lightColour(north, green).
lightColour(south, green).
lightColour(east, red).
lightColour(west, red).

%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section


%%%%% RULE: canGo
% Add the rules for canGo in this section
canGo(Car, Direction) :- lightColour(Direction, green), facing(Car, Direction).
canGo(Car, Direction) :- lightColour(X, green), facing(Car, X), counterclockwise(X, Direction).

canGo(Car, Direction) :- lightColour(X, yellow), facing(Car, X), counterclockwise(X, Direction).
canGo(Car, Direction) :- lightColour(X, yellow), facing(Car, X), clockwise(X, Direction).
canGo(Car, Direction) :- lightColour(X, red), not facing(Y, Direction).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
