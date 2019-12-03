t = 0:pi/1000:pi/2;
x = sin(0.05*t);
y = cos(0.05*t);
z = t;

t2 = pi/2:pi/1000:0;
x2 = t2;
y2 = sin(0.05*t2);
z2 = cos(0.05*t2);

ah = axes;
set(ah,'XLim',[min(x) max(x)],'YLim',[min(y) max(y)],...
    'ZLim',[min(z) max(z)]);
plot3(x,y,z,'Color','red');
hold on;
view(3);
hpoint = line('XData', 0,'YData', 0,'ZData', 0,'Color','black','Marker',...
    'o','MarkerSize',10,'MarkerFaceColor','black');
ht = hgtransform('parent',ah);
set(hpoint,'Parent',ht);
for i=2:length(x)
    tx = x(i);
    ty = y(i);
    tz = z(i);
    trans = makehgtform('translate',[tx ty tz]);
    set(ht,'Matrix',trans);
    drawnow limitrate
    pause(0.01);
end