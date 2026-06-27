const express = require('express');
const app = express();
const PORT = process.env.PORT || 80;

app.get('/', (req, res) => {
  res.send(`
    <style>
      body { background: #0f172a; color: #38bdf8; font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
      .card { text-align: center; border: 1px solid #0284c7; padding: 2.5rem; border-radius: 12px; background: #1e293b; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.3); }
      h1 { color: #f1f5f9; margin-bottom: 0.5rem; }
      span { color: #4ade80; font-weight: bold; }
    </style>
    <div class="card">
      <h1>Project Zero-Drift v1.0.0</h1>
      <p>Status: <span>FULLY OPERATIONAL</span></p>
      <p>Deployment Mode: Pull-Based GitOps via ArgoCD</p>
    </div>
  `);
});

app.listen(PORT, () => {
  console.log(`Application actively listening on port ${PORT}`);
});