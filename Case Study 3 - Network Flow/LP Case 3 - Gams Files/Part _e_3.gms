Sets
i product /1*7/
j day to product or order /0*5/

Parameters
r(i) Initial inventory for product
/ 1 700
  2 750
  3 0
  4 550
  5 650
  6 550
  7 0 /

cap(i) Order or production capacity for product i
/ 1 250
  2 220
  3 210
  4 180
  5 400
  6 375
  7 275 /

b(i) Inventory capacity for product i
/ 1 1150
  2 1070
  3 5000
  4 5000
  5 900
  6 1000
  7 5000/

p(i) Holding cost for product i
/ 1 0.09
  2 0.11
  3 0.08
  4 0.08
  5 0.08
  6 0.12
  7 0.07/

q(i) Production or order cost for product i
/ 1 5.2
  2 3.6
  3 5.1
  4 4.7
  5 6.2
  6 4.3
  7 3.5/;

Table
f(i,j)
         0       1       2       3       4       5
1        9999    0       0       0       9999    9999
2        9999    0       0       0       9999    9999
3        9999    9999    9999    9999    9999    9999
4        9999    0       0       9999    9999    9999
5        9999    0       9999    9999    9999    9999
6        9999    0       0       9999    9999    9999
7        9999    9999    9999    9999    9999    9999;

Variables
x(i,j) amount of product i ordered or started to produce in day j
y(i,j) amount of product i held in day j
t(i,j) amount of product i send for production in day j
z total cost;

Positive Variable x,y,t;

