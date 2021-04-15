Sets

i livestock: 1 = cow              2 = chicken                     / 1, 2    /
j crops:     1 = sugarbeet        2 = barley          3 = wheat   / 1, 2, 3 /
k season:    1 = winter & spring  2 = summer & fall               / 1, 2    /;


Parameters

t(k) time 
/ 1 3750
  2 4680 /

rt(k) income from remaining time         
/ 1 4.5
  2 5 / 

s(i) space 
/ 1 42
  2 5000 /

a acre 
/ 800 /

p(i) profit from livestock 
/ 1 800
  2 5.5 /

pr(j) profit from crops  
/ 1 80
  2 70
  3 50 /

f fundation 
/ 25000 /

c(i) current value of livestock 
/ 1 32000
  2 6000 /

cl(i) current number of  livestock   
/ 1 25
  2 2000 /

n(i) cost of a new livestock  
/ 1 1400
  2 4 /

py(i) percentage remaining value of livestock after a year      
/ 1 0.95
  2 0.75 / 

r(i) required work person hour per season 
/ 1 12
  2 0.05 /;


Table

b(k,j) person hour required for crop j in season k per acre
        1       2       3
1       0.6     1       0.9
2       0.7     1.2     1;


Variables

x(i) number of livestock bought
y(j) number of crops planted
z total profit;


Positive variables 
x
y;

Equations

profit objective function
space1
space2
acrelim
time1
time2
feeding1
feeding2
fundlim;

profit..    z =e= sum(i, p(i)*(cl(i)+x(i)))+sum(j, y(j)*pr(j))+sum(i, (c(i)+n(i)*x(i))*py(i))+f-sum(i, x(i)*n(i))+sum(k, t(k)-2*(sum(i,r(i)*x(i)))-(sum(j, b(k,j)*y(j))))-40000 ;
space1..    x('1')=l=17;
space2..    x('2')=l=3000;
acrelim..   sum(j, y(j))+ 2*(25+x('1'))=l= a;
time1..     sum(i,(cl(i)+x(i))*2*r(i))+sum(j,b('1',j)*y(j))=l=t('1');
time2..     sum(i,(cl(i)+x(i))*2*r(i))+sum(j,b('2',j)*y(j))=l=t('2');
feeding1..  y('2')=g=(cl('2')+x('2'))*0.05;
feeding2..  y('3')=g= cl('1')+x('1');
fundlim..   sum(i, x(i)*n(i))=l= f;

Model Case /all/;
$onecho>cplex.opt
rhsrng all
objrng all
$offecho
Case.optfile=1;
solve Case using lp maximizing z;
