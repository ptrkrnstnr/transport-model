sets
     plant    'Plants'   / seattle, san-diego /
     market   'Markets'  / new-york, chicago, topeka / ;

table d(plant,market)  'Table of transport distances from plants (rows) to markets (columns)'
                  new-york       chicago      topeka
    seattle          2.5           1.7          1.8
    san-diego        2.5           1.8          1.4  ;

scalar f        'Freight in monetary unit per transported unit per distance unit' / 90 / ;

parameters

     a(plant)   'Plant capacity in units produced'
       /    seattle     350
            san-diego   650  /

     b(market)  'Market demand in the same unit as the production'
       /    new-york    300
            chicago     300
            topeka      300  / ;


