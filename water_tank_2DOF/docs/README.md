# Water tank (2DOF)

## System equations

```math
\begin{cases}
A_1 \dot{z}_1(t) + c_1 a_1 \sqrt{2 g z_1(t)} = q(t) \\
A_2 \dot{z}_2(t) + c_2 a_2 \sqrt{2 g z_2(t)} = c_1 a_1 \sqrt{2 g z_1(t)}
\end{cases}
```

| Description | Symbol and unit |
|-|-|
| height of water surface | $`z_1, z_2 \mathrm{[m]}`$ |
| volume flow rate of inflow | $`q \mathrm{[m^3/s]}`$ |
| gravity acceleration | $`g \mathrm{[m/s^2]}`$ |
| area of tank | $`A_1, A_2 \mathrm{[m^2]}`$ |
| area of outflow | $`a_1, a_2 \mathrm{[m^2]}`$ |
| flow coefficient of outflow | $`c_1, c_2 \mathrm{[-]}`$ |

## State space equation (plant_ode.m)

```math
\frac{d}{dt} \left[ \begin{array}{c}
z_1(t) \\ z_2(t)
\end{array} \right]
=
\left[ \begin{array}{c}
-\frac{c_1 a_1 \sqrt{2 g}}{A_1} \sqrt{z_1(t)} + \frac{1}{A_1} q(t) \\
\frac{c_1 a_1 \sqrt{2 g}}{A_2} \sqrt{z_1(t)} - \frac{c_2 a_2 \sqrt{2 g}}{A_2} \sqrt{z_2(t)}
\end{array} \right]
=:
f(x(t), u(t))
```

## Linear state space equation (plant_sysc.m)

### Equilibrium point

The equilibrium point satisfies $`f(x_e, u_e) = 0`$ thus,

```math
\begin{cases}
c_1 a_1 \sqrt{2 g z_{1e}} = q_e \\
c_1 a_1 \sqrt{z_{1e}} = c_2 a_2 \sqrt{z_{2e}}
\end{cases}
```

### Linear state space equation

```math
\frac{d}{dt} \left[ \begin{array}{c}
z_1(t) \\ z_2(t)
\end{array} \right]
=
\left[ \begin{array}{cc}
-\frac{c_1 a_1}{2 A_1} \sqrt{\frac{2 g}{z_{1e}}} & 0 \\
\frac{c_1 a_1}{2 A_1} \sqrt{\frac{2 g}{z_{1e}}} & -\frac{c_2 a_2}{2 A_2} \sqrt{\frac{2 g}{z_{2e}}}
\end{array} \right]

\left[ \begin{array}{c}
z_1(t) \\ z_2(t)
\end{array} \right]
+
\left[ \begin{array}{c}
\frac{1}{A_1} \\ 0
\end{array} \right]

\left[ \begin{array}{c}
q(t)
\end{array} \right]
```

## Simulation

### Parameters (plant_param.m)

| Parameter | Value |
|-|-|
| $`g \mathrm{[m/s^2]}`$ | $`9.81`$ |
| $`A_1 \mathrm{[m^2]}`$ | $`1.0`$ |
| $`a_1 \mathrm{[m^2]}`$ | $`0.1`$ |
| $`c_1 \mathrm{[-]}`$ | $`1.0`$ |
| $`A_2 \mathrm{[m^2]}`$ | $`1.0`$ |
| $`a_2 \mathrm{[m^2]}`$ | $`0.1`$ |
| $`c_2 \mathrm{[-]}`$ | $`1.0`$ |

### Impulse response

![impulse response](impulse.png)

where $`x_e = [1, 1]^T`$, $`u_e = [0.4429]^T`$.

### Bode plot

![bode plot](bode.png)

where $`x_e = [1, 1]^T`$, $`u_e = [0.4429]^T`$.
