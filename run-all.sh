#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

# Se backend não estiver rodando, inicia
if ! ss -tulpn | grep -q ':8080 '; then
    echo "Iniciando backend Spring Boot..."
    (cd "$DIR/backend" && mvn spring-boot:run -Dspring-boot.run.profiles=local > "$DIR/backend.log" 2>&1) &
    echo "Aguardando backend inicializar..."
    for i in {1..30}; do
        if curl -s http://localhost:8080/health | grep -q "UP"; then
            echo "Backend iniciado com sucesso na porta 8080!"
            break
        fi
        sleep 1
    done
else
    echo "Backend já está ativo na porta 8080."
fi

# Se frontend não estiver rodando, inicia
if ! ss -tulpn | grep -q ':5173 '; then
    echo "Iniciando frontend Vite..."
    (cd "$DIR/frontend" && npm run dev > "$DIR/frontend.log" 2>&1) &
    sleep 2
else
    echo "Frontend já está ativo na porta 5173."
fi

# Abre no navegador
echo "Abrindo no navegador..."
xdg-open http://localhost:5173 >/dev/null 2>&1 &

echo "Aplicação pronta em http://localhost:5173"
