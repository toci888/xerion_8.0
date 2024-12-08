import React from 'react';
import styled from 'styled-components';

const FooterContainer = styled.footer\
  text-align: center;
  padding: 1rem;
  background-color: #333;
  color: white;
\;

const Footer = () => {
  return (
    <FooterContainer>
      <p>&copy; 2023 Xerion Jobs. All rights reserved.</p>
    </FooterContainer>
  );
};

export default Footer;
