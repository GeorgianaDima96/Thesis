function [eps_real,eps_imag,skin_depth,sigma] = dispersion_EM_properties_solid(f,eps_inf,eps_1,tau_1,alpha_1,eps_2,tau_2,alpha_2,eps_3,tau_3,alpha_3,eps_4,tau_4,alpha_4,cond,Material)


delta_eps = [eps_1 eps_2 eps_3 eps_4];
tau = [tau_1 tau_2 tau_3 tau_4];
alpha = [alpha_1 alpha_2 alpha_3 alpha_4];
 
epsilon_0 = 8.85418782e-12;
mu_0 = 1.25663706e-6;
f_range = f; 

for counter = 1:numel(f_range)
    eps_material(counter) = eps_inf+cond/(i*f_range(counter)*2*pi*epsilon_0); 
    for count = 1:4
    eps_material(counter) = eps_material(counter) + delta_eps(count)/(1+(i*f_range(counter)*2*pi*tau(count))^(1-alpha(count)));
    end
end

eps_real = real(eps_material); 
eps_imag = imag(eps_material);
sigma = -imag(eps_material)*2*pi.*f_range*epsilon_0;
skin_depth = sqrt(2./(2*pi*f_range*mu_0)).*sqrt(sqrt(1+((2*pi*f_range*epsilon_0.*eps)./sigma).^2)+(2*pi*f_range*epsilon_0.*eps_real)./sigma);


end