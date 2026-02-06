--Este Deco_5_a_32 recibe 5 datos de entrada 'S', mientras que tiene 32 salidas.
--Es basicamente igual a otros decos, pero con la excepecion del tamaño de selectores 'S' y salidas.

library IEEE;
use IEEE.std_logic_1164.all;

entity Deco_5_a_32 is
	port (
	S: in std_logic_vector (4 downto 0);
	a, b, c, d, e, f, g, h, i, j,
	k, l, m, n, o, p, q, r, si, t,
	u, w, x, y, z, a1, b1, c1, d1, e1,
	f1, g1: out std_logic);
end Deco_5_a_32;
 
architecture Deco_5_a_32 of Deco_5_a_32 is
begin
	a <= not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0));
	b <= not(S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and (S(0));
	c <= not(S(4)) and not(S(3)) and not(S(2)) and (S(1)) and not(S(0));
	d <= not(S(4)) and not(S(3)) and not(S(2)) and (S(1)) and (S(0));
	e <= not(S(4)) and not(S(3)) and (S(2)) and not(S(1)) and not(S(0));
	f <= not(S(4)) and not(S(3)) and (S(2)) and not(S(1)) and (S(0));
	g <= not(S(4)) and not(S(3)) and (S(2)) and (S(1)) and not(S(0));
	h <= not(S(4)) and not(S(3)) and (S(2)) and (S(1)) and (S(0));
	i <= not(S(4)) and (S(3)) and not(S(2)) and not(S(1)) and not(S(0));
	j <= not(S(4)) and (S(3)) and not(S(2)) and not(S(1)) and (S(0));
	k <= not(S(4)) and (S(3)) and not(S(2)) and (S(1)) and not(S(0));
	l <= not(S(4)) and (S(3)) and not(S(2)) and (S(1)) and (S(0));
	m <= not(S(4)) and (S(3)) and (S(2)) and not(S(1)) and not(S(0));
	n <= not(S(4)) and (S(3)) and (S(2)) and not(S(1)) and (S(0));
	o <= not(S(4)) and (S(3)) and (S(2)) and (S(1)) and not(S(0));
	p <= not(S(4)) and (S(3)) and (S(2)) and (S(1)) and (S(0));
	q <= (S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and not(S(0));
	r <= (S(4)) and not(S(3)) and not(S(2)) and not(S(1)) and (S(0));
	si <= (S(4)) and not(S(3)) and not(S(2)) and (S(1)) and not(S(0));
	t <= (S(4)) and not(S(3)) and not(S(2)) and (S(1)) and (S(0));
	u <= (S(4)) and not(S(3)) and (S(2)) and not(S(1)) and not(S(0));
	w <= (S(4)) and not(S(3)) and (S(2)) and not(S(1)) and (S(0));
	x <= (S(4)) and not(S(3)) and (S(2)) and (S(1)) and not(S(0));
	y <= (S(4)) and not(S(3)) and (S(2)) and (S(1)) and (S(0));
	z <= (S(4)) and (S(3)) and not(S(2)) and not(S(1)) and not(S(0));
	a1 <= (S(4)) and (S(3)) and not(S(2)) and not(S(1)) and (S(0));
	b1 <= (S(4)) and (S(3)) and not(S(2)) and (S(1)) and not(S(0));
	c1 <= (S(4)) and (S(3)) and not(S(2)) and (S(1)) and (S(0));
	d1 <= (S(4)) and (S(3)) and (S(2)) and not(S(1)) and not(S(0));
	e1 <= (S(4)) and (S(3)) and (S(2)) and not(S(1)) and (S(0));
	f1 <= (S(4)) and (S(3)) and (S(2)) and (S(1)) and not(S(0));
	g1 <= (S(4)) and (S(3)) and (S(2)) and (S(1)) and (S(0));
end Deco_5_a_32;