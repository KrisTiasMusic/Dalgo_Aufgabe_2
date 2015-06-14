stop(t);

[xclick, yclick] = ginput;

set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi)));

start(t);
