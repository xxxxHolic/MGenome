function q = q_space(L,scale,c)

vector_a = [L(1,1) L(1,2) L(1,3)];
vector_b = [L(2,1) L(2,2) L(2,3)];
vector_c = [L(3,1) L(3,2) L(3,3)];

Q_vector_a = cross(vector_b,vector_c)./dot(vector_a,(cross(vector_b,vector_c)));
Q_vector_b = cross(vector_c,vector_a)./dot(vector_b,(cross(vector_c,vector_a)));
Q_vector_c = cross(vector_a,vector_b)./dot(vector_c,(cross(vector_a,vector_b)));
q = NaN(scale*scale*scale,3);
% q = NaN(scale*scale*scale,6);
num = 0;

for i = 1:scale
    for j = 1:scale
         for m = 1:scale
             Qp = (i-5).*Q_vector_a + (j-5).*Q_vector_b + (m-5).*Q_vector_c;
             num = num + 1;
             q(num,1) = Qp(1);q(num,2) = Qp(2);q(num,3) = Qp(3);
%              PP = [i-5 j-5 m-5];
%              PP = round(PP*c);
%              q(num,4:6) = PP;
%%% This part is used to get the postion %%%%
             clear Qp;
         end
    end
end

end
