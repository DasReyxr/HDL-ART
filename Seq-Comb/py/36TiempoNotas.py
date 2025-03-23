import pyperclip

#inp = float(input("Ingresa tiempo en segundos: "))
fcristal = 27*10**(-9)

def timeCalc (inpu):
    return int(inpu/(fcristal))

#time = int(inp/fcristal)
tempo = 109
bps = 60/tempo
negra = bps /4
varS  = negra/(2^6)
varN  = varS*(2^3)#1/32
len1 = len(bin(timeCalc(varS+varN)))
len2 = len(bin(timeCalc(varN)))
pyperclip.copy(f"Total {bin(timeCalc(varS+varN))[2:len1]} \nNota {bin(timeCalc(varN))[2:len2]}")
#print(f"tiempo total: {time} numero de bits {len(bin(time))-2} \n\n {bin(time)}")




"""
Total 11010001111110111011101111 

Total 11010001111110111011101 
Nota 1101000111111011101110
Total 1101000111111011101110 
Nota 0


Total 10100111111111001001011 
Nota 1010011111111100100101

Total 1010011111111100100101 
Nota 101001111111110010010


Total 11010001111110111011101 
Nota 1101000111111011101110


Total 1001101110001011000011 
Nota 100110111000101100001

Total 1001101110001011000011 
Nota 100110111000101100001
"""


