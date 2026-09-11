# Unbounded two-cycle contributions to permanents of positive semidefinite matrices

For a Hermitian positive semidefinite matrix A of order n with a distinguished index 0, let

    T(A) = Σ_{j≠0} |a_0j|² · per A(0̂, ĵ)

be the contribution to per A of the permutations in which 0 lies in a two-cycle.
Zhang's 2016 survey (*Special Matrices* 4, eq. (21)) records the inequality T(A) ≤ per A
as "an interesting open problem".

**It fails, by an unbounded factor.** T(A)/per A is unbounded over complex matrices of
rank two and over real matrices of rank three; an explicit sequence of complex rank-two
matrices of order n has T(A)/per A ∼ (c₀/3)·log n with c₀ = 0.4253….

**Explicit counterexample.** The Gram matrix of the 13 vectors in ℂ²

    (1,0);  (5, 3i^j) for j = 0..3;  (5, 5(1+i)i^j) for j = 0..3;  (0,1) four times

is Hermitian PSD of rank two with Gaussian-integer entries, and

    per A = 32030415900000000000
    T(A)  = 32217583221000000000

so T(A)/per A = 1193243823/1186311700 > 1. A real integer example of order 473 and
rank three is also given.

Method: Fischer norms. per A is the squared norm of a product of linear forms, T(A)
a weighted sum of squared norms with one factor removed, and the univariate family
∏(1 − z⁴/81k²) built from the sine product has logarithmically growing ratio.

- `two_cycle_unbounded.pdf` — the paper
- `twocycle.typ`, `refs.yml` — Typst source; build with `typst compile twocycle.typ`
