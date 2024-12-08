# PowerShell Script: Initialize React Front-End with TypeScript and Styled Layout

# Define project directory
$projectDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront"

# Create React project with TypeScript template
Write-Host "Creating React project with TypeScript..." -ForegroundColor Green
npx create-react-app $projectDir --template typescript

# Navigate to the project directory
Set-Location -Path $projectDir

# Install additional dependencies
Write-Host "Installing dependencies: React Router, styled-components..." -ForegroundColor Green
npm install react-router-dom styled-components
npm install @types/react-router-dom @types/styled-components --save-dev

# Create project structure
Write-Host "Creating project folder structure..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "$projectDir\src\components"
New-Item -ItemType Directory -Force -Path "$projectDir\src\pages"
New-Item -ItemType Directory -Force -Path "$projectDir\src\navigation"
New-Item -ItemType Directory -Force -Path "$projectDir\src\styles"

# Create App.tsx
Write-Host "Creating App.tsx..." -ForegroundColor Green
Set-Content -Path "$projectDir\App.tsx" -Value @"
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';
import AboutPage from './pages/AboutPage';
import NotFoundPage from './pages/NotFoundPage';
import Layout from './navigation/Layout';

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/about" element={<AboutPage />} />
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </Layout>
    </Router>
  );
}

export default App;
"@

# Create Layout.tsx
Write-Host "Creating Layout.tsx for navigation and layout..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\navigation\Layout.tsx" -Value @"
import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const Container = styled.div\`
  display: flex;
  flex-direction: column;
  height: 100vh;
\`;

const Header = styled.header\`
  background-color: #4CAF50;
  padding: 1rem;
  color: white;
  text-align: center;
  font-size: 1.5rem;
\`;

const Nav = styled.nav\`
  display: flex;
  justify-content: center;
  gap: 1rem;
  background-color: #333;
  padding: 0.5rem 0;

  a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    &:hover {
      text-decoration: underline;
    }
  }
\`;

const Main = styled.main\`
  flex-grow: 1;
  padding: 1rem;
  background-color: #f9f9f9;
\`;

const Layout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  return (
    <Container>
      <Header>Xerion Front-End</Header>
      <Nav>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
      </Nav>
      <Main>{children}</Main>
    </Container>
  );
};

export default Layout;
"@

# Create HomePage.tsx
Write-Host "Creating HomePage component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\pages\HomePage.tsx" -Value @"
import React from 'react';
import styled from 'styled-components';

const Title = styled.h1\`
  color: #4CAF50;
  text-align: center;
\`;

const HomePage = () => {
  return (
    <div>
      <Title>Welcome to Xerion</Title>
      <p style={{ textAlign: 'center' }}>Explore the best features of our application.</p>
    </div>
  );
};

export default HomePage;
"@

# Create AboutPage.tsx
Write-Host "Creating AboutPage component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\pages\AboutPage.tsx" -Value @"
import React from 'react';

const AboutPage = () => {
  return (
    <div>
      <h1>About Xerion</h1>
      <p>This is the about page of the Xerion project. Stay tuned for updates!</p>
    </div>
  );
};

export default AboutPage;
"@

# Create NotFoundPage.tsx
Write-Host "Creating NotFoundPage component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\pages\NotFoundPage.tsx" -Value @"
import React from 'react';

const NotFoundPage = () => {
  return (
    <div>
      <h1>404 - Page Not Found</h1>
      <p>Sorry, the page you are looking for does not exist.</p>
    </div>
  );
};

export default NotFoundPage;
"@

# Create global styles
Write-Host "Creating global styles file..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\styles\GlobalStyles.ts" -Value @"
import { createGlobalStyle } from 'styled-components';

const GlobalStyles = createGlobalStyle\`
  body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
  }

  a {
    text-decoration: none;
    color: inherit;
  }
\`;

export default GlobalStyles;
"@

# Output success message
Write-Host "React application with styled layout and navigation initialized successfully at $projectDir" -ForegroundColor Green
Write-Host "Navigate to the project directory and start the app with 'npm start'." -ForegroundColor Cyan
