// Unbounded two-cycle contributions to permanents of positive semidefinite matrices
#set page(paper: "a4", margin: (x: 1.1in, y: 1.0in), numbering: "1")
#set text(size: 11pt)
#set par(justify: true, leading: 0.62em, first-line-indent: 1.2em)
#set heading(numbering: "1.")
#show heading: it => { v(0.6em); it; v(0.3em) }
#set math.equation(numbering: "(1)")
#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(el.location(), numbering(el.numbering, ..counter(math.equation).at(el.location())))
  } else { it }
}

#let per = math.op("per")
#let un(body) = [#set math.equation(numbering: none); #body]
#let thm(kind, num, name: none, body) = block(width: 100%, above: 1.1em, below: 1.1em)[
  *#kind #num*#if name != none [ (#name)]. #emph(body)
]
#let rem(kind, num, name: none, body) = block(width: 100%, above: 1.1em, below: 1.1em)[
  *#kind #num*#if name != none [ (#name)]. #body
]
#let proof(body) = block(width: 100%, above: 0.8em, below: 1.1em)[_Proof._ #body #h(1fr) $square$]

#align(center)[
  #text(size: 17pt, weight: "bold")[Unbounded two-cycle contributions to permanents of positive semidefinite matrices]
  #v(0.6em)
  #text(size: 12pt)[liqsweep]
  #v(0.2em)
  #text(size: 10pt)[X: \@liqsweep]
  #v(0.2em)
  #text(size: 10pt)[September 2026]
]
#v(0.6em)

#block(inset: (x: 2.2em))[
  #set par(first-line-indent: 0em)
  *Abstract.* Let $A$ be a complex Hermitian positive semidefinite matrix of order $n$ with a distinguished index $0$, and let $T(A) = sum_(j != 0) abs(a_(0 j))^2 per A(hat(0), hat(j))$ be the contribution to $per A$ of the permutations in which $0$ lies in a two-cycle. Zhang's 2016 survey records the inequality $T(A) <= per A$ as an open problem. We show that it fails, and that it fails by an unbounded factor: $T(A) \/ per A$ is unbounded over complex matrices of rank two and over real matrices of rank three, and an explicit sequence of complex rank-two matrices of order $n$ has $T(A) \/ per A ∼ (c_0 \/ 3) log n$ with $c_0 = 0.4253 dots$. A $13 times 13$ Gaussian-integer Gram matrix of rank two with $T(A) > per A$ is exhibited, as is a real integer matrix of order $473$ and rank three. The proof passes through the Fischer norm on polynomials: $per A$ is the squared norm of a product of linear forms, $T(A)$ is a weighted sum of squared norms of the product with one factor removed, and a univariate family built from the sine product has the required logarithmic growth.
]
#v(0.4em)

= Introduction

Let $A = (a_(i j))$ be a complex Hermitian positive semidefinite matrix of order $n$, indexed by $0, dots, n-1$, and let $per A = sum_(sigma in S_n) product_i a_(i, sigma(i))$. For distinct indices $i, j$ write $A(hat(i), hat(j))$ for the principal submatrix obtained by deleting rows and columns $i$ and $j$, and $A(hat(i))$ for the deletion of $i$ alone; the permanent of the empty matrix is $1$. Group the permutations according to the cycle containing $0$. Those fixing $0$ contribute $a_(0 0) per A(hat(0))$; those in which $0$ lies in a two-cycle with $j$ contribute $a_(0 j) a_(j 0) per A(hat(0), hat(j)) = abs(a_(0 j))^2 per A(hat(0), hat(j))$; the remaining permutations place $0$ in a cycle of length at least three. Put
$ T(A) = sum_(j=1)^(n-1) abs(a_(0 j))^2 per A(hat(0), hat(j)), quad quad R(A) = (T(A))/(per A) . $ <eq:T>
Thus $T(A)$ is the two-cycle contribution to the permanent, and $per A - a_(0 0) per A(hat(0)) - T(A)$ is the contribution of the long cycles.

