# Vibe Coding Toolkit - Dockerfile
# Para publicar no Docker Hub como: jeanrauwers/vibe-coding-toolkit
#
# Build: docker build -t jeanrauwers/vibe-coding-toolkit:latest .
# Push:   docker push jeanrauwers/vibe-coding-toolkit:latest

FROM node:20-alpine AS builder

# Instala dependências
RUN apk add --no-cache git

WORKDIR /app

# Copia package files
COPY package*.json ./

# Instala dependências
RUN npm ci

# Copia código fonte
COPY . .

# Build
RUN npm run build 2>&1 || echo "Build failed, continuing..."

# Stage de produção - imagem mínima
FROM node:20-alpine

# Instala ferramentas
RUN apk add --no-cache git ca-certificates

# Cria usuário não-root para segurança
RUN addgroup -g 1000 -S nodejs && \
    adduser -S nodejs -u 1000 -G nodejs

WORKDIR /app

# Copia dependências do builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/src ./src
COPY --from=builder /app/plugins ./plugins
COPY --from=builder /app/docs ./docs

# Muda para usuário não-root
USER nodejs

# Expose porta
EXPOSE 3000

# Comando de entrada
CMD ["node", "src/index.js"]
