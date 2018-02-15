

{$mode objfpc}{$H+}

uses crt,graph   ;
var
T:array [1..100,1..100] of integer;
a,b,c,d,e,f,g,n:longint;
Karta,Tryb:smallint;
begin
read (a);
read (n);
for b:=1 to a do
for c:=1 to 2*a do
 if  (c+b>=a+1) and (b-c<=a) and (c+b<= 3*a+1) and (c-b<=a)  then
 begin
   d:=b+c;
   if (a mod 2=1) then
   if (d mod 2=0) then
   T[b,c]:=9
   else
   T[b,c]:=3;
   if (a mod 2=0) then
   if (d mod 2=1) then
   T[b,c]:=9
   else
   T[b,c]:=3;
 end;

for b:=a+1 to 2*a do
for c:=1 to 2*a do
begin
d:=b+c;
 if  (c+b<= 3*a+1) and (c-b<=a) and (c+b>=a+1) and (b-c<=a)  then
 begin
   if (a mod 2=1) then
   if (d mod 2=1) then
   T[b,c]:=9
   else
   T[b,c]:=3;
  if (a mod 2=0) then
   if (d mod 2=1) then
   T[b,c]:=3
   else
   T[b,c]:=9;
end;
end;


e:=1;
while (e<=n) do
begin
b:=random(2*a)+1;
c:=random(2*a)+1;
  if  (c+b<= 3*a-1) and (c-b<=a-1) and (c+b>=a+1) and (b-c<=a-1) then
    begin
      e:=e+1;
      if (T[b,c]=1) and (T[b,c+1]=1) then
        begin
        T[b,c]:=9 ;
        T[b,c+1]:=3 ;
        T[b+1,c+1]:=3 ;
        T[b+1,c]:=9;
        end
      else
      if (T[b,c]=9) and (T[b+1,c]=9) then
      begin
        T[b,c]:=1 ;
        T[b,c+1]:=1 ;
        T[b+1,c+1]:=6 ;
        T[b+1,c]:=6 ;
        end;

    end;
end;

for b:=1 to 2*a do
begin
writeln(' ');
for c:=1 to 2*a do
write (T[b,c]);
end;


for b:=1 to 2*a do
for c:=1 to 2*a do
begin
if ((b+c) mod 2=0) and (T[b,c]=1) then
T[b,c]:=2;
if ((b+c) mod 2=1) and (T[b,c]=6) then
T[b,c]:=5;
if ((b+c) mod 2=0) and (T[b,c]=3) then
T[b,c]:=4;
if ((b+c) mod 2=1) and (T[b,c]=9) then
T[b,c]:=8;
end;
writeln (' ');
for b:=1 to 2*a do
begin
writeln(' ');
for c:=1 to 2*a do
write (T[b,c]);
end;


karta:=0;
tryb:=0;
InitGraph(tryb, karta, 'C:\tp\Bgi');
f:=700 div (2*a);
for b:=1 to 2*a do
for c:=1 to 2*a do
   begin
   if (T[b,c]=1) or (T[b,c]=6) then
      begin
      SetFillStyle( SolidFill, yellow );
      Bar(f*b-f ,f*c-f ,f*b , f*c );
      end;
   if (T[b,c]=3) or (T[b,c]=9) then
      begin
      SetFillStyle( SolidFill, green );
      Bar(f*b-f ,f*c-f ,f*b , f*c );
      end;
    if (T[b,c]=4) or (T[b,c]=8) then
      begin
      SetFillStyle( SolidFill, blue );
      Bar(f*b-f ,f*c-f ,f*b , f*c );
      end;
    if (T[b,c]=5) or (T[b,c]=2) then
      begin
      SetFillStyle( SolidFill, red );
      Bar(f*b-f ,f*c-f ,f*b , f*c );
      end;
   end;
for b:=1 to 2*a do
for c:=1 to 2*a do
    begin
    if (T[b,c]=1) or (T[b,c]=2) then
         begin
         setcolor(black);
         line(f*b-f ,f*c-f ,f*b , f*c-f );
         line(f*b-f ,f*c-f ,f*b-f , f*c );
         line(f*b-f ,f*c ,f*b , f*c);
         end;
     if (T[b,c]=5) or (T[b,c]=6) then
         begin
         setcolor(black);
         line(f*b ,f*c ,f*b-f , f*c );
         line(f*b ,f*c-f ,f*b , f*c );
         line(f*b,f*c-f ,f*b-f, f*c-f );
         end;

       if (T[b,c]=3) or (T[b,c]=4) then
         begin
         setcolor(black);
         line(f*b ,f*c ,f*b-f , f*c);
          line(f*b-f ,f*c-f ,f*b-f , f*c );
           line(f*b ,f*c-f ,f*b , f*c );
         end;
       if (T[b,c]=8) or (T[b,c]=9) then
         begin
         setcolor(black);
         line(f*b ,f*c-f ,f*b-f , f*c-f);
         line(f*b-f ,f*c-f ,f*b-f , f*c );
         line(f*b ,f*c-f ,f*b , f*c );
         end;
       end;

readln ;
readln;
end.

