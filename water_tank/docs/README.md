# Water tank

## System equations

```math
A \dot{z}(t) + c a \sqrt{2 g z(t)} = q(t)
```

## State space equation (plant_ode.m)

```math
\frac{d}{dt} \left[ \begin{array}{c}
z(t)
\end{array} \right]
=
\left[ \begin{array}{c}
-\frac{c a \sqrt{2 g}}{A} \sqrt{z(t)} + \frac{1}{A} q(t)
\end{array} \right]
=:
f(x(t), u(t))
```

## Linear state space equation (plant_sysc.m)

### Equilibrium point

The equilibrium point satisfies $`f(x_e, u_e) = 0`$ thus,

```math
c a \sqrt{2 g z_e} = q_e
```

### Linear state space equation

```math
\frac{d}{dt} \left[ \begin{array}{c}
z(t)
\end{array} \right]
=
\left[ \begin{array}{c}
-\frac{c a}{2 A} \sqrt{\frac{2 g}{z_e}}
\end{array} \right]

\left[ \begin{array}{c}
z(t)
\end{array} \right]
+
\left[ \begin{array}{c}
\frac{1}{A}
\end{array} \right]

\left[ \begin{array}{c}
q(t)
\end{array} \right]
```

## Simulation

### Parameters (plant_param.m)

| Description | Value |
|-|-|
| gravity acceleration $`g \mathrm{[m/s^2]}`$ | $`9.81`$ |
| area of tank $`A \mathrm{[m^2]}`$ | $`1.0`$ |
| area of outflow $`a \mathrm{[m^2]}`$ | $`0.1`$ |
| flow coefficient of outflow $`c \mathrm{[-]}`$ | $`1.0`$ |

### Impulse response

![impulse response](impulse.png)

where $`x_e = [0, 0]^T`$, $`u_e = [0]`$.

### Bode plot

![bode plot](bode.png)

where $`x_e = [0, 0]^T`$, $`u_e = [0]`$.
