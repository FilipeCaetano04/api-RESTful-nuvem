# Usa a imagem oficial Eclipse Temurin com Java 21 em Alpine
FROM eclipse-temurin:21-jdk-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia o projeto
COPY . .

# Dá permissão ao Gradle Wrapper
RUN chmod +x ./gradlew

# Gera o .jar correto do Spring Boot
RUN ./gradlew bootJar -x test

# Executa o jar gerado
CMD ["sh", "-c", "java -jar build/libs/*.jar"]