The fixed-point contribution never exceeds the permanent: $a_(0 0) per A(hat(0)) <= per A$ is the one-by-one case of Lieb's inequality @Lie66. Every term of $T(A)$ is nonnegative. The long-cycle terms carry no sign, so the corresponding question for the two-cycle contribution,
$ T(A) <= per A , $ <eq:q>
is not settled by positivity. Drury proposed in 2016 the stronger inequality $(a_(0 0) per A(hat(0)))^2 + T(A)^2 <= (per A)^2$, which implies Chollet's conjecture; Hutchinson @Hut17 refuted it with a $4 times 4$ complex correlation matrix. The weaker inequality @eq:q survived. Zhang's survey @Zha16 states it as equation (21) and records: "(21) itself is an interesting open problem."

This paper shows that @eq:q fails, and that no constant can be put in its place.

#thm("Theorem", "1.1")[
  + $R(A)$ is unbounded over complex Hermitian positive semidefinite matrices of rank two. Explicitly, the matrices $A_L$ of Section 4, of order $n_L = 64 L^3 + 4L + 1$ and rank two, satisfy
    $ R(A_L) ∼ (c_0 / 3) log n_L quad (L -> oo), quad c_0 = 4/9 (norm(f_oo)^2)/(norm(z f_oo)^2) = 0.4253 dots , $ <eq:rate>
    where $f_oo (z) = sin(pi z^2 \/ 9) \/ (pi z^2 \/ 9)$ and the norms are Fischer norms.
  + $R(A)$ is unbounded over real symmetric positive semidefinite matrices of rank three, and over such matrices with integer entries.
  + In both cases the matrices can be taken to be correlation matrices, and the unboundedness persists over positive definite matrices.
]

The failure of @eq:q is already visible in a single small matrix.

#thm("Theorem", "1.2")[
  Let $A$ be the Gram matrix of the thirteen vectors
  #un[$ (1, 0); quad (5, thin 3 i^j) quad (0 <= j <= 3); quad (5, thin 5(1+i) i^j) quad (0 <= j <= 3); quad (0, 1) "four times" $]
  in $bb(C)^2$, with $(1, 0)$ distinguished. Then $A$ is Hermitian positive semidefinite of rank two with Gaussian-integer entries, and
  $ per A = 32 thin 030 thin 415 thin 900 thin 000 thin 000 thin 000, quad T(A) = 32 thin 217 thin 583 thin 221 thin 000 thin 000 thin 000, $ <eq:13>
  so that $R(A) = 1193243823 \/ 1186311700 > 1$.
]

A real symmetric integer matrix of order $473$ and rank three with $R > 1$ is given in Section 7.

*Method.* Write $A$ as the Gram matrix of vectors $v_0, dots, v_(n-1)$ and let $ell_i$ be the linear form with coefficient vector $v_i$. In the Fischer inner product on polynomials, $per A = norm(ell_0 p)^2$ with $p = product_(i >= 1) ell_i$, and $per A(hat(0), hat(j)) = norm(p \/ ell_j)^2$. So $R(A)$ compares the norm of a product of linear forms with the norms of the products obtained by deleting one factor, weighted by $abs(⟨ v_0, v_j ⟩)^2$. For a univariate polynomial $f$ with roots $alpha_j$ the analogous ratio is
$ Q(f) = (sum_j norm(f \/ (z - alpha_j))^2) / (norm(z f)^2) . $ <eq:Q>
For $f_L (z) = product_(k=1)^L (1 - z^4 \/ 81 k^2)$, whose roots are $3 sqrt(k) thin i^j$, each deleted-root norm is $norm(f_L)^2 \/ abs(alpha)^2$ up to a summable error, and summing $abs(alpha)^(-2) = 1 \/ 9k$ over the roots produces the harmonic number: $Q(f_L) ∼ c_0 log L$. Two transfers convert $Q(f)$ into $R(A)$: a homogenization with many copies of one vector gives complex Gram matrices of rank two, and a Gaussian concentration argument on the polynomial $x y (x^2 - y^2)$ gives real Gram matrices of rank three.

