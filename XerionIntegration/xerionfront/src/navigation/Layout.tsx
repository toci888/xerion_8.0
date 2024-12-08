import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const Container = styled.div\
  display: flex;
  flex-direction: column;
  height: 100vh;
\;

const Header = styled.header\
  background-color: #4CAF50;
  padding: 1rem;
  color: white;
  text-align: center;
  font-size: 1.5rem;
\;

const Nav = styled.nav\
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
\;

const Main = styled.main\
  flex-grow: 1;
  padding: 1rem;
  background-color: #f9f9f9;
\;

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
