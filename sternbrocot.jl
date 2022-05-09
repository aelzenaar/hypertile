using LinearAlgebra

L = [1,1; 0,1];
R = [1,0; 1,1];

"Produce the binary sequence representing p/q > 0."
function binary_from_fraction(p,q)
  S = I(2);
  B = [];

  while (p,q) != fraction_from_matrix(S)
    if p/q < fraction_from_matrix(S)
      append!(B,'L')
      S = S*L
    else
      append!(B,'R')
      S = S*R
    end
  end

  return B
end

function fraction_from_matrix(M)
  return (M[1,1] + M[1,2], M[2,1] + M[2,2])
end

function matrix_from_binary(B)
  S = I(2);
  for bit in B
    if bit == 'L'
      S = S*L
    else
      S = S*R
    end
  end
  return S
end

"Produce the fraction p/q corresponding to the sequence B."
function fraction_from_binary(B)
  return fraction_from_matrix(matrix_from_binary(B))
end

"Produce the left child of B."
function left_child(B)
  return append(B,'L')
end

function left_child(B)
  return append(B,'R')
end

"Produce the parent in the Stern-Brocot tree to B."
function parent(B)
  return B[1:end-1]
end

"Produce the left Farey summand for B."
function left_summand(B)
  M = matrix_from_binary(B)
  return (M[1,1],M[2,1])
end

"Produce the right Farey summand for B."
function right_summand(B)
  M = matrix_from_binary(B)
  return (M[1,2],M[2,2])
end