#rem("Remark", "1.3")[
  If $A$ is real with nonnegative entries, every permutation term is nonnegative and @eq:q is immediate. A violation therefore requires the long-cycle contribution to be negative and large. The constructions arrange this through complex phases in rank two and through sign patterns in rank three.
]

= The Fischer norm and Gram permanents

Let $cal(F)_d$ be the Fock space of entire functions $g$ on $bb(C)^d$ with
$ norm(g)^2 = pi^(-d) integral_(bb(C)^d) abs(g(z))^2 e^(-abs(z)^2) dif A(z) < oo . $ <eq:fock>
The monomials $z^alpha$ are orthogonal in $cal(F)_d$ with $norm(z^alpha)^2 = alpha! = product_k alpha_k !$, and the inner product is invariant under unitary changes of the variables. For $v in bb(C)^d$ let $ell_v (z) = sum_k v_k z_k$, and let $⟨ v, w ⟩ = sum_k overline(v_k) w_k$.

#thm("Lemma", "2.1")[
  For $v_1, dots, v_m, w_1, dots, w_m in bb(C)^d$,
  $ ⟨ product_(i=1)^m ell_(v_i), product_(j=1)^m ell_(w_j) ⟩ = per [⟨ v_i, w_j ⟩]_(i, j = 1)^m . $ <eq:gram>
]

#proof[
  Expanding, $product_i ell_(v_i) = sum_phi product_i v_(i, phi(i)) z_(phi(i))$, the sum over all maps $phi : {1, dots, m} -> {1, dots, d}$, and similarly for the $w_j$ with maps $psi$. The monomials $product_i z_(phi(i))$ and $product_j z_(psi(j))$ are orthogonal unless $phi$ and $psi$ have the same multiset of values, of type $alpha$ say, in which case their inner product is $alpha!$. The maps $psi$ with the multiset of $phi$ are exactly the $phi compose tau$, $tau in S_m$, and each arises from $alpha!$ permutations $tau$. Hence
  #un[$ ⟨ product_i ell_(v_i), product_j ell_(w_j) ⟩ = sum_phi sum_(tau in S_m) product_i overline(v_(i, phi(i))) product_j w_(j, phi(tau(j))) = sum_(tau in S_m) product_i ⟨ v_i, w_(tau^(-1)(i)) ⟩ , $]
  which is @eq:gram.
]

#thm("Corollary", "2.2")[
  Let $A = (⟨ v_i, v_j ⟩)_(i, j = 0)^(n-1)$ with $v_i in bb(C)^d$, let $ell_i = ell_(v_i)$ and $p = product_(i=1)^(n-1) ell_i$. Then $per A = norm(ell_0 p)^2$, $per A(hat(0), hat(j)) = norm(p \/ ell_j)^2$, and
  $ R(A) = (sum_(j=1)^(n-1) abs(⟨ v_0, v_j ⟩)^2 norm(p \/ ell_j)^2) / (norm(ell_0 p)^2) . $ <eq:R>
]

Every Hermitian positive semidefinite matrix is such a Gram matrix with $d = "rank" A$, and a real symmetric one is the Gram matrix of vectors in $bb(R)^d$.

= A univariate ratio with logarithmic growth

For a nonzero polynomial $f in bb(C)[z]$ with roots $alpha_1, dots, alpha_d$, listed with multiplicity, define $Q(f)$ by @eq:Q. It is unchanged when $f$ is multiplied by a nonzero scalar. Let
$ f_L (z) = product_(k=1)^L (1 - z^4/(81 k^2)), quad quad f_oo (z) = (sin(pi z^2 \/ 9))/(pi z^2 \/ 9) , $ <eq:fL>
so that $f_L -> f_oo$ locally uniformly by the sine product $sin (pi u) \/ (pi u) = product_(k >= 1) (1 - u^2 \/ k^2)$ @DLMF with $u = z^2 \/ 9$. The roots of $f_L$ are $alpha_(k, j) = 3 sqrt(k) thin i^j$, $1 <= k <= L$, $0 <= j <= 3$, with $abs(alpha_(k, j))^2 = 9k$.

