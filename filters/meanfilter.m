I=(imread('pep.png'));
[sat,sut,k]=size(I);
A = imnoise(I,'Salt & pepper',0.1);
O=zeros(sat,sut,k);
W=[1/9 1/9 1/9;
   1/9 1/9 1/9;
   1/9 1/9 1/9];
for x=2:(sat-1)
    for y = 2:(sut-1)
        for a = 1:3
           O(x,y,a)=(...
            W(1,1)*A(x-1,y-1,a)+W(1,2)*A(x-1,y,a)+W(1,3)*A(x-1,y+1,a)...
            +W(2,1)*A(x,y-1,a)+W(2,2)*A(x,y,a)+W(2,3)*A(x,y+1,a)...
            +W(3,1)*A(x+1,y-1,a)+W(3,2)*A(x+1,y,a)+W(3,3)*A(x+1,y+1,a)...
            );
        
        end
    end
end
figure(1);
imshow(uint8(A))
figure(2);
imshow(uint8(O));
