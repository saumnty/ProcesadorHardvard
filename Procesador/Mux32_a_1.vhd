library IEEE;
use IEEE.std_logic_1164.all;

entity Mux32_a_1 is
	port (
	a, b, c, d, e, f, g, h, i, j,
	k, l, m, n, o, p, q, r, si, t,
	u, w, x, y, z, a1, b1, c1, d1, e1,
	f1, g1: in std_logic;
	S: in std_logic_vector (4 downto 0);
	Rout: out std_logic);
end Mux32_a_1;
 
architecture Mux32_a_1 of Mux32_a_1 is
begin
	Rout <= ((a and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0))) or
		(b and not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and (S(0))) or
		(c and not(S(4)) and not(S(3)) and not(S(2)) and (S(1)) and not(S(0))) or
		(d and not(S(4)) and not(S(3)) and not(S(2)) and (S(1)) and (S(0))) or
		(e and not(S(4)) and not(S(3)) and (S(2)) and not(S(1)) and not(S(0))) or
		(f and not(S(4)) and not(S(3)) and (S(2)) and not(S(1)) and (S(0))) or
		(g and not(S(4)) and not(S(3)) and (S(2)) and (S(1)) and not(S(0))) or
		(h and not(S(4)) and not(S(3)) and (S(2)) and (S(1)) and (S(0))) or
		(i and not(S(4)) and (S(3)) and not(S(2)) and not(S(1)) and not(S(0))) or
		(j and not(S(4)) and (S(3)) and not(S(2)) and not(S(1)) and (S(0))) or
		(k and not(S(4)) and (S(3)) and not(S(2)) and (S(1)) and not(S(0))) or
		(l and not(S(4)) and (S(3)) and not(S(2)) and (S(1)) and (S(0))) or
		(m and not(S(4)) and (S(3)) and (S(2)) and not(S(1)) and not(S(0))) or
		(n and not(S(4)) and (S(3)) and (S(2)) and not(S(1)) and (S(0))) or
		(o and not(S(4)) and (S(3)) and (S(2)) and (S(1)) and not(S(0))) or
		(p and not(S(4)) and (S(3)) and (S(2)) and (S(1)) and (S(0))) or
		(q and (S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0))) or
		(r and (S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and (S(0))) or
		(si and (S(4)) and not(S(3)) and not(S(2)) and (S(1)) and not(S(0))) or
		(t and (S(4)) and not(S(3)) and not(S(2)) and (S(1)) and (S(0))) or
		(u and (S(4)) and not(S(3)) and (S(2)) and not(S(1)) and not(S(0))) or
		(w and (S(4)) and not(S(3)) and (S(2)) and not(S(1)) and (S(0))) or
		(x and (S(4)) and not(S(3)) and (S(2)) and (S(1)) and not(S(0))) or
		(y and (S(4)) and not(S(3)) and (S(2)) and (S(1)) and (S(0))) or
		(z and (S(4)) and (S(3)) and not(S(2)) and not(S(1)) and not(S(0))) or
		(a1 and (S(4)) and (S(3)) and not(S(2)) and not(S(1)) and (S(0))) or
		(b1 and (S(4)) and (S(3)) and not(S(2)) and (S(1)) and not(S(0))) or
		(c1 and (S(4)) and (S(3)) and not(S(2)) and (S(1)) and (S(0))) or
		(d1 and (S(4)) and (S(3)) and (S(2)) and not(S(1)) and not(S(0))) or
		(e1 and (S(4)) and (S(3)) and (S(2)) and not(S(1)) and (S(0))) or
		(f1 and (S(4)) and (S(3)) and (S(2)) and (S(1)) and not(S(0))) or
		(g1 and (S(4)) and (S(3)) and (S(2)) and (S(1)) and (S(0)))); 
end Mux32_a_1;