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
lightColour(north, yellow).
lightColour(south, yellow).
lightColour(east, red).
lightColour(west, red).

%%%%% RULE: canGo
% Add the rules for canGo in this section

% Car can go straight through an intersection when light is green
canGo(Car, Direction) :- lightColour(Direction, green), facing(Car, Direction).

% Car can turn right when light is green
canGo(Car, Direction) :- lightColour(CurrDirection, green), facing(Car, CurrDirection), counterclockwise(CurrDirection, Direction).

% Car can turn right when light is yellow
canGo(Car, Direction) :- lightColour(CurrDirection, yellow), facing(Car, CurrDirection), counterclockwise(CurrDirection, Direction).

% Car can turn left when light is yellow
canGo(Car, Direction) :- lightColour(CurrDirection, yellow), facing(Car, CurrDirection), clockwise(CurrDirection, Direction), reverseDirection(CurrDirection, OppositeDir).

% Car can turn left when light is green
canGo(Car, Direction) :- lightColour(CurrDirection, green), clockwise(CurrDirection, Direction), reverseDirection(CurrDirection, OppDirection), \+ Car=OtherCar, \+ canGo(OtherCar, OppDirection).

% Car can turn right when light is red AND oppositeDir lights are yellow
canGo(Car, Direction) :- lightColour(CurrDirection, red), facing(Car, CurrDirection), counterclockwise(CurrDirection, Direction), lightColour(Direction, yellow).

% Car can turn right when light is red AND oppositeDir lights are green
canGo(Car, Direction) :- lightColour(CurrDirection, red), facing(Car, CurrDirection), counterclockwise(CurrDirection, Direction), \+ Car=OtherCar, \+ canGo(OtherCar, Direction).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
