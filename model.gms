$title Transportation Problem 
$ontext

Example adapted from: 

Dantzig, G B. Chapter 3-3 In Linear Programming and Extensions.
Princeton University Press, Princeton, New Jersey, 1963.

Rosenthal, R E. A User's Guide. The Scientific Press, 
Redwood City, California, 1988.

$offtext

* Set global variable SLASH based on the operating system
$setglobal SLASH \
$if %system.filesys% == UNIX $setglobal SLASH /

* Set path to data
$setglobal data .%SLASH%data%SLASH%


* Input data 
$include input.gms

* Model 
parameter c(plant,market)  'Transport cost in monetary unit per transported unit' ;
          c(plant,market) = f * d(plant,market) ;

variables
     x(plant,market)  'shipment in cases'
     z                'Total transportation costs in monetary units' ;

positive variable x ;

equations
     cost            'objective function'
     supply(plant)   'supply limit at plant'
     demand(market)  'demand at market' ;

cost ..        z  =e=  sum((plant,market), c(plant,market)*x(plant,market)) ;

supply(plant) ..   sum(market, x(plant,market))  =l=  a(plant) ;

demand(market) ..   sum(plant, x(plant,market))  =g=  b(market) ;

model transport /all/ ;

solve transport using lp minimizing z ;

Display x.l, x.m ;


