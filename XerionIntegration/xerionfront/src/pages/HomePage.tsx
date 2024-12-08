import React from 'react';
import styled from 'styled-components';

const Title = styled.h1\
  color: #4CAF50;
  text-align: center;
\;

const HomePage = () => {
  return (
    <div>
      <Title>Welcome to Xerion</Title>
      <p style={{ textAlign: 'center' }}>Explore the best features of our application.</p>
    </div>
  );
};

export default HomePage;
