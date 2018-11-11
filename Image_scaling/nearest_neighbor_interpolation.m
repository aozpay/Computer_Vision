clear all
close all
clc
a = imread('clock.jpg');
imshow(a)
unit_lenght = 500/800; %% Ölçeklendirme orani
new_picture = zeros(800,800); %% Yeni resim 800x800 olacakt?r.

for renk = 1:3
    for satir = 1:800
        for sutun = 1:800
        satir_500 = round(satir * unit_lenght);
        sutun_500 = round(sutun * unit_lenght);
        new_picture(satir,sutun,renk) = a(satir_500,sutun_500,renk);
        end
    end
end
figure,imshow(uint8(new_picture)) %% Yeni resmi göster