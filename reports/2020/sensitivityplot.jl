function makeline(m,x,b)
    return m.*x .+ b
end

x = range(0,stop=0.5,length=100)
b = 0

speed = makeline(1.19,x,b)
numcontainers =  makeline(0.7,x,b)
weight = makeline(0.79,x,b)
loadlength = makeline(0.79,x,b)
loadunload = makeline(1.0,x,b)
m1 = makeline(0.0,x,b)

x.*100

figure(figsize=(2.4,2))
clf()
plot(x,speed,label="Speed","C0")
plot(x,loadunload,label="Load/Unload Time","C1")
plot(x,weight,label="Sensor Weight","C3",linewidth=1.5)
plot(x,loadlength,label="Sensor Lenght","--C1")
plot(x,numcontainers,label="Num Containers","C2")
plot(x,m1,label="M1 Success","--C2")
legend()
xlabel("Score Increase (percent)")
ylabel("Parameter Increase")