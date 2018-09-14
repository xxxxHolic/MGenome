function q = q_space(L,scale)

Q_vector_a = [L(1,1) L(1,2) L(1,3)];
Q_vector_b = [L(2,1) L(2,2) L(2,3)];
Q_vector_c = [L(3,1) L(3,2) L(3,3)];
q = NaN(scale*scale*scale,6);
num = 0;

for i = 1:scale
    for j = 1:scale
         for m = 1:scale
             Qp = (i-5).*Q_vector_a + (j-5).*Q_vector_b + (m-5).*Q_vector_c;
             num = num + 1;
             q(num,1) = Qp(1);q(num,2) = Qp(2);q(num,3) = Qp(3);
             q(num,4) = i-5;q(num,5) = j-5;q(num,6) = m-5;
             clear Qp;
         end
    end
end

end
