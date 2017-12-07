%% Code for Section 5: The fast Fourier transform
% This code is for learning the Fourier transform.

% mikexcohen.com

%%

%% VIDEO: How the FFT works, speed tests

%% 

% create the signal
pnts   = 1000; % number of time points
signal = randn(1,pnts);


% start the timer for "slow" Fourier transform
tic;

% prepare the Fourier transform
fourTime = (0:pnts-1)/pnts;
fCoefs   = zeros(size(signal));

for fi=1:pnts
    csw = exp( -1i*2*pi*(fi-1)*fourTime );
    fCoefs(fi) = sum( signal.*csw );
end

% end timer for slow Fourier transform
t(1) = toc;


% time the fast Fourier transform
tic;
fCoefsF = fft(signal);
t(2) = toc;

% and plot
figure(1), clf
bar(t)
set(gca,'xlim',[0 3],'xticklabel',{'slow';'fast'},'xtick',1:2)
ylabel('Computation time (sec.)')

%% fft still need normalizations

srate = 1000;
time  = 0:1/srate:2;
npnts = length(time);

% signal
signal = 2*sin(2*pi*6*time);

% Fourier spectrum
signalX = fft(signal);
hz = linspace(0,srate/2,npnts);

% amplitude
ampl = abs(signalX(1:length(hz)));

figure(2), clf
stem(hz,ampl,'ks-','linew',3,'markersize',10,'markerfacecolor','w')

% make plot look a bit nicer
set(gca,'xlim',[0 10])
xlabel('Frequency (Hz)'), ylabel('Amplitude (a.u.)')

%%

%% VIDEO: The fast inverse Fourier transform

%%

%% 

clear

% set parameters
srate = 1000;
time  = 0:1/srate:3;
pnts  = length(time);

% create multispectral signal
signal  = (1+sin(2*pi*12*time)) .* cos(sin(2*pi*25*time)+time);

% fft
signalX = fft(signal);

% reconstruction via ifft
reconSig = ifft(signalX);

% could also be done in one line:
%reconSig = ifft(fft(signal));

figure(3), clf
plot(time,signal,'b.-','linew',2,'markersize',15)
hold on
plot(time,reconSig,'ro','linewidth',2)
xlabel('Time (sec.)'), ylabel('amplitude (a.u.)')
legend({'Original';'Reconstructed'})
zoom on


%%

%% VIDEO: The perfection of the Fourier transform

%%

%% 

pnts = 1000; % number of time points

% prepare the Fourier transform
fourTime = (0:pnts-1)/pnts;
F        = zeros(pnts);

for fi=1:pnts
    
    % create complex sine wave
    csw = exp( -1i*2*pi*(fi-1)*fourTime );
    
    % put csw into column of matrix F
    F(:,fi) = csw;
end

% compute inverse of F (and normalize by N)
Finv = inv(F)*pnts;

% plot one sine wave
figure(4), clf
subplot(211)
plot(fourTime,real(F(:,5)), fourTime,imag(F(:,5)),'linew',3)
xlabel('Time (norm.)')
legend({'real';'imag'})
set(gca,'ylim',[-1.05 1.05])
title('One column of matrix F')

subplot(212)
plot(fourTime,real(Finv(:,5)), fourTime,imag(Finv(:,5)),'linew',3)
xlabel('Time (norm.)')
legend({'real';'imag'})
set(gca,'ylim',[-1.05 1.05])
title('One column of matrix F^{-1}')

%% done.