#thm("Lemma", "3.1")[
  For every $L <= oo$, every subproduct $h$ of $f_L$ (in particular $f_L$ itself) satisfies $abs(h(z)) <= e^(pi abs(z)^2 \/ 9)$ for all $z in bb(C)$.
]

#proof[
  $abs(1 - z^4 \/ 81 k^2) <= 1 + abs(z)^4 \/ 81 k^2$, and $product_(k >= 1) (1 + t^2 \/ k^2) = sinh(pi t) \/ (pi t) <= e^(pi t)$ with $t = abs(z)^2 \/ 9$.
]

Since $2 pi \/ 9 < 1$, Lemma 3.1 places $f_oo$ and $z f_oo$ in $cal(F)_1$, and the dominant $4 abs(z)^2 e^((2 pi \/ 9 - 1) abs(z)^2)$ with dominated convergence gives
$ norm(f_L - f_oo) -> 0, quad norm(z (f_L - f_oo)) -> 0 quad (L -> oo) . $ <eq:conv>
Both limiting norms are positive; from the Taylor series of $f_oo$,
#un[$ norm(f_oo)^2 = sum_(k >= 0) (pi/9)^(4k) ((4k)!)/((2k+1)!^2) = 1.0105 dots, \
  norm(z f_oo)^2 = sum_(k >= 0) (pi/9)^(4k) ((4k+1)!)/((2k+1)!^2) = 1.0560 dots . $]

#thm("Proposition", "3.2")[
  With $H_L = sum_(k=1)^L 1 \/ k$,
  $ sum_(alpha : f_L (alpha) = 0) norm(f_L/(z - alpha))^2 = 4/9 H_L norm(f_L)^2 + O(1) , $ <eq:harm>
  the $O(1)$ being uniform in $L$. Consequently $Q(f_L) ∼ c_0 log L$ with $c_0 = (4 \/ 9) norm(f_oo)^2 \/ norm(z f_oo)^2 = 0.4253 dots$.
]

#proof[
  Fix a root $alpha = alpha_(k, j)$ and let $h = h_(L, k) = product_(l != k) (1 - z^4 \/ 81 l^2)$, so that $f_L = (1 - z^4 \/ alpha^4) h$ because $alpha^4 = 81 k^2$. Since $1 - z^4 \/ alpha^4 = -(z - alpha)(z^3 + alpha z^2 + alpha^2 z + alpha^3) \/ alpha^4$,
  #un[$ - alpha f_L/(z - alpha) = (1 + z/alpha + z^2/alpha^2 + z^3/alpha^3) h, quad "hence" quad - alpha f_L/(z - alpha) - f_L = (sum_(r=1)^4 (z/alpha)^r) h . $]
  By Lemma 3.1 the norms $norm(z^r h)$, $1 <= r <= 4$, are bounded by a constant independent of $L$ and $k$, and $abs(alpha) >= 3$, so the right side has norm at most $C \/ abs(alpha)$. Therefore $abs(alpha) norm(f_L \/ (z - alpha)) = norm(f_L) + O(abs(alpha)^(-1))$, and since $norm(f_L)$ is bounded,
  #un[$ norm(f_L/(z - alpha))^2 = (norm(f_L)^2)/(abs(alpha)^2) + O(abs(alpha)^(-3)) . $]
  Summing over the four roots with $abs(alpha)^2 = 9k$ and then over $k <= L$ gives $4 norm(f_L)^2 sum_k 1 \/ 9k$ plus an error bounded by a constant times $sum_(k >= 1) k^(-3 \/ 2) < oo$. This is @eq:harm. Dividing by $norm(z f_L)^2$ and using @eq:conv and $H_L ∼ log L$ gives the asymptotic for $Q(f_L)$.
]

= Complex matrices of rank two

