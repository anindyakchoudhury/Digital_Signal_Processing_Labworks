clc;
clearvars;

x1 = [ 0 1 2 3];
x2 = [ 0 1 2 3] ;

n1ref = 0; n2ref = 1;


    diffleftx2 = n2ref-1;
    diffleftx1 = n1ref-1;
    
    diffrightx1 = length(x1)-n1ref;
    diffrightx2 = length(x2)-n2ref;
    
    if diffleftx2>diffleftx1
        addleft= zeros(1,(diffleftx2-diffleftx1));
        x1 = [addleft x1];
    else
        addleft= zeros(1,(diffleftx2-diffleftx1));
        x2 = [addleft x2];
        
    end
    
    if diffrightx2>diffrightx1
        addright = zeros(1, (diffrightx2-diffrightx1));
        x1 = [x1 addright];
    else
         addright = zeros(1, (diffrightx1-diffrightx2));
         x2 = [x2 addright];
    end
    
    
 xtotal = x1 + x2;
 subplot(3,1,1)
 stem(x1);
 subplot(3,1,2);
 stem(x2);
 subplot(3,1,3);
 stem(xtotal);
 fig=gcf;
 WinOnTop(fig, true);
 
 
