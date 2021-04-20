---
layout: blog
istop: false
phys: true
title: "Geometry Topology and Physics 1-1 Analytical Mechanics"
background-image: "https://blackwells.co.uk/jacket/l/9780750306065.jpg"
date: 2021-04-15 16:33
category: 格物
tags:
- nakahara
- lagrarian
- hamitonian
---

# Analytical mechanics

## Newtonian mechanics

A conserved force is the gradient of a scalar function: $\mathbf{F}=-\nabla V(\mathbf{x})$.

Energy of a system only with conserved forces is conserved:

$$
\begin{equation}
E = \frac{m}{2}\left(\frac{\mathrm{d}\mathbf{x}}{\mathrm{d}t}\right)^2
    + V(\mathbf{x}),\ 
\frac{\mathrm{d}E}{\mathrm{d}t} = 0.
\tag{eq:NE}
\end{equation}
$$

Any one-dimensional force *F*(*x*) only explicitly dependent on *x* is conserved:

$$
\begin{equation}
V(x) = -\int^x F(\xi) \mathrm{d}\xi.
\tag{eq:NP}
\end{equation}
$$

## Lagrangian formalism

State of the system is described by **generalized coordinates** ${q_i} (i = 1,\cdots,N)$ in the **configuration space** *M* (a manifold). **Generalized velocity** is $\dot{q_i}$.

### Principle of the least action

#### Integral form

The **action** is a functional from the trajectory $q(t)$ to a real number, defined by the integral of the Lagrangian from the initial to the final state of the system:

$$
\begin{equation}
S[q(t), \dot{q}(t)] = \int_{t_i}^{t_f} L(q,\dot{q}) \mathrm{d}t.
\tag{eq:HA}
\end{equation}
$$

**Hamilton’s principle/principle of the least action**: The physically realized trajectory corresponds to an extremum of the action.

#### Variation form

Suppose *q*(*t*) is a path realizing an extremum of *S*. Consider a variation *δq*(*t*) of the trajectory such that $\delta q(t_i) = \delta q(t_f) = 0$. Under this variation,

$$
\begin{equation}
\begin{split}
\delta S &= \int_{t_i}^{t_f} L(q+\delta q, \dot{q}+\delta \dot{q}) - L(q, \dot{q}) \mathrm{d}t\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t+\int_{t_i}^{t_f}\frac{\partial L}{\partial \dot{q}}\delta \dot{q}\mathrm{d}t
            + \mathcal{O}(\delta q^2) + \mathcal{O}(\delta \dot{q}^2)\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t+\int_{t_i}^{t_f}\frac{\partial L}{\partial \dot{q}}\mathrm{d}\delta q
            + \mathcal{O}(\delta q^2)\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t-\int_{t_i}^{t_f}\delta q\mathrm{d}\frac{\partial L}{\partial \dot{q}}
            + \mathcal{O}(\delta q^2)\\
            &= \int_{t_i}^{t_f}\delta q\ \mathrm{d}t\ \left(\frac{\partial L}{\partial q}-\frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial \dot{q}}\right)
            + \mathcal{O}(\delta q^2)\\
            &\approx \int_{t_i}^{t_f}\delta q\ \mathrm{d}t\ \left(\frac{\partial L}{\partial q}-\frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial \dot{q}}\right).
\end{split}
\tag{eq:PLA}
\end{equation}
$$

### Euler-Lagrange equation

*q*(*t*) is an extremum, so $\delta S=0\ \forall\ \delta q$, which implies

$$
\begin{equation}
\frac{\partial L}{\partial q_k}-\frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial \dot{q}_k}=0\quad \text{for }k=1,\cdots,N,
\tag{eq:ELE}
\end{equation}
$$

which is the **Euler-Lagrange equation**.

Using **generalized momentum** $p=\dfrac{\partial L}{\partial \dot{q}}$,

$$
\begin{equation}
\frac{\partial L}{\partial q_k}=\frac{\mathrm{d}p_k}{\mathrm{d}t}.
\tag{eq:ELEk}
\end{equation}
$$

Let $L=\frac{1}{2}m\dot{q}^2-V(q)$, then (eq:ELEk) reduces to $p = m\dot{q},\ m\ddot{q}+\frac{\partial V}{\partial q}=0$.

### Functional derivative

