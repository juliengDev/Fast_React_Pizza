# Utilise une image Node.js officielle
FROM node:slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie les fichiers package.json et package-lock.json
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie tout le code source
COPY . .

# Build l'application pour la production
RUN npm run build

# Installe un serveur web simple pour servir les fichiers statiques
RUN npm install -g serve

# Expose le port 3000
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["serve", "-s", "dist", "-l", "3000"]