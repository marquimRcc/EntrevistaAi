import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { App } from './App';
import { AuthProvider } from './hooks/useAuth';
import { ErrorBoundary } from './components/ErrorBoundary';
import './index.css';

// Em ambiente de desenvolvimento local, inicializa com usuário dev mockado se não houver sessão salva
if (!localStorage.getItem('token')) {
  localStorage.setItem('token', 'dev-mock-token');
  localStorage.setItem('nome', 'Dev Local');
}

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ErrorBoundary>
      <BrowserRouter>
        <AuthProvider>
          <App />
        </AuthProvider>
      </BrowserRouter>
    </ErrorBoundary>
  </StrictMode>,
);
