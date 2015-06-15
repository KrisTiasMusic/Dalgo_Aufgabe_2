stop(t);

[xwave, ywave] = ginput(1);

delete(h_POSITION_text)
clear h_POSITION_text

text = ['Position: x = ' num2str(xwave)...
                    ' y = ' num2str(ywave)];
                
h_POSITION_text = uicontrol('style', 'text',...
                            'string',text,...
                            'position',[600 200 180 15]);

xwave = round(10 * (xwave + 10)) + 1;
ywave = round(10 * (ywave + 10)) + 1;
                        
set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));

start(t);
