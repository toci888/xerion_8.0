import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

// Importy formatów (upewnij się, że ścieżki są poprawne)
import Home from './pages/HomePage.tsx';
 import navigationmenu from './pages/navigation-menu.tsx';
// import Profile from './pages/Profile';
// import Settings from './pages/Settings';
import quizzes from './pages/quizzes.tsx';
import homePage from './pages/HomePage.tsx';

const App: React.FC = () => {
  // Lista formatów (możesz dodać kolejne w miarę rozwoju)
  const routes = [
    { path: '/', component: Home, name: 'Home' },
     { path: '/navigationmenu', component: navigationmenu, name: 'navigationmenu' },
    { path: '/homePage', component: homePage, name: 'homePage' },
    // { path: '/settings', component: Settings, name: 'Settings' },
    { path: '/quizzes', component: quizzes, name: 'quizzes' },
  ];

  return (
    <Router>
      <div style={{ display: 'flex' }}>
        {/* Sidebar nawigacji */}
        <nav style={{ padding: '1rem', width: '250px', background: '#f4f4f4' }}>
          <h2>Xerion Navigation</h2>
          <ul style={{ listStyleType: 'none', padding: 0 }}>
            {routes.map((route) => (
              <li key={route.path} style={{ margin: '0.5rem 0' }}>
                <Link to={route.path} style={{ textDecoration: 'none', color: '#007BFF' }}>
                  {route.name}
                </Link>
              </li>
            ))}
          </ul>
        </nav>

        {/* Główna sekcja aplikacji */}
        <main style={{ flex: 1, padding: '1rem' }}>
          <Routes>
            {routes.map((route) => (
              <Route key={route.path} path={route.path} element={<route.component />} />
            ))}
          </Routes>
        </main>
      </div>
    </Router>
  );
};

export default App;