Fix a polynomial $f = sum_(k=0)^d c_k z^k$ of degree $d >= 1$ with roots $alpha_1, dots, alpha_d$, and an integer $M >= 1$. Let $A_(f, M)$ be the Gram matrix of the $1 + d + M$ vectors
$ v_0 = (1, 0), quad v_j = (1, - alpha_j \/ sqrt(M)) quad (1 <= j <= d), quad v_(d+1) = dots.c = v_(d+M) = (0, 1) $ <eq:vecs>
in $bb(C)^2$. It is Hermitian positive semidefinite of rank exactly two, with $⟨ v_0, v_j ⟩ = 1$ for $1 <= j <= d$ and $⟨ v_0, v_i ⟩ = 0$ for $i > d$. In the variables $(z, w)$ the linear forms are $ell_0 = z$, $ell_j = z - (alpha_j \/ sqrt(M)) w$ and $ell_i = w$ for $i > d$. Define the homogenization
$ H_(M, d) f (z, w) = sum_(k=0)^d c_k M^(-(d-k) \/ 2) z^k w^(M + d - k) . $ <eq:hom>
Then $c_d product_(i >= 1) ell_i = H_(M, d) f$: indeed $w^M product_j (z - alpha_j w \/ sqrt(M)) = w^M (w \/ sqrt(M))^d f(z sqrt(M) \/ w) \/ c_d$, and expanding $f$ gives @eq:hom. Likewise, for $g_j = f \/ (z - alpha_j)$, which has degree $d - 1$ and leading coefficient $c_d$, $c_d product_(i >= 1, i != j) ell_i = H_(M, d-1) g_j$.

#thm("Lemma", "4.1")[
  Put $b_(M, j) = (M + j)! \/ (M! thin M^j) = product_(h=1)^j (1 + h \/ M)$, so that $1 <= b_(M, j) <= exp(j (j+1) \/ 2M)$. For $g = sum_k g_k z^k$ of degree $m$,
  $ norm(z H_(M, m) g)^2 = M! sum_(k=0)^m (k+1)! abs(g_k)^2 b_(M, m-k), quad norm(H_(M, m) g)^2 = M! sum_(k=0)^m k! abs(g_k)^2 b_(M, m-k) . $ <eq:weights>
]

#proof[
  The monomials in $z H_(M, m) g$ are $z^(k+1) w^(M+m-k)$ with coefficients $g_k M^(-(m-k) \/ 2)$; orthogonality gives $sum_k abs(g_k)^2 M^(-(m-k)) (k+1)! (M+m-k)!$, which is the first formula. The second is the same computation without the factor $z$.
]

#thm("Proposition", "4.2")[
  $ e^(-d(d+1) \/ 2M) Q(f) <= R(A_(f, M)) <= e^(d(d+1) \/ 2M) Q(f) . $ <eq:transfer>
]

#proof[
  By @eq:R, the identification of the forms, and the vanishing of $⟨ v_0, v_i ⟩$ for $i > d$,
  #un[$ R(A_(f, M)) = (sum_(j=1)^d norm(H_(M, d-1) g_j)^2)/(norm(z H_(M, d) f)^2) . $]
  By Lemma 4.1 the numerator lies between $M! sum_j norm(g_j)^2$ and $e^(d(d-1) \/ 2M)$ times that, and the denominator lies between $M! norm(z f)^2$ and $e^(d(d+1) \/ 2M)$ times that. The quotient of these ranges is @eq:transfer.
]

#thm("Theorem", "4.3")[
  Let $A_L = A_(f_L, (4L)^3)$, a complex Hermitian positive semidefinite matrix of rank two and order $n_L = 64 L^3 + 4L + 1$. Then $R(A_L) ∼ (c_0 \/ 3) log n_L$ as $L -> oo$. In particular $R$ is unbounded over complex matrices of rank two.
]

#proof[
  Here $d = 4L$ and $M = d^3$, so $d(d+1) \/ 2M = (d+1) \/ 2 d^2 -> 0$ and Proposition 4.2 gives $R(A_L) ∼ Q(f_L)$. Proposition 3.2 gives $Q(f_L) ∼ c_0 log L$, and $log n_L = 3 log L + O(1)$.
]

= Real matrices of rank three

