# Usa a imagem oficial Eclipse Temurin com Java 21 em Alpine
FROM eclipse-temurin:21-jdk-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto para dentro do container
COPY . .

# Dá permissão de execução ao Gradle wrapper, se existir
RUN chmod +x ./gradlew

# Compila o projeto e gera o .jar (sem rodar os testes para acelerar)
RUN ./gradlew build -x test

# Entra na pasta build/libs e executa o .jar gerado
CMD ["sh", "-c", "java -jar build/libs/*.jar"]
