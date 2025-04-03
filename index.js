// Import du module HTTP intégré à Node
import http from 'http';

// Création du serveur
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Node.js!\n');
});

// Écoute sur le port 3000
server.listen(3000, () => {
  console.log('Serveur en écoute sur http://localhost:3000/');
});