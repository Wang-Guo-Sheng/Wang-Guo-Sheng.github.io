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
E = \frac{m}{2}\left(\frac{\mathrm{d}\mathbf{x}}{\mathrm{d}t}\right)^2
    + V(\mathbf{x})\\
\frac{\mathrm{d}E}{\mathrm{d}t} = 0.
$$

Any one-dimensional force *F*(*x*) only explicitly dependent on *x* is conserved:
$$
V(x) = -\int^x F(\xi) \mathrm{d}\xi.
$$

## Lagrangian formalism

State of the system is described by **generalized coordinates** ${q_i} (i = 1,\cdots,N)$ in the **configuration space** *M* (a manifold). **Generalized velocity** is $\dot{q_i}$.

### Principle of the least action

#### Integral form

The **action** is a functional from the trajectory $q(t)$ to a real number, defined by the integral of the Lagrangian from the initial to the final state of the system:

$$
S[q(t), \dot{q}(t)] = \int_{t_i}^{t_f} L(q,\dot{q}) \mathrm{d}t.
$$

**Hamilton’s principle/principle of the least action**: The physically realized trajectory corresponds to an extremum of the action.

#### Variation form

Suppose *q*(*t*) is a path realizing an extremum of *S*. Consider a variation *δq*(*t*) of the trajectory such that *δq*(*t*~i~) = *δq*(*t*~f~) = 0. Under this variation,
$$
\begin{split}
\delta S &= \int_{t_i}^{t_f} L(q+\delta q, \dot{q}+\delta \dot{q}) - L(q, \dot{q}) \mathrm{d}t\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t+\int_{t_i}^{t_f}\frac{\partial L}{\partial \dot{q}}\delta \dot{q}\mathrm{d}t\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t+\int_{t_i}^{t_f}\frac{\partial L}{\partial \dot{q}}\mathrm{d}\delta q\\
            &= \int_{t_i}^{t_f}\frac{\partial L}{\partial q}\delta q\mathrm{d}t-\int_{t_i}^{t_f}\delta q\mathrm{d}\frac{\partial L}{\partial \dot{q}}\\
            &= \int_{t_i}^{t_f}\delta q\ \mathrm{d}t\ \left(\frac{\partial L}{\partial q}-\frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial \dot{q}}\right).
\end{split}
$$

#### Euler-Lagrange equation

*q*(*t*) is an extremum, so $\delta S=0\ \forall\ \delta q$, which implies
$$
\frac{\partial L}{\partial q_k}-\frac{\mathrm{d}}{\mathrm{d}t}\frac{\partial L}{\partial \dot{q}_k}=0\quad \text{for }k=1,\cdots,N,
$$
which is the **Euler-Lagrange equation**.

Using **generalized momentum** $p=\dfrac{\partial L}{\partial \dot{q}}$,
$$
\frac{\partial L}{\partial q_k}=\frac{\mathrm{d}p_k}{\mathrm{d}t}.
$$

Substituting $L=\frac{1}{2}m\dot{q}^2-V(q)$, this reduces to $p = m\dot{q},\ m\ddot{q}+\frac{\partial V}{\partial q}=0$.



## Hamiltonian formalism