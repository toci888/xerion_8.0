# PowerShell Script: Generate React Project with Custom Layout

# Define project directory
$projectDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront"

# Create React project with TypeScript template
Write-Host "Creating React project with TypeScript..." -ForegroundColor Green
npx create-react-app $projectDir --template typescript

# Navigate to the project directory
Set-Location -Path $projectDir

# Install additional dependencies
Write-Host "Installing dependencies: styled-components, React Router..." -ForegroundColor Green
npm install styled-components react-router-dom
npm install @types/styled-components @types/react-router-dom --save-dev

# Create project structure
Write-Host "Creating project folder structure..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "$projectDir\src\components"
New-Item -ItemType Directory -Force -Path "$projectDir\src\pages"
New-Item -ItemType Directory -Force -Path "$projectDir\src\styles"

# Create App.tsx
Write-Host "Creating App.tsx..." -ForegroundColor Green
Set-Content -Path "$projectDir\App.tsx" -Value @"
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HomePage />} />
      </Routes>
    </Router>
  );
}

export default App;
"@

# Create HomePage.tsx
Write-Host "Creating HomePage component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\pages\HomePage.tsx" -Value @"
import React from 'react';
import Header from '../components/Header';
import SearchSection from '../components/SearchSection';
import OfferList from '../components/OfferList';
import Footer from '../components/Footer';

const HomePage = () => {
  return (
    <div>
      <Header />
      <SearchSection />
      <OfferList />
      <Footer />
    </div>
  );
};

export default HomePage;
"@

# Create Header.tsx
Write-Host "Creating Header component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\components\Header.tsx" -Value @"
import React from 'react';
import styled from 'styled-components';

const HeaderContainer = styled.header\`
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #4CAF50;
  padding: 1rem 2rem;
  color: white;
\`;

const NavLinks = styled.nav\`
  display: flex;
  gap: 1rem;

  a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    &:hover {
      text-decoration: underline;
    }
  }
\`;

const Header = () => {
  return (
    <HeaderContainer>
      <h1>Xerion Jobs</h1>
      <NavLinks>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/contact">Contact</a>
      </NavLinks>
    </HeaderContainer>
  );
};

export default Header;
"@

# Create SearchSection.tsx
Write-Host "Creating SearchSection component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\components\SearchSection.tsx" -Value @"
import React from 'react';
import styled from 'styled-components';

const SearchContainer = styled.div\`
  display: flex;
  justify-content: center;
  padding: 2rem;
  background-color: #f0f0f0;
\`;

const Input = styled.input\`
  padding: 0.5rem;
  margin-right: 1rem;
  width: 300px;
  border: 1px solid #ccc;
  border-radius: 4px;
\`;

const Button = styled.button\`
  padding: 0.5rem 1rem;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  &:hover {
    background-color: #45a049;
  }
\`;

const SearchSection = () => {
  return (
    <SearchContainer>
      <Input type="text" placeholder="Search for jobs..." />
      <Button>Search</Button>
    </SearchContainer>
  );
};

export default SearchSection;
"@

# Create OfferList.tsx
Write-Host "Creating OfferList component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\components\OfferList.tsx" -Value @"
import React from 'react';
import styled from 'styled-components';

const OfferContainer = styled.div\`
  padding: 2rem;
\`;

const OfferCard = styled.div\`
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 1rem;
  margin-bottom: 1rem;
  background-color: white;

  h3 {
    margin: 0 0 0.5rem;
    color: #333;
  }

  p {
    margin: 0;
    color: #666;
  }
\`;

const OfferList = () => {
  const offers = [
    { id: 1, title: 'Frontend Developer', company: 'Company A' },
    { id: 2, title: 'Backend Developer', company: 'Company B' },
    { id: 3, title: 'UI/UX Designer', company: 'Company C' },
  ];

  return (
    <OfferContainer>
      {offers.map((offer) => (
        <OfferCard key={offer.id}>
          <h3>{offer.title}</h3>
          <p>{offer.company}</p>
        </OfferCard>
      ))}
    </OfferContainer>
  );
};

export default OfferList;
"@

# Create Footer.tsx
Write-Host "Creating Footer component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\components\Footer.tsx" -Value @"
import React from 'react';
import styled from 'styled-components';

const FooterContainer = styled.footer\`
  text-align: center;
  padding: 1rem;
  background-color: #333;
  color: white;
\`;

const Footer = () => {
  return (
    <FooterContainer>
      <p>&copy; 2023 Xerion Jobs. All rights reserved.</p>
    </FooterContainer>
  );
};

export default Footer;
"@

# Output success message
Write-Host "React application layout generated successfully at $projectDir" -ForegroundColor Green
Write-Host "Navigate to the project directory and start the app with 'npm start'." -ForegroundColor Cyan
