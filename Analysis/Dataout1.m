%Dataout.m


mainvec;


MPGB=mainvec((1:250), :);
MPGA=mainvec((251:275), :);
MPGE=mainvec((275:300), :);
HGB=mainvec((301:550), :);
HGA=mainvec((551:575), :);
HGE=mainvec((576:600), :);
PUD=mainvec((601:625), :);

for pp = 1:length(MPGB)
    MPGBa(pp)=sum(MPGB(:, pp))./10;
    MPGAa(pp)=sum(MPGA(:, pp));
    MPGEa(pp)=sum(MPGE(:, pp));
    HGBa(pp)=sum(HGB(:, pp))./10;
    HGAa(pp)=sum(HGA(:, pp));
    HGEa(pp)=sum(HGE(:, pp));
    PUDa(pp)=sum(PUD(:, pp));
end

figure(1)
clf

subplot(7,1,1)
plot(MPGBa)
title('Bladder-connected MPG (MPGb)')
subplot(7,1,2)
plot(MPGAa)
title('Pelvic Afferent (MPGa)')
subplot(7,1,3)
plot(MPGEa)
title('Pelvic Efferent (MPGe)')
subplot(7,1,4)
plot(HGBa)
title('Bladder-connected HG (HGb)')
subplot(7,1,5)
plot(HGAa)
title('Hypogastric Afferent (HGa)')
subplot(7,1,6)
plot(HGEa)
title('Hypogastric Efferent (HGe)')
subplot(7,1,7)
plot(PUDa)
title('PUD')
