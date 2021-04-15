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

Substituting $L=\frac{1}{2}m\dot{q}^2-V(q)$, this reduces to $p = m\dot{q},\ m\ddot{q}+\frac{\partial V}{\partial q}=0$.

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