Equations
parte3 objective function
bal11 balance constraint
bal12 balance constraint
bal13 balance constraint
bal14 balance constraint
bal15 balance constraint
bal16 balance constraint
bal17 balance constraint
bal21 balance constraint
bal22 balance constraint
bal23 balance constraint
bal24 balance constraint
bal25 balance constraint
bal26 balance constraint
bal27 balance constraint
bal31 balance constraint
bal32 balance constraint
bal33 balance constraint
bal34 balance constraint
bal35 balance constraint
bal36 balance constraint
bal37 balance constraint
bal41 balance constraint
bal42 balance constraint
bal43 balance constraint
bal44 balance constraint
bal45 balance constraint
bal46 balance constraint
bal47 balance constraint
bal51 balance constraint
bal52 balance constraint
bal53 balance constraint
bal54 balance constraint
bal55 balance constraint
bal56 balance constraint
bal57 balance constraint
cap1(i,j) capacity of order or production
cap2(i,j) capacity of inventory
cor(j) inventory capacity correction
cor2 inventory capacity correction 2
cor3
cor4
cor5
cor6
inv(i) inventory
pr11 production constraint 1-1
pr12 production constraint 1-2
pr13 production constraint 1-3
pr2 production constraint 2
eq1
eq2
pr41 production constraint 4-1
pr42 production constraint 4-2
partec;
parte3.. z =e= y('7','5')*100+y('6','5')*90 - (sum((i,j), (q(i)*x(i,j))+ (p(i)*y(i,j))+(f(i,j)*t(i,j)))-sum(i,p(i)*y(i,'0'))-sum(i,p(i)*y(i,'5')));
bal11.. y('1','0') - (y('1','1')+t('1','1'))=e= 0 ;
bal12.. y('2','0') - (y('2','1')+t('2','1'))=e= 0 ;
bal13.. y('3','0') - (y('3','1')+t('3','1'))=e= 0 ;
bal14.. y('4','0') - (y('4','1')+t('4','1'))=e= 0 ;
bal15.. y('5','0') - (y('5','1')+t('5','1'))=e= 0 ;
bal16.. y('6','0') - (y('6','1')+t('6','1'))=e= 0 ;
bal17.. y('7','0') - (y('7','1')+t('7','1'))=e= 0 ;
bal21.. y('1','1')+x('1','1') - (y('1','2')+t('1','2'))=e= 0 ;
bal22.. y('2','1')            - (y('2','2')+t('2','2'))=e= 0 ;
bal23.. y('3','1')            - (y('3','2')+t('3','2'))=e= 0 ;
bal24.. y('4','1')            - (y('4','2')+t('4','2'))=e= 0 ;
bal25.. y('5','1')            - (y('5','2')+t('5','2'))=e= 0 ;
bal26.. y('6','1')            - (y('6','2')+t('6','2'))=e= 0 ;
bal27.. y('7','1')            - (y('7','2')+t('7','2'))=e= 0 ;
bal31.. y('1','2')+x('1','2') - (y('1','3')+t('1','3'))=e= 0 ;
bal32.. y('2','2')+x('2','1') - (y('2','3')+t('2','3'))=e= 0 ;
bal33.. y('3','2')+x('3','1') - (y('3','3')+t('3','3'))=e= 0 ;
bal34.. y('4','2')+x('4','1') - (y('4','3')+t('4','3'))=e= 0 ;
bal35.. y('5','2')+x('5','1') - (y('5','3')+t('5','3'))=e= 0 ;
bal36.. y('6','2')            - (y('6','3')+t('6','3'))=e= 0 ;
bal37.. y('7','2')            - (y('7','3')+t('7','3'))=e= 0 ;
bal41.. y('1','3')+x('1','3') - (y('1','4')+t('1','4'))=e= 0 ;
bal42.. y('2','3')+x('2','2') - (y('2','4')+t('2','4'))=e= 0 ;
bal43.. y('3','3')+x('3','2') - (y('3','4')+t('3','4'))=e= 0 ;
bal44.. y('4','3')+x('4','2') - (y('4','4')+t('4','4'))=e= 0 ;
bal45.. y('5','3')+x('5','2') - (y('5','4')+t('5','4'))=e= 0 ;
bal46.. y('6','3')            - (y('6','4')+t('6','4'))=e= 0 ;
bal47.. y('7','3')+x('7','1') - (y('7','4')+t('7','4'))=e= 0 ;
bal51.. y('1','4')+x('1','4') - (y('1','5')+t('1','5'))=e= 0 ;
bal52.. y('2','4')+x('2','3') - (y('2','5')+t('2','5'))=e= 0 ;
bal53.. y('3','4')+x('3','3') - (y('3','5')+t('3','5'))=e= 0 ;
bal54.. y('4','4')+x('4','3') - (y('4','5')+t('4','5'))=e= 0 ;
bal55.. y('5','4')+x('5','3') - (y('5','5')+t('5','5'))=e= 0 ;
bal56.. y('6','4')+x('6','1') - (y('6','5')+t('6','5'))=e= 0 ;
bal57.. y('7','4')+x('7','2') - (y('7','5')+t('7','5'))=e= 0 ;
cap1(i,j).. x(i,j) =l=  cap(i);
cap2(i,j).. y(i,j)-b(i)=l= 0 ;
cor(j).. y('3',j)+y('4',j) =l= 910;
cor2.. y('7','0')=l=470;
cor3.. y('7','1')=l=470;
cor4.. y('7','2')=l=470;
cor5.. y('7','3')=l=470;
cor6.. y('7','4')=l=470;
inv(i).. y(i,'0')- r(i)=e= 0;
pr11.. ((t('1','1')+t('2','1'))/2) =e= x('3','1');
pr12.. ((t('1','2')+t('2','2'))/2) =e= x('3','2');
pr13.. ((t('1','3')+t('2','3'))/2) =e= x('3','3');
pr2.. t('5','1')- x('6','1')=e= 0 ;
eq1.. t('4','1') =e= t('6','1');
eq2.. t('4','2') =e= t('6','2');
pr41.. ((t('6','1')+t('4','1'))/2) =e= x('7','1');
pr42.. ((t('6','2')+t('4','2'))/2) =e= x('7','2');
partec.. y('7','5') =g= 500;

model case1 /all/;
case1.OptFile=1;
$onecho>cplex.opt
objrng all
rhsrng all
$offecho
solve case1 using lp maximizing z ;
display x.L, x.M, y.L, y.M, t.L, t.M;













