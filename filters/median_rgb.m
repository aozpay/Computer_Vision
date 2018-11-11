clear all
%RGB fotografi oku
I = imread('colorapp_pep.png');
%Tuz-biber gürültüsü ekle.
A = imnoise(I,'Salt & pepper',0.1);
figure,imshow(A);title('Tuz-biber gurultusu eklenmis fotograf');
%Cekirdek matris boyutlari
M=3;
N=3;
%Kenar bosluklar?na 1,1 ekleme yap.
modifyA=padarray(A,[floor(M/2),floor(N/2)]);
%Fotografin sat?r ve sütun boyutunda sifir matrisi olustur.
B = zeros([size(A,1) size(A,2)]);
%Sat?r say?s?d?r.
for i = 1:size(modifyA,1)-(M-1)
    %Sutun sayisidir.
    for j = 1:size(modifyA,2)-(N-1)
       %3x3lük cekirdek matrisi al.
        temp = modifyA(i:i+(M-1),j:j+(N-1),:);
        
        for k = 1:3
           %3x3lük matrisin tüm sat?r ve sütunlar?n? al.
          tmp = temp(:,:,k);
          %3x3lük matrisin orta degerini bul.
          B(i,j,k) = median(tmp(:));
        end
    end
end

B = uint8(B);
figure,imshow(B);
title('Median filtre sonrasi');