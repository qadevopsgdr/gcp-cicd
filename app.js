const express = require('express');
const app = express();

// Root route
app.get('/', (req, res) => {
  res.send('Hello from Ganmi GitHub Actions CI/CD Pipeline');
});

// Health check route
app.get('/healthz', (req, res) => {
  res.status(200).send('OK');
});

module.exports = app;

// Start server if run directly
if (require.main === module) {
  app.listen(3000, () => console.log('App running on port 3000'));
}