Using a single degree of freedom *s* or *t*, the parameter of the configuration trajectory, a **functional derivative**, considering the variation from the stationary path *q*(*s*) to another path *q*(*t*), can be defined by

$$
\begin{equation}
\begin{split}
\frac{\delta S[q,\dot{q}]}{\delta q(s)}:
&=\lim_{\varepsilon\to 0}\frac{1}{\varepsilon}
    \left\{S[q(t),\dot{q}(t)]-S[q(s),\dot{q}(s)]\right\}\\
&=\lim_{\varepsilon\to 0}\frac{1}{\varepsilon}
    \left\{
        S[q(s)+\varepsilon\delta(t-s),
    	\dot{q}(s)+\varepsilon\frac{\mathrm{d}}
    		{\mathrm{d}t}\delta(t-s)]
        -S[q(s),\dot{q}(s)]
    \right\},
\end{split}
\tag{eq:FD}
\end{equation}
$$

where $\varepsilon\delta(t-s)$ is a parametric expression of $\delta q$. $\varepsilon$ can be thought of a distance in configuration space between the two trajectories *q*(*s*), *q*(*t*), where they have parameter values of *s* and *t*, and $\delta(t-s)$ the *unit vector* pointing from point *q*(*s*) to point *q*(*t*). Note that the *s* and *t* here represent not a single value of the parameter (time), but the whole process of them ranging from the initial to the final state.

Therefore, substituting $\delta q=\varepsilon\delta(t-s)$ into (eq:PLA) yields

$$
\begin{equation}
\begin{split}
\delta S
&= \int_{t_i}^{t_f}\mathrm{d}t\ \varepsilon\ 
    \left(
        \frac{\partial L}{\partial q}(s)
        -\frac{\mathrm{d}}{\mathrm{d}t}
        \frac{\partial L}{\partial \dot{q}}(s)
    \right)
    \delta(t-s)
    + \mathcal{O}(\varepsilon^2).
\end{split}
\tag{eq:PPLA}
\end{equation}
$$

In this flavor the Euler-Lagrangian Equation may be written as

$$
\begin{equation}
\frac{\partial L}{\partial q}(s) = \frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial\dot{q}}(s)
\tag{eq:PELE}
\end{equation}
$$

### Symmetry of Lagrangian

#### Cyclic coordinate and momentum conservation

If Lagrangian *L* is independent of $q_k$ (but not $\dot{q}_k$), then $q_k$ is called **cyclic**. The conjugating momentum is conserved, according to (eq:PELE).

#### Symmetry

Infinitesimal symmetry operation: $q_k(t)\to q_k(t)+\delta q_k(t)$ on the path $q_k(t)$ from $t_i$ till $t_f$.  Since *L* is independent of $q_k$, this Lagrangian should remain constant under the operation, at any point of the path.

For a particle in a spherically symmetric potential, the longitude angle $\phi$ is a cyclic coordinate. The corresponding conservative momentum is the angular momentum around the *z* axis.

Remarks:

- $L$ is equivalent to $L+\frac{\mathrm{d}Q}{\mathrm{d}t}\ \forall\ Q=Q(q)$.
- Newtonian mechanics is realized as an extremum of the action, but the action itself is defined on any path in the configuration space.


## Hamiltonian formalism

Hamiltonian is the Legendre transformation of the Lagrangian with respect to $\dot{q}$, into the phase space $(q_k,p_k)$.

$$
\tag{eq:Hd}
H(q,p):=\sum_k p_k\dot{q}_k - L(q,\dot{q}),
$$

This transformation requires the Jacobian determinant to be non-zero.

$$
\color{red}\det{\mathcal{J}} = \det{\frac{\partial p_i}{\partial \dot{q}_j}}
= \det{\frac{\partial^2 L}{\partial \dot{q}_j\partial\dot{q}_i}}
\neq 0.
\tag{eq:detJ}
$$

> For Lagrangians without cross terms between the velocities like $L = \frac{1}{2}\sum_i{m_i\dot{q}_i^2}-V$, (eq:detJ) is simply $m_i\neq 0$.
>
> An intuitive example is:
>
> $L=\sum_k\frac{1}{2}m\dot{q}_k^2-V(q) = T-V$
>
> $L+H = \sum_k p_k\dot{q_k}=\sum_k m\dot{q}_k^2 = 2T$
>
> $H = \sum_k\frac{1}{2}m\dot{q}_k^2+V(q) = T+V$

