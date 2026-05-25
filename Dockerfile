FROM node:20-alpine
WORKDIR /app

# package.json 먼저 복사 (의존성 레이어 캐싱)
COPY package*.json ./
RUN npm ci --omit=dev || npm install --omit=dev

# 소스 복사
COPY . .

EXPOSE 3000
CMD ["node", "index.js"]