Fix $f$ as before, with roots $alpha_j = a_j + i b_j$, $a_j, b_j in bb(R)$, and an integer $M >= 1$. Let $B_(f, M)$ be the Gram matrix of the $4M + d + 1$ real vectors
$ u_0 = (1, 0, 0), quad u_j = (1, - a_j/sqrt(2M), - b_j/sqrt(2M)) quad (1 <= j <= d), $ <eq:rvecs>
together with $M$ copies of each of $(0, 1, 0)$, $(0, 0, 1)$, $(0, 1, 1)$, $(0, 1, -1)$. It is real symmetric positive semidefinite of rank three, and $⟨ u_0, u_j ⟩ = 1$ for $1 <= j <= d$, $⟨ u_0, u_i ⟩ = 0$ for the remaining vectors. In the variables $(z, x, y)$ the forms are $ell_0 = z$, $ell_j = z - lambda_j$ with
$ lambda_j = (a_j x + b_j y)/sqrt(2M) , $ <eq:lam>
and the product of the $4M$ remaining forms is $q(x, y)^M$ with $q(x, y) = x y (x^2 - y^2)$. Hence
$ R(B_(f, M)) = (sum_(j=1)^d norm(q^M product_(l != j) (z - lambda_l))^2) / (norm(z thin q^M product_(l=1)^d (z - lambda_l))^2) . $ <eq:Rreal>

#thm("Proposition", "5.1")[
  $lim_(M -> oo) R(B_(f, M)) = Q(f)$.
]

#proof[
  Write both norms in @eq:Rreal as Gaussian integrals @eq:fock over $(z, x, y) in bb(C)^3$. The factor $abs(q(x, y))^(2M) e^(-abs(x)^2 - abs(y)^2)$ is common to numerator and denominator; normalize it to a probability measure $mu_M$ on $bb(C)^2$, and let $z$ be an independent standard complex Gaussian. Then
  $ R(B_(f, M)) = (bb(E) [sum_j product_(l != j) abs(z - lambda_l)^2]) / (bb(E) [abs(z)^2 product_l abs(z - lambda_l)^2]) , $ <eq:Rexp>
  the expectations taken over $mu_M$ and $z$.

  In polar coordinates $(x, y) = r omega$ with $omega$ on the unit sphere $S^3 subset bb(C)^2$, the measure $mu_M$ has density proportional to $r^(8M + 3) e^(-r^2) abs(q(omega))^(2M)$. So $r^2$ has the Gamma distribution with shape $4M + 2$ and rate $1$, independent of $omega$, and $bb(E)[(r^2 \/ 4M)^s] -> 1$ for every fixed $s >= 0$. The angular law $nu_M$ has density proportional to $abs(q(omega))^(2M)$. On the sphere, with $a = abs(x)^2$, $b = abs(y)^2$, $a + b = 1$ and $theta = arg x - arg y$,
  #un[$ abs(q(x, y))^2 = a b thin abs(x^2 - y^2)^2 = a b (1 - 4 a b cos^2 theta) <= 1/4 , $]
  with equality exactly on the two circles $C_(plus.minus) = { e^(i phi) (1, plus.minus i) \/ sqrt(2) }$. If $K subset S^3$ is closed and disjoint from $C_+ union C_-$, then $max_K abs(q)^2 < 1 \/ 4 - eta$ for some $eta > 0$, while the set where $abs(q)^2 > 1 \/ 4 - eta \/ 2$ has positive surface measure; so $nu_M (K) -> 0$. Thus every limit point of $nu_M$ is supported on $C_+ union C_-$. The maps $omega |-> e^(i phi) omega$ and $(x, y) |-> (x, -y)$ preserve the surface measure and $abs(q)$, so they preserve every $nu_M$; the limit is therefore the measure that picks $C_+$ or $C_-$ with probability $1 \/ 2$ each and a uniform phase $phi$ on it. Since $S^3$ is compact and the test functions below are polynomials in $omega, overline(omega)$, their $nu_M$-expectations converge, and together with the Gamma moments this gives convergence of every polynomial moment of $(x, y) \/ sqrt(2M) = (r \/ sqrt(2M)) omega$ to the corresponding moment of $e^(i phi) (1, epsilon i)$, $epsilon = plus.minus 1$.

  Under this limit $lambda_j -> e^(i phi) (a_j + epsilon i b_j)$, which is $e^(i phi) alpha_j$ for $epsilon = 1$ and $e^(i phi) overline(alpha_j)$ for $epsilon = -1$. The integrands in @eq:Rexp are polynomials in $z, overline(z), lambda, overline(lambda)$, so numerator and denominator converge to their values at the limit. Replacing $z$ by $e^(i phi) z$, which leaves the Gaussian law of $z$ unchanged, removes the phase, and replacing the roots by their conjugates conjugates the coefficients of the polynomials in $z$, which leaves Fischer norms unchanged. The denominator therefore tends to $norm(z f)^2 \/ abs(c_d)^2$ and the numerator to $sum_j norm(f \/ (z - alpha_j))^2 \/ abs(c_d)^2$. The quotient is $Q(f)$.
]

