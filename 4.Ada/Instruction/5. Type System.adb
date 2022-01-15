-- Constrained vs. Unconstrained
type I is range 1 .. 10;				 -- constrained
type AC is array (1 .. 10) of ...	 -- constrained

type AU is array (I range <>) of ... -- unconstrained
type R (X: Discriminant [:= Default]) is ... -- unconstrained

-- Definite vs. Indefinite
type I is range 1 .. 10;							-- definite
type RD (X: Discriminant := Default) is ...	-- definite
type T (<>) is ...									-- indefinite
type AU is array (I range <>) of ...			-- indefinite
type RI (X: Discriminant) is ...					-- indefinite