Under an infinitesimal variation of $q_k$ and $p_k$,

$$
\begin{equation}
\begin{split}
\delta H &= \sum_k\left[
        \delta p_k\dot{q}_k + p_k\delta\dot{q}_k
        - \frac{\partial L}{\partial q_k}\delta q_k
        - \frac{\partial L}{\partial \dot{q}_k}\delta \dot{q}_k
     \right]\\
     &= \sum_k\left[
       \delta p_k\dot{q}_k
        - \frac{\partial L}{\partial q_k}\delta q_k
     \right],
 \end{split}
\tag{eq:delH}
 \end{equation}
$$

corresponding terms

$$
\frac{\partial H}{\partial p_k} = \dot{q}_k,\quad
\frac{\partial H}{\partial q_k} = -\frac{\partial L}{\partial q_k}.
\tag{eq:HE1}
$$

Substituting the Euler-Lagrange equation, we get

$$
\frac{\partial H}{\partial p_k} = \dot{q}_k,\quad
\frac{\partial H}{\partial q_k} = -\dot{p}_k,
\tag{eq:HE2}
$$

Substituting $L = \frac{1}{2}m\dot{\mathbf{q}}^2-V{\dot{\mathbf{q}}}$, then (eq:HE2) correspond to *definition of momentum* and *Newton's equation* respectively.

### Poisson bracket

$$
[A,B] := \sum_k\left(
    \frac{\partial A}{\partial q_k}\frac{\partial B}{\partial p_k}
    -\frac{\partial A}{\partial p_k}\frac{\partial B}{\partial q_k}.
\right)
\tag{eq:PB}
$$

The Poisson bracket is a **Lie bracket**, namely it is linear, antisymmetric, and Jacobi identical.

