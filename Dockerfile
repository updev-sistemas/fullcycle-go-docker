# Use a imagem oficial mínima do Golang
FROM golang:alpine AS builder

# Define o diretório de trabalho dentro do contêiner
WORKDIR /go/src/app

# Copie o código fonte para o diretório de trabalho
COPY . .

# Compila o código Go e cria o executável
RUN go build -o fullcycle .

# Segunda fase - construindo a imagem mínima
FROM scratch

# Copia o executável compilado da fase anterior
COPY --from=builder /go/src/app/fullcycle /fullcycle

# Comando padrão a ser executado quando o contêiner é iniciado
CMD ["/fullcycle"]
