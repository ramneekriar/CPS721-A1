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

%%%%% ATOMIC: cost
% Add the atomic propositions for cost in this section

cost(bread, 4).
cost(lettuce, 2).
cost(apple, 1).
cost(chocolate_bar, 3).
cost(ginger_ale, 2).

%%%%%  ATOMIC: twoForOneSale
% Add the atomic propositions for twoForOneSale in this section

twoForOneSale(bread).
twoForOneSale(apple).

%%%%% ATOMIC: taxable
% Add the atomic propositions for taxable in this section

taxable(chocolate_bar).
taxable(ginger_ale).

%%%%% ATOMIC: numPurchased
% Add the atomic propositions for numPurchased in this section

numPurchased(bread, 2).
numPurchased(lettuce, 3).
numPurchased(apple, 6).
numPurchased(chocolate_bar, 1).
numPurchased(ginger_ale, 2).

%%%%% ATOMIC: taxRate
% Add the atomic propositions for taxRate in this section

taxRate(0.13).

%%%%% RULE: costAfterTax
% Add the rule(s) for costAfterTax in this section

% If Item is Taxable
costAfterTax(Item, AfterTax) :- taxable(Item), cost(Item, Cost), taxRate(Tax), AfterTax is Cost*(Tax+1).

% If Item is NOT Taxable
costAfterTax(Item, AfterTax) :- not(taxable(Item)), cost(Item, Cost), AfterTax is Cost.

%%%%% RULE: costAfterTaxAndSale
% Add the rule(s) for costAfterTaxAndSale in this section

% If Item is on a TwoForOneSale
costAfterTaxAndSale(Item, AfterSaleAndTax) :- twoForOneSale(Item), costAfterTax(Item, AfterTax), numPurchased(Item, Count), R is mod(Count, 2), AfterSaleAndTax is AfterTax*((Count // 2) + R).

% If Item is NOT on a Sale
costAfterTaxAndSale(Item, AfterSaleAndTax) :- not(twoForOneSale(Item)), costAfterTax(Item, AfterTax), numPurchased(Item, Count), AfterSaleAndTax is (AfterTax*Count).

%%%%% RULE: totalCost
%  Add the rule(s) for totalCost in this section

totalCost(Cost) :- costAfterTaxAndSale(bread, Bread_Cost), costAfterTaxAndSale(lettuce, Lettuce_Cost), costAfterTaxAndSale(apple, Apple_Cost), costAfterTaxAndSale(chocolate_bar, Chocolate_bar_Cost), costAfterTaxAndSale(ginger_ale, Ginger_ale_Cost), Cost is (Bread_Cost+Lettuce_Cost+Apple_Cost+Chocolate_bar_Cost+Ginger_ale_Cost).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW```