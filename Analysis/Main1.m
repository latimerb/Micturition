%Main.m
clear all
%parpool
mydata = dlmread('mod1data.dat');
ncell = 625;
mysvec = mydata(:,1);
mycvec = mydata(:,2) +1;
mysvec = mysvec';
mycvec=mycvec';
mycvec = [mycvec 1:ncell];
mysvec = [mysvec zeros(1,ncell)];
mybinsize=100; % change this as necessary original 1000
binadv = 1; % change this as necessary original 100
[mycvec, i] = sort(mycvec);
tmax = 30000+mybinsize;
for ii = 1:length(i)
    
    mysvec2(ii)= mysvec(i(ii));
    
end
mysvec2 = mysvec2';
mainvec=zeros(ncell, 2);
kk=1;
kvec=[1];


parfor ii = 1:ncell
    spikevec=0;
    freqvec=0;
   for jj = 1:length(mycvec)-1
       
       if mycvec(jj+1) ~= ii && mycvec(jj) == ii || jj==length(mycvec)-1
           kvec = [kvec jj]
           
           break
       else
       end
   end
end
kvec=sort(kvec);


for ii = 1:ncell
    spikevec = mysvec2(kvec(ii):kvec(ii+1));
    
    nn=1;

    freqvec=0;
    for mm = 1:binadv:tmax-mybinsize
        freqcount=0;
            for ll = 1:length(spikevec)
                
           if spikevec(ll)>mm && spikevec(ll)<mm+mybinsize
               freqcount=freqcount+1;
           else
           end
            end
            freqvec(nn)=freqcount;
      
       nn=nn+1  ;   
    end
    
    mainvec(ii, 1:length(freqvec)) = freqvec;
    
end
    
Dataout1
    
    
    
    