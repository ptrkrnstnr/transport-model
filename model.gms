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
sets
     plant    'Plants'   / seattle, san-diego /
     market   'Markets'  / new-york, chicago, topeka / ;

table d(plant,market)  'Table of transport distances from plants (rows) to markets (columns)'
                  new-york       chicago      topeka
    seattle          2.5           1.7          1.8
    san-diego        2.5           1.8          1.4  ;

scalar f     'Freight in monetary unit per transported unit per distance unit' / 90 / ;

parameters
     a(plant)  'Plant capacity in units produced'
       /    seattle     350
            san-diego   650  /
     b(market)  'Market demand in the same unit as the production'
       /    new-york    300
            chicago     300
            topeka      300  / ;

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


