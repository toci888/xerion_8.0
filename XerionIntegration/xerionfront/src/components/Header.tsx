import React from 'react';
import styled from 'styled-components';

const HeaderContainer = styled.header\
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #4CAF50;
  padding: 1rem 2rem;
  color: white;
\;

const NavLinks = styled.nav\
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
\;

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
