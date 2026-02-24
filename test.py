import math

#!/usr/bin/env python3
# test.py - Operaciones matemáticas básicas e impresión de resultados


def main():
    a = 15
    b = 4

    suma = a + b
    resta = a - b
    producto = a * b
    division = a / b
    division_entera = a // b
    modulo = a % b
    potencia = a ** b
    raiz_cuadrada_a = math.sqrt(a)
    promedio = (a + b) / 2

    print(f"Valores: a = {a}, b = {b}")
    print(f"Suma: {a} + {b} = {suma}")
    print(f"Resta: {a} - {b} = {resta}")
    print(f"Producto: {a} * {b} = {producto}")
    print(f"División (float): {a} / {b} = {division}")
    print(f"División entera: {a} // {b} = {division_entera}")
    print(f"Módulo: {a} % {b} = {modulo}")
    print(f"Potencia: {a} ** {b} = {potencia}")
    print(f"Raíz cuadrada de {a}: {raiz_cuadrada_a}")
    print(f"Promedio: ({a} + {b}) / 2 = {promedio}")

if __name__ == "__main__":
    main()