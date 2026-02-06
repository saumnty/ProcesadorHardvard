library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_32_a_18Bits is
	port (
	A, B, C, D, E, F, G, H, I, J,
	K, L, M, N, O, P, Q, R, Si, T,
	U, W, X, Y, Z, A1, B1, C1, D1, E1,
	F1, G1: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (4 downto 0);
	Rout: out std_logic_vector (7 downto 0));
end Mux_32_a_18Bits;
 
architecture Mux_32_a_18Bits of Mux_32_a_18Bits is
component Mux32_a_1 
	port (
	a, b, c, d, e, f, g, h, i, j,
	k, l, m, n, o, p, q, r, si, t,
	u, w, x, y, z, a1, b1, c1, d1, e1,
	f1, g1: in std_logic;
	S: in std_logic_vector (4 downto 0);
	Rout: out std_logic);
end component; 

begin
	Mux_32_a_18Bits_0: Mux32_a_1 port map (A(0), B(0), C(0), D(0), E(0), F(0), G(0), H(0), I(0), J(0),
	K(0), L(0), M(0), N(0), O(0), P(0), Q(0), R(0), Si(0), T(0), U(0), W(0), X(0), Y(0), Z(0),
	A1(0), B1(0), C1(0), D1(0), E1(0), F1(0), G1(0), S, Rout(0));
	Mux_32_a_18Bits_1: Mux32_a_1 port map (A(1), B(1), C(1), D(1), E(1), F(1), G(1), H(1), I(1), J(1),
	K(1), L(1), M(1), N(1), O(1), P(1), Q(1), R(1), Si(1), T(1), U(1), W(1), X(1), Y(1), Z(1),
	A1(1), B1(1), C1(1), D1(1), E1(1), F1(1), G1(1), S, Rout(1));
	Mux_32_a_18Bits_2: Mux32_a_1 port map (A(2), B(2), C(2), D(2), E(2), F(2), G(2), H(2), I(2), J(2),
	K(2), L(2), M(2), N(2), O(2), P(2), Q(2), R(2), Si(2), T(2), U(2), W(2), X(2), Y(2), Z(2),
	A1(2), B1(2), C1(2), D1(2), E1(2), F1(2), G1(2), S, Rout(2));
	Mux_32_a_18Bits_3: Mux32_a_1 port map (A(3), B(3), C(3), D(3), E(3), F(3), G(3), H(3), I(3), J(3),
	K(3), L(3), M(3), N(3), O(3), P(3), Q(3), R(3), Si(3), T(3), U(3), W(3), X(3), Y(3), Z(3),
	A1(3), B1(3), C1(3), D1(3), E1(3), F1(3), G1(3), S, Rout(3));
	Mux_32_a_18Bits_4: Mux32_a_1 port map (A(4), B(4), C(4), D(4), E(4), F(4), G(4), H(4), I(4), J(4),
	K(4), L(4), M(4), N(4), O(4), P(4), Q(4), R(4), Si(4), T(4), U(4), W(4), X(4), Y(4), Z(4),
	A1(4), B1(4), C1(4), D1(4), E1(4), F1(4), G1(4), S, Rout(4));
	Mux_32_a_18Bits_5: Mux32_a_1 port map (A(5), B(5), C(5), D(5), E(5), F(5), G(5), H(5), I(5), J(5),
	K(5), L(5), M(5), N(5), O(5), P(5), Q(5), R(5), Si(5), T(5), U(5), W(5), X(5), Y(5), Z(5),
	A1(5), B1(5), C1(5), D1(5), E1(5), F1(5), G1(5), S, Rout(5));
	Mux_32_a_18Bits_6: Mux32_a_1 port map (A(6), B(6), C(6), D(6), E(6), F(6), G(6), H(6), I(6), J(6),
	K(6), L(6), M(6), N(6), O(6), P(6), Q(6), R(6), Si(6), T(6), U(6), W(6), X(6), Y(6), Z(6),
	A1(6), B1(6), C1(6), D1(6), E1(6), F1(6), G1(6), S, Rout(6));
	Mux_32_a_18Bits_7: Mux32_a_1 port map (A(7), B(7), C(7), D(7), E(7), F(7), G(7), H(7), I(7), J(7),
	K(7), L(7), M(7), N(7), O(7), P(7), Q(7), R(7), Si(7), T(7), U(7), W(7), X(7), Y(7), Z(7),
	A1(7), B1(7), C1(7), D1(7), E1(7), F1(7), G1(7), S, Rout(7));

end Mux_32_a_18Bits;