%% Matlab Code for Skewed Multifractal Detrended Fluctuation Analysis
%  This code can be easily extended to perform Segmented
%  Multifractal Detrended Fluctuation Analysis. 
%  Cite: Saâdaoui, F., 2023. Skewed multifractal scaling of stock markets 
%  during the COVID-19 pandemic, Chaos, Solitons & Fractals, Vol. 170,
%  113372.
%-------------------------------------------------------------------------
clear
S=uiimport('-file');
firstFieldName = fieldnames(S);
SERIES = S.(char(firstFieldName));
plot(SERIES)
time = 1:length(SERIES);
i = findchangepts(diff(SERIES),'Statistic','rms');
ax = gca;
xp = [time(i) ax.XLim([2 2]) time(i)];
yp = ax.YLim([1 1 2 2]);
patch(xp,yp,[.5 .5 .5],'FaceAlpha',0.1)
[dh1,h1,cp1,tauq1] = dwtleader(SERIES(1:i));
[dh2,h2,cp2,tauq2] = dwtleader(SERIES(i+1:end));
figure;
hp = plot(h1,dh1,'b-o',h2,dh2,'b-^');
hp(1).MarkerFaceColor = 'b';
hp(2).MarkerFaceColor = 'r';
grid on;
xlabel('h'); ylabel('D(h)');
legend('Segment 1','Segment 2','Location','NorthEast');
title('Multifractal Spectra');

%