**Jacobi identity**: (see for Landau's book)

$$
[[A,B],C] + [[C,A],B] + [[B,C],A] = 0.
\tag{eq:JI}
$$

 Fundamental Poisson brackets

$$
 [p_i,p_j]=[q_i,q_j]=0,\quad
 [q_i,p_j]=\delta_{ij}.
 \tag{eq:FPB}
$$

Using Poisson brackets, the time development of $A(q,p)$ can be written as

$$
\frac{\mathrm{d}A}{\mathrm{d}t}=[A,H].
\tag{eq:AP}
$$

From (eq:AP) :

1. $[A,H]=0$ implies that A is conserved.
2. Hamilton's equations can be written as

$$
\frac{\partial H}{\partial p_k} = [q_k,H],\quad
\frac{\partial H}{\partial q_k} = -[p_k,H].
\tag{eq:HEP}
$$

### Noether's theorem

Suppose the Hamiltonian of a system is invariant under an infinitesimal *coordinate transformation* $q_k\to q'_k=q_k+\varepsilon f_k(q)$,
then

$$
Q=\sum_k p_kf_k(q)
\tag{eq:NT}
$$

is conserved.

#### Proof

The coordinate transform yields

$$
\begin{equation}
\begin{split}
\frac{\partial q_i'}{\partial q_j}
    &= \frac{\partial}{\partial q_j}\left[q_i+\varepsilon f_i(q)\right]
    = \delta_{ij} + \varepsilon\frac{\partial f_i(q)}{\partial q_j}
        + \mathcal{O}(\varepsilon ^2),\\
\frac{\partial q_i}{\partial q_j'}
    &= \frac{\partial}{\partial q_j'}\left[q_i'-\varepsilon f_i(q)\right]
    = \delta_{ij} - \varepsilon\frac{\partial f_i(q)}{\partial q_j'}
    + \mathcal{O}(\varepsilon ^2),
\end{split}
\tag{eq:Lij}
\end{equation}
$$

where

$$
\begin{equation}
\begin{split}
\frac{\partial f_i(q)}{\partial q_j'}
    &=\sum_k
        \frac{\partial q_k}{\partial q_j'}
        \frac{\partial f_i(q)}{\partial q_k}\\
    &=\sum_k\left[
            \delta_{kj} - \varepsilon\frac{\partial f_k(q)}{\partial q_j'}
            + \mathcal{O}(\varepsilon ^2)
        \right]
            \frac{\partial f_i(q)}{\partial q_k}\\
    &=\frac{\partial f_i(q)}{\partial q_j}
        + \mathcal{O}(\varepsilon),
\end{split}
\tag{eq:Lji0}
\end{equation}
$$

so

$$
\frac{\partial q_i}{\partial q_j'}
    = \frac{\partial}{\partial q_j'}\left[q_i'-\varepsilon f_i(q)\right]
    = \delta_{ij} - \varepsilon\frac{\partial f_i(q)}{\partial q_j}
    + \mathcal{O}(\varepsilon ^2).
\tag{eq:Lji1}
$$

Using (eq:Lji1), since $H$ is invariant, the momentum transforms as

$$
\begin{equation}
\begin{split}
p_k\to p_k' &= -\frac{\partial H}{\partial q_k'}
    = -\sum_l
            \frac{\partial q_l}{\partial q'_k}
            \frac{\partial H}{\partial q_l}\\
    &= -\sum_l
            \left[
                \delta_{kl} - \varepsilon\frac{\partial f_l(q)}{\partial q_k}
                + \mathcal{O}(\varepsilon ^2)
            \right]
        \frac{\partial H}{\partial q_l}\\
    &= -\frac{\partial H}{\partial q_k}
        + \varepsilon\frac{\partial f_l(q)}{\partial q_k}
                    \frac{\partial H}{\partial q_l}
        + \mathcal{O}(\varepsilon ^2)\\
    &= p_k
        - \varepsilon\frac{\partial f_l(q)}{\partial q_k}
                    q_l
        + \mathcal{O}(\varepsilon ^2).
\end{split}
\tag{eq:MT}
\end{equation}
$$

The Hamiltonian is invariant implies that:

$$
\begin{equation}
\begin{split}
0   &=H(q_k',p_k')-H(q_k,p_k)\\
    &=\sum_k\left[
            \frac{\partial H}{\partial q_k} \varepsilon f_k(q)
            - \frac{\partial H}{\partial p_k}
                \varepsilon \sum_j p_j\frac{\partial f_j(q)}{\partial q_k}
        \right]\\
    &=\varepsilon \sum_k\left[
            \frac{\partial H}{\partial q_k} \frac{\partial Q}{\partial p_k} 
            - \frac{\partial H}{\partial p_k} \frac{\partial Q}{\partial q_k} 
        \right]\\
    &= [H, Q] = \frac{\mathrm{d}Q}{\mathrm{d}t}.
\end{split}
\tag{eq:HQ}
\end{equation}
$$

which shows that *Q* is conserved.$\qquad\square$

Noether's theorem shows that to find a conserved quantity is equivalent to finding a transformation which leaves the Hamiltonian invariant.

#### Generator of the transform

Since $q_i$ and $p_k$ between each other, $\frac{\partial q_i}{\partial p_k}=0$, the Poisson bracket

$$
[q_i, Q] = 
\sum_k\left[
    \frac{\partial q_i}{\partial q_k}
        \frac{\partial Q}{\partial p_k}
    - \frac{\partial q_i}{\partial p_k}
        \frac{\partial Q}{\partial q_k}
\right]
= \sum_k\delta_{ik} f_k = f_i(q),
\tag{eq:qiQ}
$$

which shows that $\delta q_i = \varepsilon f_i(q)=\varepsilon[q_i, Q]$. In this sense $Q$ is called the *generator* of the transformation $\delta q_i$.

| System           | 1D particle                | 2D particle                                          |
| ---------------- | -------------------------- | ---------------------------------------------------- |
| Lagrangian       | $L = \frac{m\dot{r}^2}{2}$ | $L=\frac{1}{2}m(\dot{r}^2+r^2\dot{\theta}^2)-V(r)$   |
| Hamiltonian      | $H = \frac{p^2}{2m}$       | $H=\frac{p_r^2}{2m}+\frac{p_{\theta}^2}{2mr^2}+V(r)$ |
| Symmetry         | Translation                | Rotation around  $z$                                 |
| Transform of q   | $r\to r + \varepsilon$     | $\theta\to \theta+\varepsilon$                       |
| Transform of p   | $p\to p$                   | $p_{\theta}\to p_{\theta}$                           |
| Generator Q      | $p$                        | $p_{\theta}=mr^2\dot{\theta}$                        |
| Conservation law | Momentum                   | Angular momentum around $z$                          |

# References

This article is based on:

1. Nakahara, Mikio. *Geometry, Topology, and Physics*. 2nd ed. Graduate Student Series in Physics. Bristol ; Philadelphia: Institute of Physics Publishing, 2003.