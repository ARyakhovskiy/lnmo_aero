function Re = Reynolds(rho, c, v, T)



mu = viscosity(T);
Re = rho.*c.*v./mu;


