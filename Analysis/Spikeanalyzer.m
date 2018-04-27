%Spikeanalyzer.m
%Chris Sinks
%4/25/2016
%Version 1.0

HGa=dlmread('HGEa');
MPGa=dlmread('MPGA');
HGe=dlmread('HGE');
MPGe=dlmread('MPGE');
PUD=dlmread('PUD');


sthg=size(HG, 2);
stmpg=size(MPG, 2);


mybinsize=1000; %in ms

binadv=20;  %in ms
pudstart=10000;
pudend=20000;
tfinal = 10000;     %in ms, this is defined by how long you ran your simulation for
tvec = [mybinsize./2:binadv:tfinal-mybinsize/2-1];


for ll = 1:size(HGa, 1)
    freqvec=0;
    kk=1;
    for ii=1:binadv:(tfinal-mybinsize)
    freqcounter=0;
    for jj = 1:size(HGa, 2)
        if HGa(ll, jj)<=ii+mybinsize && HGa(1, jj)>=ii
            freqcounter=freqcounter + 1;
        else
        end
    end
    freqvec(kk)=freqcounter;
    kk=kk+1;
    end
freqvecHGa(ll,:)=freqvec;
end
for mm = 1:size(freqvecHGa, 2)
freqvecHGam(mm)=mean(freqvecHGa(:,mm));
end

for ll = 1:size(HGe, 1)
    freqvec=0;
    kk=1;
    for ii=1:binadv:(tfinal-mybinsize)
    freqcounter=0;
    for jj = 1:size(HGe, 2)
        if HGe(ll, jj)<=ii+mybinsize && HGe(1, jj)>=ii
            freqcounter=freqcounter + 1;
        else
        end
    end
    freqvec(kk)=freqcounter;
    kk=kk+1;
    end
freqvecHGe(ll,:)=freqvec;
end
for mm = 1:size(freqvecHGe, 2)
freqvecHGem(mm)=mean(freqvecHGe(:,mm));
end

for ll = 1:size(MPGa, 1)
    freqvec=0;
    kk=1;
    for ii=1:binadv:(tfinal-mybinsize)
    freqcounter=0;
    for jj = 1:size(MPGa, 2)
        if MPGa(ll, jj)<=ii+mybinsize && MPGa(1, jj)>=ii
            freqcounter=freqcounter + 1;
        else
        end
    end
    freqvec(kk)=freqcounter;
    kk=kk+1;
    end
freqvecMPGa(ll,:)=freqvec;
end
for mm = 1:size(freqvecMPGa, 2)
freqvecMPGam(mm)=mean(freqvecMPGa(:,mm));
end

for ll = 1:size(MPGe, 1)
    freqvec=0;
    kk=1;
    for ii=1:binadv:(tfinal-mybinsize)
    freqcounter=0;
    for jj = 1:size(MPGe, 2)
        if MPGe(ll, jj)<=ii+mybinsize && MPGe(1, jj)>=ii
            freqcounter=freqcounter + 1;
        else
        end
    end
    freqvec(kk)=freqcounter;
    kk=kk+1;
    end
freqvecMPGe(ll,:)=freqvec;
end
for mm = 1:size(freqvecMPGe, 2)
freqvecMPGem(mm)=mean(freqvecMPGe(:,mm));
end

for ll = 1:size(PUD, 1)
freqvec=0;
kk=1;

for ii=1:binadv:(tfinal-mybinsize)
    freqcounter=0;
    for jj = 1:size(PUD, 2)
        if PUD(1, jj)<=ii+mybinsize && PUD(1, jj)>=ii
            freqcounter=freqcounter + 1;
        else
        end
    end
    freqvec(kk)=freqcounter;
    kk=kk+1;
end
freqvecPUD(ll, :)=freqvec;

end
for mm = 1:size(freqvecPUD, 2)
freqvecPUDm(mm)=mean(freqvecPUD(:,mm));
end


figure(1)
clf
subplot(5,1,1)
hold on
plot(tvec, freqvecHGe)
title('Hypogastic Efferent Firing Rate, Efferent')
xlabel('Time(ms)')
ylabel('Rate (Hz)')
hold off

subplot(5,1,2)
hold on
plot(tvec, freqvecHGa)
title('Hypogastic Efferent Firing Rate, Afferent')
xlabel('Time(ms)')
ylabel('Rate (Hz)')
hold off

subplot(5,1,3)
hold on
plot(tvec, freqvecMPGe)
title('MPG Firing Rate, Efferent')
xlabel('Time(ms)')
ylabel('Rate (Hz)')
hold off

subplot(5,1,4)
hold on
plot(tvec, freqvecMPGa)
title('MPG Friring Rate, Afferent')
xlabel('Time(ms)')
ylabel('Rate (Hz)')
hold off

subplot(5,1,5)
hold on
plot(tvec, freqvecPUD)
title('Pudendal Firing Rate')
xlabel('Time(ms)')
ylabel('Rate (Hz)')
hold off