#thm("Theorem", "5.2")[
  $R$ is unbounded over real symmetric positive semidefinite matrices of rank three.
]

#proof[
  Given $K$, Proposition 3.2 provides $L$ with $Q(f_L) > K + 1$, and Proposition 5.1 provides $M$ with $R(B_(f_L, M)) > K$.
]

= Correlation matrices, integer entries, positive definiteness

Under a congruence $A |-> D A D^*$ with $D$ invertible diagonal, $per A$ and every term $abs(a_(0 j))^2 per A(hat(0), hat(j))$ are multiplied by the same factor $product_i abs(d_(i i))^2$, so $R$ is unchanged. All matrices constructed above have positive diagonal entries, so they can be normalized to correlation matrices of the same rank and the same ratio. This proves the first half of Theorem 1.1(iii).

For integer entries in the real case, fix $f_L$ and $M$ with $R(B_(f_L, M)) > K$ and replace the vectors $u_j$ of @eq:rvecs by rational vectors, keeping $u_0$ and the padding vectors fixed. The ratio is a continuous function of the vectors, so a sufficiently fine approximation keeps $R > K$ and, because the fixed vectors span $bb(R)^3$, keeps the rank equal to three. Scaling each vector by an integer is a diagonal congruence, so a common denominator produces an integer Gram matrix with the same ratio. This proves Theorem 1.1(ii).

Finally, if $A$ is any fixed matrix with $R(A) > K$, then $A + epsilon I$ is positive definite and $R(A + epsilon I) > K$ for all sufficiently small $epsilon > 0$, by continuity; normalization to a correlation matrix preserves this. This completes Theorem 1.1(iii). The perturbation does not preserve low rank.

= Explicit examples

*Proof of Theorem 1.2.* With the forms $ell_0 = z$, $ell_j = 5 z + 3 i^(j-1) w$ ($1 <= j <= 4$), $ell_(4+j) = 5 z + 5 (1+i) i^(j-1) w$ ($1 <= j <= 4$) and $ell_9 = dots.c = ell_12 = w$, the product of the twelve nondistinguished forms is
#un[$ p(z, w) = w^4 (625 z^4 - 81 w^4)(625 z^4 + 2500 w^4) \
  = 390625 thin z^8 w^4 + 1511875 thin z^4 w^8 - 202500 thin w^12 , $]
since $product_j (5z + 3 i^j w) = (5z)^4 - (3w)^4$ and $product_j (5z + 5(1+i) i^j w) = (5z)^4 - (5(1+i))^4 w^4$ with $(1+i)^4 = -4$. By Corollary 2.2, $per A = norm(z p)^2 = 390625^2 dot 9! dot 4! + 1511875^2 dot 5! dot 8! + 202500^2 dot 12!$, which is the value in @eq:13. The Gram entries are $⟨ v_0, v_j ⟩ = 5$ for $1 <= j <= 8$ and $0$ for the four copies of $(0, 1)$, so $T(A) = 25 sum_(j=1)^8 norm(p \/ ell_j)^2$. Multiplication of $w$ by $i$ is a unitary change of variables that permutes the forms within each quartet, so the eight norms take only two values, one for each quartet:
#un[$ N_1 = norm(p \/ ell_1)^2 = 277 thin 968 thin 834 thin 000 thin 000 thin 000, quad N_2 = norm(p \/ ell_5)^2 = 44 thin 206 thin 998 thin 210 thin 000 thin 000, \
  T(A) = 100 (N_1 + N_2) , $]
