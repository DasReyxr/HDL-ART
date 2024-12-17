import math
arry = [261.63 ,277.18 ,293.66 ,311.13 ,329.63 ,349.23 ,369.99 ,392.00 ,415.30 ,440.00 ,466.16 ,493.88]
time = [0.7,0.1,0.7,0.1,2.1,0.1]
tempo = 89
epa[]
notes = ["Do", "Dom" , "Re" , "Rem" , "Mi" , "Fa" , "Fam" , "Sol" , "Solm" , "La" , "Lam" , "Si" ]
fcristal = 10*10**(-9)

for i in range(0,len(time)):
    epa[i] = time[i] / fcristal
    print(f"signal {notes[i]} :STD_LOGIC_VECTOR(17 downto 0) := {(bin(epa))}; -- {epa}\n")
    
    #print(f"{math.ceil(lenguaje/2)}, {lenguaje-math.ceil(lenguaje/2)}")


    
