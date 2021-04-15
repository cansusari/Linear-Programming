Sets
i mines /1*15/
j refineries /1*10/;

Parameters

k(i) capacity of mine i
/ 1 30000
  2 15000
  3 50000
  4 35000
  5 30000
  6 15000
  7 300000
  8 300000
  9 300000
  10 500000
  11 605000
  12 10000
  13 60000
  14 200000
  15 300000 /

v(i) calori value of mine i
/ 1 3200
  2 3200
  3 2500
  4 3200
  5 2600
  6 3273
  7 3500
  8 3000
  9 2200
  10 3200
  11 4400
  12 5000
  13 5200
  14 5900
  15 4200/

dl(j) demand of refinery j with low calorie plant
/ 1 109200000
  2 275600000
  3 44800000
  4 0
  5 0
  6 192000000
  7 130000000
  8 134400000
  9 128000000
  10 262400000 /

dh(j) demand of refinery j with high calorie plant
/ 1 123200000
  2 0
  3 123200000
  4 216000000
  5 234000000
  6 0
  7 120000000
  8 0
  9 0
  10 0 /

minl(j) minimum accepted calorie value of refinery j with low calorie
/ 1 2400
  2 2400
  3 3000
  4 0
  5 0
  6 3000
  7 2400
  8 3000
  9 3000
  10 3000 /

maxl(j) maximum accepted calorie value of refinery j with low calorie
/ 1 2800
  2 3000
  3 3400
  4 0
  5 0
  6 3400
  7 2800
  8 3400
  9 3400
  10 3400 /

minh(j) minimum accepted calorie value of refinery j with high calorie
/ 1 4000
  2 0
  3 4000
  4 4000
  5 4000
  6 0
  7 4000
  8 0
  9 0
  10 0 /

maxh(j) maximum accepted calorie value of refinery j with high calorie
/ 1 4800
  2 0
  3 4800
  4 6000
  5 6000
  6 0
  7 4800
  8 0
  9 0
  10 0 / ;


Table c(i,j) cost
         1       2       3       4       5       6       7       8       9       10
1        999999  999999  999999  999999  999999  999999  999999  139     128     999999
2        999999  999999  999999  999999  999999  999999  999999  999999  160     999999
3        999999  999999  120     999999  999999  999999  999999  999999  999999  999999
4        143     999999  999999  999999  999999  160     100     193     999999  999999
5        100     999999  999999  999999  999999  999999  999999  999999  999999  999999
6        130     999999  999999  999999  999999  999999  999999  999999  999999  999999
7        999999  999999  999999  999999  999999  999999  999999  235     210     999999
8        999999  999999  999999  999999  999999  999999  999999  120     95      999999
9        999999  108     999999  999999  999999  121     131     999999  999999  999999
10       999999  105     999999  999999  999999  170     132     179     158     203
11       382     999999  425     410     370     341     352     378     367     341
12       225     999999  999999  240     999999  999999  999999  999999  999999  999999
13       999999  999999  400     999999  999999  337     999999  377     362     345
14       297     999999  999999  293     302     999999  297     297     303     999999
15       999999  175     999999  999999  999999  999999  202     249     228     273;

Table p(i,j) percantage

         1       2       3       4       5       6       7       8       9       10
1                                                                0.6     0.6
2                                                                        0.85
3                        0.65
4        0.5                                     0.5     1       0.5
5        0.5
6        0.65
7                                                                0.65    0.65
8                                                                0.75    0.75
9                0.7                             0.55    0.7
10               0.8                             0.5     0.8     0.5     0.5     0.8
11       0.65            0.65    0.65    0.65    0.65    0.65    0.65    0.65    0.65
12       0.65                    0.65
13                       0.65                    0.65            0.65    0.65    0.65
14       0.8                     0.6     0.8             0.6     0.8     0.8
15               0.3                                     0.4     0.2     0.2     0.5 ;


Variables
x(i,j) quantity of low calorie type coal supplied by mine i to refinery j (in tons)
y(i,j) quantity of high calorie type coal supplied by mine i to refinery j (in tons)
t(j) total quantity of coal refinery j buys
m(i) total quantity of coal mine i sells
z total cost ;

Positive variable x, y, t;

Equations
totalcost objective function
capacityofmines(i) capacity of mines i(in tons)
mincl(j) minimum accepted calorie for low calorie plant
maxcl(j) maximum accepted calorie for low calorie plant
minch(j) minimum accepted calorie for high calorie plant
maxch(j) maximum accepted calorie for high calorie plant
demandl(j) demand of refinery j with low calorie
demandh(j) demand of refinery j with high calorie
total(j) total quantity of coals in refinery j (in tons)
maxper(i,j) maximum percentage of the total annual coal demand
mine(i) selling;

totalcost.. z =e= sum((i,j), c(i,j)*(x(i,j)+y(i,j)));
capacityofmines(i).. sum(j, (x(i,j)+y(i,j)))=l=k(i);
mincl(j).. sum(i, v(i)*x(i,j))-sum(i, x(i,j))*minl(j) =g= 0  ;
maxcl(j).. sum(i, v(i)*x(i,j))-sum(i, x(i,j))*maxl(j) =l= 0  ;
minch(j).. sum(i, v(i)*y(i,j))-sum(i, y(i,j))*minh(j) =g= 0  ;
maxch(j).. sum(i, v(i)*y(i,j))-sum(i, y(i,j))*maxh(j) =l= 0  ;
demandl(j).. sum(i, x(i,j)*v(i))=g= dl(j) ;
demandh(j).. sum(i, y(i,j)*v(i))=g= dh(j) ;
total(j).. sum(i, x(i,j)+y(i,j))=e= t(j);
maxper(i,j).. (x(i,j)+y(i,j))-t(j)*p(i,j) =l= 0 ;
mine(i).. sum(j, x(i,j)+y(i,j)) =e= m(i); 

model case2 /all/;
case2.OptFile=1;
$onecho>cplex.opt
objrng all
rhsrng all
$offecho
solve case2 using lp minimizing z ;
display x.L, x.M, y.L, y.M ;





