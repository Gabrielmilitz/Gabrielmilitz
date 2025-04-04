import random
import time
from datetime import timedelta

# Simulação de um algoritmo de backoff exponencial para controle de acesso ao meio
# de transmissão em redes de computadores. O algoritmo simula a transmissão de pacotes
# por várias estações, onde cada estação aguarda um tempo aleatório antes de tentar
# transmitir. Se duas estações tentam transmitir ao mesmo tempo, ocorre uma colisão,    
# e ambas as estações devem esperar um tempo adicional antes de tentar novamente.

tempo_base = 51.2   # Tempo base em microsegundos (leva em conta um cabo de 2,5 km com 4 repetidores)
tentativa = 0
max_tentativas = 10  

while tentativa <= max_tentativas:
    n = min(2 ** tentativa, 1024)  # Número de estações simuladas (máximo 1023)
    tempo_espera = tempo_base * random.randint(0, n - 1) 
    tempo = timedelta(microseconds=tempo_espera)

    estacao1 = random.randint(0, n - 1)
    estacao2 = random.randint(0, n - 1)

    print(f"\nTentativa {tentativa + 1} - Estações possíveis: {n}")
    print(f"Estação {estacao1} transmitindo...")
    print(f"Estação {estacao2} transmitindo...")

    if estacao1 == estacao2:
        print("Colisão detectada!")
        print(f"Esperando {tempo} para tentar novamente...")
        time.sleep(tempo.total_seconds()) 
        tentativa += 1
    else:
        print(" Transmissão bem-sucedida!")
        break
else:
    print("Falha na transmissão após 10 tentativas (limite de backoff atingido).")
