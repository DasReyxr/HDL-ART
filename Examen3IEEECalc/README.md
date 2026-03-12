# Examen 3 IEEE Calculator

## Descripcion

Este proyecto reune varios bloques en VHDL para trabajar con numeros en formato IEEE 754 de precision simple (32 bits). El conjunto cubre tres tareas principales:

- conversion de una representacion separada en signo, parte entera y parte fraccionaria decimal hacia IEEE 754
- conversion inversa desde IEEE 754 hacia signo, parte entera y fraccion fraccionaria escalada
- suma de dos operandos IEEE 754 ya codificados

La carpeta tambien incluye testbenches para validar cada parte del flujo.

## Estructura del proyecto

| Archivo | Entidad | Funcion |
| --- | --- | --- |
| `clz.vhd` | `clz` | Cuenta ceros a la izquierda en un vector de 32 bits. |
| `b2f.vhd` | `b2f` | Convierte una fraccion decimal escalada en base 10000 a una fraccion binaria de 40 bits. |
| `IEEE.vhd` | `FloatingPoint` | Genera el numero IEEE 754 a partir de signo, entero y fraccion. |
| `IEEE Conv.vhd` | `IEEEConv` | Descompone un valor IEEE 754 en signo, entero y fraccion escalada. |
| `suma.vhd` | `Sumador` | Realiza suma/resta entre dos operandos IEEE 754 y renormaliza el resultado. |
| `b2f_tb.vhd` | `b2f_tb` | Testbench del convertidor fraccion decimal a binario. |
| `IEEE Conv_tb.vhd` | `IEEEConv_tb` | Testbench del convertidor inverso desde IEEE 754. |
| `tb.vhd` | `FloatingPoint_tb` | Testbench general del generador IEEE 754. |
| `tb2.vhd` | `tb_FloatingPoint` | Segundo banco de pruebas con varios casos directos. |

## Flujo del diseno

### 1. Conversion de fraccion decimal a binario

El bloque `b2f` recibe una fraccion decimal escalada. El valor esperado es:

- `0` representa `.0000`
- `2500` representa `.2500`
- `5000` representa `.5000`
- `9999` representa `.9999`

Internamente, el modulo aplica multiplicaciones sucesivas por 2 y construye una salida binaria de 40 bits. La constante `Decimal = 10000` deja claro que la escala usada es de cuatro decimales.

### 2. Normalizacion

El bloque `clz` se usa para detectar la posicion del primer `1` significativo y asi calcular el exponente y acomodar la mantisa.

### 3. Generacion del numero IEEE 754

La entidad `FloatingPoint` combina:

- `Sign`
- `Intg` de 32 bits
- `Fract` de 14 bits escalada en base 10000

Con esa informacion calcula:

- bit de signo
- exponente sesgado a 8 bits
- mantisa de 23 bits
- palabra final IEEE de 32 bits

### 4. Conversion inversa

La entidad `IEEEConv` toma una palabra IEEE 754 y extrae:

- signo
- parte entera
- fraccion en una salida escalada para representar 4 decimales

### 5. Suma en IEEE 754

La entidad `Sumador`:

- separa signo, exponente y mantisa de dos operandos
- alinea exponentes
- suma o resta mantisas segun el signo
- normaliza el resultado
- reconstruye el valor IEEE final

## Entradas y salidas relevantes

### `FloatingPoint`

- `Intg`: parte entera en 32 bits
- `Fract`: parte fraccionaria escalada en 14 bits
- `Sign`: signo del numero
- `IEEE`: salida final en formato IEEE 754 de 32 bits

Ejemplo conceptual:

- numero `25.1250`
- `Sign = '0'`
- `Intg = 25`
- `Fract = 1250`

### `IEEEConv`

- entrada `IEEE`: palabra IEEE 754 de 32 bits
- salida `signa` o `Sign`: signo extraido
- salida `Intg`: parte entera reconstruida
- salida `Frac`: fraccion escalada a 4 decimales

### `Sumador`

- `Val1`, `Val2`: operandos IEEE 754 de 32 bits
- `R7Sum`: resultado IEEE 754 de 32 bits

## Compilacion y simulacion

Si usas GHDL, una secuencia razonable de compilacion es la siguiente:

```sh
ghdl -a clz.vhd
ghdl -a b2f.vhd
ghdl -a IEEE.vhd
ghdl -a "IEEE Conv.vhd"
ghdl -a suma.vhd
ghdl -a b2f_tb.vhd
ghdl -a "IEEE Conv_tb.vhd"
ghdl -a tb.vhd
ghdl -a tb2.vhd
```

Para correr un banco de pruebas:

```sh
ghdl -e b2f_tb
ghdl -r b2f_tb --vcd=b2f_tb.vcd

ghdl -e IEEEConv_tb
ghdl -r IEEEConv_tb --vcd=ieeeconv_tb.vcd

ghdl -e FloatingPoint_tb
ghdl -r FloatingPoint_tb --vcd=floatingpoint_tb.vcd

ghdl -e tb_FloatingPoint
ghdl -r tb_FloatingPoint --vcd=tb2.vcd.vcd
```

En ModelSim o Questa, la recomendacion es compilar en el mismo orden y luego correr cada testbench por separado.

## Observaciones

Al revisar los archivos, hay senales de que algunos testbenches corresponden a una version anterior de las interfaces:

- `IEEE.vhd` define `FloatingPoint` con puertos `Intg` de 32 bits y `Fract` de 14 bits.
- `tb.vhd` y `tb2.vhd` instancian `FloatingPoint` usando `Val` y `Fract` de 32 bits.
- `IEEE Conv.vhd` declara una entrada adicional `R7`, pero `IEEE Conv_tb.vhd` no la maneja.
- `IEEE Conv_tb.vhd` usa `Intg` de 24 bits, mientras que `IEEEConv` declara `Intg` de 32 bits.

Antes de correr todas las simulaciones juntas, conviene alinear nombres y anchos de puertos entre entidades y bancos de prueba.

## Alcance actual

El proyecto se enfoca en el flujo base de conversion y suma. No se observa manejo completo de casos especiales de IEEE 754 como:

- NaN
- infinito
- subnormales completos
- redondeo fino con todos los casos de guard, round y sticky

Para un examen o practica, el codigo documenta bien la idea principal: separar, normalizar, convertir y recomponer numeros de punto flotante en hardware.