
using DifferentialEquations
using Plots

function SIRI(du, u, p, t)
    du[1] = - (0.0044 / 32081000.0) * u[1] * u[2]  
    du[2] = (0.0044 / 32081000.0) * u[1] * u[2] - (u[2] / 15.6) + u[3] * 0.5
    du[3] = (u[2] / 15.6) - u[3] * 0.5
end 

u₀ = [32006000.0; 50000.0; 25000.0] #num of non-users, num of users, num of sober
tspan = (0.0, 15.0) 
prob = ODEProblem(SIRI, u₀, tspan)
sol = solve(prob)

plot(sol, title="SIRI Model", xlabel="Time (years)", ylabel="Population (num of individuals)", 
    label=["Non-Users", "Users", "Sober"], xlims=(0, 15), ylims=(0, 100000), xticks = 0:1:15)