and expanding $p \/ ell_1 = w^4 (5z + 3 i w)(5z - 3w)(5z - 3 i w)(625 z^4 + 2500 w^4)$ and $p \/ ell_5$ into monomials gives the value of $T(A)$ in @eq:13. The difference is $T(A) - per A = 187 thin 167 thin 321 thin 000 thin 000 thin 000$. The rank is two because the vectors span $bb(C)^2$ and lie in it. $square$

The same matrix satisfies $(per A)^2 - per (A compose overline(A)) > 0$: it is not a counterexample to Chollet's conjecture @Cho82, and the two-cycle inequality @eq:q is genuinely weaker than the inequalities it was derived from.

#thm("Theorem", "7.1")[
  Let $B$ be the Gram matrix of the real vectors $(1, 0, 0)$, distinguished; $(8, plus.minus 1, 0)$ and $(8, 0, plus.minus 1)$; and $117$ copies of each of $(0, 1, 0)$, $(0, 0, 1)$, $(0, 1, 1)$, $(0, 1, -1)$. Then $B$ is a real symmetric positive semidefinite integer matrix of order $473$ and rank three with
  $ R(B) = 1.002580227152924020 dots > 1, quad "in particular" quad 401/400 < R(B) < 5013/5000 . $ <eq:473>
]

#proof[
  The product of the nondistinguished forms is $p = q(x, y)^117 (64 z^2 - x^2)(64 z^2 - y^2)$ with $q = x y (x^2 - y^2)$, whose expansion $x^117 y^117 (x^2 - y^2)^117 (4096 z^4 - 64 z^2 (x^2 + y^2) + x^2 y^2)$ has at most $354$ monomials. By Corollary 2.2, $per B = norm(z p)^2$ and $T(B) = 64 sum_(j=1)^4 norm(p \/ ell_j)^2$, where $ell_j$ runs over $8z plus.minus x$, $8z plus.minus y$; each norm is a finite sum of squared integer coefficients times factorials, and exact rational arithmetic gives @eq:473. The permanent $per B$ has $988$ decimal digits.
]

= Computational confirmation

The values $Q(f_L)$ computed from @eq:Q are $0.4993, 0.7249, 0.9792, 1.2507, 1.5321, 1.8194$ for $L = 1, 2, 4, 8, 16, 32$; the increments $Q(f_(2L)) - Q(f_L)$ are $0.2543, 0.2715, 0.2815, 0.2873$, approaching $c_0 log 2 = 0.2948$. For $f = f_1$ the ratios $R(B_(f_1, M))$ are $0.2483, 0.3316, 0.3974, 0.4422, 0.4690, 0.4837$ for $M = 1, 2, 4, 8, 16, 32$, increasing to $Q(f_1) = 0.4993$. A randomized adversarial search for large $R$ over Hermitian positive semidefinite matrices of orders $3 <= n <= 8$, all ranks, real and complex, found no violation of @eq:q; the largest value found was $R = 0.793$, for a complex matrix of rank two and order $8$, and at order $4$ nothing above $0.543$. The values in Theorems 1.2 and 7.1 were computed twice, by Ryser's formula over the Gaussian integers on the full matrix and its principal minors, and by the sparse Fischer-norm expansions in Section 7; the two computations agree exactly. None of these computations enters the proofs.

#v(1em)
*Acknowledgments.* The exposition was prepared with the assistance of GPT-6 Astra.

#v(0.5em)
#bibliography("refs.yml", title: "References", style: "ieee")
